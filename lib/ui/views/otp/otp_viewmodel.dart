import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/enum/dialog_type.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:vewin/core/models/regiseter_verified_otp_model.dart';
import 'package:vewin/core/models/register_model.dart';
import 'package:vewin/services/api_service.dart';

class OtpViewModel extends BaseViewModel with NavigationMixin {
  OtpViewModel() {
    _registerResponse = RegisterResponse();
  }

  final _apiService = ApiService.init();
  final _dialogService = locator<DialogService>();

  late RegisterResponse _registerResponse;
  late VerifiedOtpResponse _verifiedOtpResponse;
  final VerifiedOtpRequest _verifiedOtpRequest = VerifiedOtpRequest();

  VerifiedOtpRequest get verifiedOtpRequest => _verifiedOtpRequest;
  final _sharedPreference = locator<SharedPreferences>();

  RegisterResponse get registerResponse => _registerResponse;

  String get mobile => _sharedPreference.getString('mobile') ?? '';
  String get otp => _sharedPreference.getString('otp') ?? '';

  String? _otp;

  String? get otp1 => _otp;

  Future<void> registerOtp() async {
    verifiedOtpRequest.mobile = mobile;
    verifiedOtpRequest.otp = otp1;
    verifiedOtpRequest.modifiedby = 'user';
    verifiedOtpRequest.modifiedon = DateTime.now();
    _verifiedOtpResponse =
        await runBusyFuture(_apiService.otpVerified(verifiedOtpRequest))
            .catchError((err) {
      print(err);
      _dialogService.showCustomDialog(
          variant: DialogType.error,
          description: _verifiedOtpResponse.statusMessage.toString() ??
              'Something went wrong');
    });
    if (!hasError) {
      _verifiedOtpResponse.statusCode == 200;
      succes;
      goToLogin();
      _sharedPreference.clear();
      notifyListeners();
    } else {
      _dialogService.showCustomDialog(
          variant: DialogType.error,
          description: _verifiedOtpResponse.statusMessage.toString());
    }
  }

  void succes(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('success'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(
        variant: DialogType.error, title: "message", description: message);
  }

  void setOtp(String otp) {
    _otp = otp;
    notifyListeners();
  }
}
