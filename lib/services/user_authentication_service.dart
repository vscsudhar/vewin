import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/enum/dialog_type.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:vewin/core/models/login_response_model.dart';
import 'package:vewin/services/api_service.dart';

class UserAuthenticationService with NavigationMixin {
  final _dio = Dio();
  final _dialogService = locator<DialogService>();
  final _sharedPreference = locator<SharedPreferences>();

  LoginResponse? _loginResponse;
  Dashboard? _dashboard;
  String get token => _loginResponse?.token ?? 'Empty token';
  String get userCredentials => _sharedPreference.getString('mobile') ?? '';

    LoginResponse get loginResponse => _loginResponse ?? LoginResponse();


  Future<dynamic> login(String mobile, String password) async {
    _loginResponse = await locator<ApiService>().login(mobile, password).catchError((e) {
      _dialogService.showCustomDialog(variant: DialogType.error, description: e.toString());
      return e;
    });
    _sharedPreference.setString('mobile', mobile ?? '');
    _sharedPreference.setString('password', password ?? '');
    if (_loginResponse?.token != null) {
      log('token : ' + (_loginResponse?.token ?? ''));
      _sharedPreference.setString('name', _loginResponse?.dashboard?.name ?? '');
      _sharedPreference.setString('id', _loginResponse?.dashboard?.id.toString() ?? '');
      // _sharedPreference.setString('annoncement', json.encode(_loginResponse?.annoncement));
      _sharedPreference.setString('usertype', _loginResponse?.dashboard?.userType ?? '');
      _sharedPreference.setString('mobile', _loginResponse?.dashboard?.mobile ?? '');
      _sharedPreference.setString('photo', _loginResponse?.dashboard?.photo ?? '');
      goToDashboard();
    } else {
      _dialogService.showCustomDialog(variant: DialogType.error, description: 'Login Failed');
    }
  }
  
  Future<void> refreshSession() async {
    String mobile = _sharedPreference.getString('mobile') ?? '';
    String password = _sharedPreference.getString('password') ?? '';

    await login(mobile , password);
  }
}
