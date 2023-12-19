import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/enum/dialog_type.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:vewin/core/models/update_pass_verify.dart';
import 'package:vewin/services/api_service.dart';

class ChangePasswordViewModel extends BaseViewModel with NavigationMixin {
  ChangePasswordViewModel() {
    _updatePasswordRequest = UpdatePasswordRequest();
  }
  final _dialogService = locator<DialogService>();
  final _apiService = ApiService.init();

  final _sharedPreference = locator<SharedPreferences>();

  late final UpdatePasswordRequest _updatePasswordRequest;
  UpdatePasswordResponse? _updatePasswordResponse;

  UpdatePasswordRequest get updatePasswordRequest => _updatePasswordRequest;
  UpdatePasswordResponse? get updatePasswordResponse => _updatePasswordResponse;

  String? _password;
  String? _oldpass;

  String? get oldpass => _oldpass;
  String? get password => _password;

  String get mobile1 => _sharedPreference.getString('mobile') ?? '';
  String get oldpassword => _sharedPreference.getString('password') ?? '';

  void passconfirm(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Re-Type PassWord Does not match Password'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void oldpassconfirm(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Old PassWord Does not match'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> updatePassword() async {
    updatePasswordRequest.mobile = mobile1;
    updatePasswordRequest.modifiedby = 'user';
    updatePasswordRequest.modifiedon = DateTime.now();
    if (updatePasswordRequest.password == oldpass) {
      final updateresponse =
          await runBusyFuture(_apiService.updatePass(updatePasswordRequest))
              .catchError((err, stackTrace) {
        print(err);
        showErrDialog('Something Went Wrong');
        return err;
      });
      if (!hasError) {
        _dialogService.showCustomDialog(
            title: 'message',
            description: updateresponse.statusMessage.toString());
        updateresponse.statusCode == 200;
        notifyListeners();
        goToLogin();
        _sharedPreference.clear();
      } else {
        _dialogService.showCustomDialog(
            title: 'message',
            description: updateresponse.statusMessage.toString());
      }
    } else {
      showErrDialog('Miss Match Password');
    }
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(
        variant: DialogType.error, title: "Error", description: message);
  }

  void oldPass1(String oldpass) {
    _oldpass = oldpass;
    notifyListeners();
  }
}
