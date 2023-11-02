import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/enum/dialog_type.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:vewin/core/models/register_model.dart';
import 'package:vewin/services/api_service.dart';

class RegisterViewModel extends BaseViewModel with NavigationMixin {
  RegisterViewModel() {
    _registerRequest = RegisterRequest();
  }

  final _dialogService = locator<DialogService>();
  final _apiService = ApiService.init();

  final _sharedPreference = locator<SharedPreferences>();

  late RegisterRequest _registerRequest;
  RegisterResponse? registerResponse;

  RegisterRequest get registerRequest => _registerRequest;

  String get mobile => _sharedPreference.getString('mobile') ?? '';

  String? _otp;

  String? _password;
  String? _confirmpass;

  String? get confirmPass => _confirmpass;
  String? get password => _password;

  String? get otp => _otp;

  Future<void> registerUser() async {
    print(registerRequest.toJson().toString());
    registerRequest.password = password;
    registerRequest.id = 0;
    registerRequest.usertype = 'user';
    registerRequest.createdby = 'user';
    registerRequest.modifiedby = 'user';
    registerRequest.status = 'active';
    registerRequest.vcode = 'active';
    registerRequest.createdon = DateTime.now();
    registerRequest.modifiedon = DateTime.now();
    registerRequest.isdeleted = '';
    if (registerRequest.password == confirmPass) {
      final response = await runBusyFuture(_apiService.register(registerRequest)).catchError((error, stackTrace) {
        print(error);
        showErrDialog('Register Failed User Already Register');
        return error;
      });
      if (!hasError) {
        _dialogService.showCustomDialog(title: 'Message', description: response.message);
        notifyListeners();
        goToOtpRegister();
      } else {
        showErrDialog(response.message.toString());
      }
      _sharedPreference.setString('mobile', registerRequest.mobile ?? '');
      _sharedPreference.setString('otp', response.otp ?? '');
    } else {
      showErrDialog('Miss Match Re-Type PassWord');
    }
  }

  void passconfirm(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Re-Type PassWord Does not match Password'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void sendOtp(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Otp Send SuccessFully'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(variant: DialogType.error, title: "Error", description: message);
  }

  void setpass(String password) {
    _password = password;
    notifyListeners();
  }

  void confirmpass(String confirmpass) {
    _confirmpass = confirmpass;
    notifyListeners();
  }
}
