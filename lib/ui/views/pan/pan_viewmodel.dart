import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/enum/dialog_type.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:vewin/core/models/pan_add_model.dart';
import 'package:vewin/services/api_service.dart';

class PanViewModel extends BaseViewModel with NavigationMixin {
  PanViewModel() {
    _panAddRequest = PanAddRequest();
  }

  final _dialogService = locator<DialogService>();
  final _apiService = ApiService.init();

  final _sharedPreference = locator<SharedPreferences>();

  late PanAddRequest _panAddRequest;
  PanNoAddResponse? panNoAddResponse;

  PanAddRequest get panAddRequest => _panAddRequest;

  String? _name;
  String? _pan;
  DateTime? _dob;

  String? get name => _name;
  String? get pan => _pan;
  DateTime get dob => _dob ?? DateTime(1996);

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      _dob = pickedDate;
      notifyListeners();
    }
  }

  Future<void> panAddDetails() async {
    panAddRequest.createdby = 'user';
    panAddRequest.createdon = DateTime.now();
    panAddRequest.dob = dob;
    panAddRequest.id = 0;
    panAddRequest.isdeleted = 'a';
    panAddRequest.modifiedby = 'user';
    panAddRequest.modifiedon = DateTime.now();
    panAddRequest.pan = pan;
    final panNoAddResponse = await runBusyFuture(_apiService.panAdd(panAddRequest)).catchError((err) {
      print(err);
      _dialogService.showDialog(title: 'Error', description: 'PAN Add Failed');
    });
    if (panNoAddResponse.statusCode == 200) {
      goToWalletInfo();
    } else {
      showErrDialog(panNoAddResponse.statusMessage.toString());
    }
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(variant: DialogType.error, title: "Error", description: message);
  }

  void panlength(String pan) {
    if (pan.length == 10) {
      _pan = pan;
      notifyListeners();
    } else {
      showErrDialog('Pan 10 digit Must');
    }
  }
}
