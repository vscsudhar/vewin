import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/enum/dialog_type.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:vewin/core/models/update_pass_verify.dart';
import 'package:vewin/services/api_service.dart';

class ResetPasswordViewModel extends BaseViewModel with NavigationMixin {
  ResetPasswordViewModel() {
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
  String? _confirmpass;

  String? get confirmPass => _confirmpass;
  String? get password => _password;

  String get mobile1 => _sharedPreference.getString('phone') ?? '';

  void passconfirm(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Re-Type PassWord Does not match Password'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> updatePassword() async {
    updatePasswordRequest.address = 'a';
    updatePasswordRequest.createdby = 'user';
    updatePasswordRequest.createdon = DateTime.now();
    updatePasswordRequest.email = 'a';
    updatePasswordRequest.id = 0;
    updatePasswordRequest.isdeleted = 'a';
    updatePasswordRequest.mobile = mobile1;
    updatePasswordRequest.modifiedby = 'user';
    updatePasswordRequest.modifiedon = DateTime.now();
    updatePasswordRequest.name = 'a';
    // updatePasswordRequest.password = password;
    updatePasswordRequest.photo = 'a';
    updatePasswordRequest.pincode = 'a';
    updatePasswordRequest.status = 'a';
    updatePasswordRequest.usertype = 'user';
    updatePasswordRequest.vcode = 'user';
    if (updatePasswordRequest.password == confirmPass) {
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
      showErrDialog('Miss Match PassWord');
    }
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(
        variant: DialogType.error, title: "Error", description: message);
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
