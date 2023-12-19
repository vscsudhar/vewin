import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/enum/dialog_type.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:vewin/core/models/forgot_pass_mobile_otp.dart';
import 'package:vewin/services/api_service.dart';

class ForgotPasswordViewModel extends BaseViewModel with NavigationMixin {
  ForgotPasswordViewModel() {
    _forgotPasswordRequest = ForgotPasswordRequest();
  }

  final _apiService = ApiService.init();
  final _dialogService = locator<DialogService>();
  final _sharedPreference = locator<SharedPreferences>();

  String? _mobile;
  String? _otp;

  String? get otp1 => _otp;
  String? get mobile => _mobile;
  // String? get mobile1 => _sharedPreference.getString('mobile') ?? '';
  String? get otp => _sharedPreference.getString('otp') ?? '';

  late final ForgotPasswordRequest _forgotPasswordRequest;
  ForgotPasswordResponse? _forgotPasswordResponse;

  ForgotPasswordRequest get forgotPasswordRequest => _forgotPasswordRequest;
  ForgotPasswordResponse? get forgotPasswordResponse => _forgotPasswordResponse;
// 745227216

  Future<void> mobileNoVerified() async {
    forgotPasswordRequest.mobile = mobile;
   
    forgotPasswordRequest.modifiedby = 'user';
    forgotPasswordRequest.modifiedon = DateTime.now();
    final response =
        await runBusyFuture(_apiService.forPass(forgotPasswordRequest))
            .catchError((err) {
      print(err);
      showErrDialog('your Not Active Please try again After Active');
      return err;
    });
    if (!hasError) {
      sendOtp;
      notifyListeners();
      goToSetPassOtp();
    } else {
      showErrDialog('try Again Later');
    }
    _sharedPreference.setString('phone', mobile ?? '');
    _sharedPreference.setString('otp', response.otp ?? '');
  }

  void setMobile(String mobile) {
    _mobile = mobile;
    notifyListeners();
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(
        variant: DialogType.error, title: "Error", description: message);
  }

  void sendOtp(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Otp Send SuccessFully'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
