import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/enum/dialog_type.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:vewin/core/models/bank_acc_add_model.dart';
import 'package:vewin/services/api_service.dart';

class BankAccountViewModel extends BaseViewModel with NavigationMixin {
  BankAccountViewModel() {
    _bankAccountAddRequest = BankAccountAddRequest();
  }

  final _dialogService = locator<DialogService>();
  final _apiService = ApiService.init();

  final _sharedPreference = locator<SharedPreferences>();

  late BankAccountAddRequest _bankAccountAddRequest;
  BankAccountAddResponse? bankAccountAddResponse;

  BankAccountAddRequest get bankAccountAddRequest => _bankAccountAddRequest;

  String? _accNo;
  String? _confirmaccNo;
  String? _bankname;
  String? _ifsc;
  String? _branch;
  String? _state;

  String? get accNo => _accNo;
  String? get bank => _bankname;
  String? get ifsc => _ifsc;
  String? get branch => _branch;
  String? get state => _state;
  String? get confirmacc => _confirmaccNo;

  Future<void> addBankAccount() async {
    bankAccountAddRequest.createdby = 'user';
    bankAccountAddRequest.createdon = DateTime.now();
    bankAccountAddRequest.id = 0;
    bankAccountAddRequest.isdeleted = 'a';
    bankAccountAddRequest.modifiedby = 'user';
    bankAccountAddRequest.modifiedon = DateTime.now();
    if (bankAccountAddRequest.accNo == confirmacc) {
      final bankAccountAddResponse =
          await runBusyFuture(_apiService.addBank(bankAccountAddRequest))
              .catchError((err) {
        log(err);
        _dialogService.showCustomDialog(
            variant: error, title: 'Error', description: err.toString());
      });
      if (bankAccountAddResponse.statusCode == 200) {
        goToWalletInfo();
        notifyListeners();
      } else {
        showErrDialog(bankAccountAddResponse.statusMessage.toString());
      }
    } else {
      showErrDialog('Account Number & Re-Type Account Number does not Match');
    }
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(
        variant: DialogType.error, title: "Error", description: message);
  }

  void confirmAcc(String confirmaccNo) {
    _confirmaccNo = confirmaccNo;
    notifyListeners();
  }
}
