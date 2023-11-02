import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/enum/dialog_type.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:vewin/core/models/get_sales_details_model.dart';
import 'package:vewin/core/models/monthly_sale_model.dart';
import 'package:vewin/services/api_service.dart';
import 'package:vewin/services/user_authentication_service.dart';

class SalesViewModel extends BaseViewModel with NavigationMixin {
  SalesViewModel() {
    monthlySale();
  }

  final _bottomSheetService = locator<BottomSheetService>();
  final _apiService = ApiService.init();
  final _dialogService = locator<DialogService>();
  final _sharedPreference = locator<SharedPreferences>();
  final _userAuthenticationService = locator<UserAuthenticationService>();

  String? _appPick;
  String? _appName;

  MonthlySaleResponse? _monthlySaleResponse;

  final List<AppSalesList> _appList = [];
  final List<AppSalesList> _total = [];

  List<AppSalesList> get applist => _appList;
  List<AppSalesList> get total => _total;

  List<AppSalesList> get appList => _monthlySaleResponse?.appSalesList ?? [];
  List<AppSalesList> get totalsale => _monthlySaleResponse?.appSalesList ?? [];

  List<String> get appname => appList
      .map((appElement) => appElement.appName.toString())
      .toSet()
      .toList();
  List<String> get salesAmt =>
      appList.map((appElement) => appElement.sales.toString()).toSet().toList();

  String get token => _sharedPreference.getString('token') ?? '';

  // Future<void> monthlyapp() async {
  //   setBusy(true);
  //   _appList = await _apiService.monthlySaleRes().catchError((err) {});
  // }

  Future<void> monthlySale() async {
    _monthlySaleResponse =
        await runBusyFuture(_apiService.monthlySaleRes()).catchError((err) {
      print(err);
      showErrDialog('Something went Wrong');
    });
    if (hasError) {
      showErrDialog('Something went Wrong');
    } else {}
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(
        variant: DialogType.error, title: "Message", description: message);
  }

  DateTime? _fromDate;
  DateTime? _toDate;
  DateTime get fromDate => _fromDate ?? DateTime.now();
  DateTime get toDate => _toDate ?? DateTime.now();

  Future<void> selectFromDate(BuildContext context) async {
    final DateTime? fromDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );

    if (fromDate != null) {
      _fromDate = fromDate;
      notifyListeners();
    }
  }
  Future<void> selectToDate(BuildContext context) async {
    final DateTime? toDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );

    if (toDate != null) {
      _toDate = toDate;
      notifyListeners();
    }
  }

  appPick(appPick) {
    _appPick = appPick;
    notifyListeners();
    _sharedPreference.setString('appName', appPick ?? '');
    goToGetSalesList();
  }
}
