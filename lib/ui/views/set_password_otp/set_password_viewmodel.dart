import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/enum/dialog_type.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:vewin/core/models/forgot_pass_otp_verify.dart';
import 'package:vewin/services/api_service.dart';

class SetPasswordViewModel extends BaseViewModel with NavigationMixin {
  SetPasswordViewModel() {
    _forgotPasswordVerifyResponse = ForgotPasswordVerifyResponse();
  }

  final _apiService = ApiService.init();
  final _dialogService = locator<DialogService>();
  final _sharedPreference = locator<SharedPreferences>();

  late ForgotPasswordVerifyResponse _forgotPasswordVerifyResponse;

  ForgotPasswordVerifyResponse get forgotPasswordVerifyResponse => _forgotPasswordVerifyResponse;

  DateTime? get modeDate => DateTime.now();
  String? _mobile;

  String? get mobile => _mobile;

  String get mobile1 => _sharedPreference.getString('phone') ?? '';
  String get otp => _sharedPreference.getString('otp') ?? '';

  String? _otp;

  String? get otp1 => _otp;

  Future<void> sendOtpVerify() async {
    if (otp == otp1) {
      _forgotPasswordVerifyResponse = await runBusyFuture(_apiService.forVerifyOtp(mobile1, otp1.toString())).catchError((err) {
        _dialogService.showCustomDialog(variant: DialogType.error, description: err.toString() ?? 'Something went wrong');
      });
      if (forgotPasswordVerifyResponse.statusCode == 200) {
        goToResetPass();
        notifyListeners();
      } else {
        showErrDialog(forgotPasswordVerifyResponse.statusMessage.toString());
      }
    } else {
      showErrDialog('Wrong OTP');
    }
  }

  void setOtp(String otp) {
    _otp = otp;
    notifyListeners();
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(variant: DialogType.error, title: "Error", description: message);
  }
}
