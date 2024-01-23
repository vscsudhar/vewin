import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/enum/dialog_type.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:vewin/core/models/monthly_sale_model.dart';
import 'package:vewin/services/api_service.dart';
import 'package:vewin/services/user_authentication_service.dart';

class SalesViewModel extends BaseViewModel with NavigationMixin {
  SalesViewModel() {
    _monthlySaleRequest = MonthlySaleRequest();
    monthlySale();
  }

  final _bottomSheetService = locator<BottomSheetService>();
  final _apiService = ApiService.init();
  final _dialogService = locator<DialogService>();
  final _sharedPreference = locator<SharedPreferences>();
  final _userAuthenticationService = locator<UserAuthenticationService>();

  String? _appPick;
  String? _appName;
  bool? _isvalid;

  bool? get isvalid => _isvalid;

  MonthlySaleResponse? monthlySaleResponse;
  late MonthlySaleRequest _monthlySaleRequest;

  MonthlySaleRequest? get monthlySaleRequest => _monthlySaleRequest;
  // MonthlySaleResponse? get monthlySaleResponse => _monthlySaleResponse;

  final List<AppSalesList> _appList = [];
  final List<AppSalesList> _total = [];
  final List<Totalsale> _totalsale1 = [];

  List<AppSalesList> get applist => _appList;
  List<AppSalesList> get total => _total;
  List<Totalsale> get totalsaleamt => monthlySaleResponse?.totalsale ?? [];

  List<AppSalesList> get appList => monthlySaleResponse?.appSalesList ?? [];
  List<AppSalesList> get totalsale => monthlySaleResponse?.appSalesList ?? [];

  List<int?> get totalSaleAmt =>
      totalsaleamt.map((e) => e.totalSale?.toInt()).toSet().toList();
  List<String> get appname => appList
      .map((appElement) => appElement.appName.toString())
      .toSet()
      .toList();
  List<String> get salesAmt =>
      appList.map((appElement) => appElement.sales.toString()).toSet().toList();

  String get token => _sharedPreference.getString('token') ?? '';
  String get id => _sharedPreference.getString('id') ?? '';

  Future<void> monthlySale() async {
    monthlySaleResponse = await runBusyFuture(_apiService.monthlySaleRes(
            MonthlySaleRequest(
                fromDate: fromDate, id: int.parse(id), toDate: toDate)))
        .catchError((err) {
      print(err);
      if (hasError) {
        goToSales();
        showErrDialog('Data is Not Available');
      }
    });
    if (!hasError) {
      // goToSalesList();
    } else {
      showErrDialog('Data is Not Available');
    }
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(
        variant: DialogType.error, title: "Message", description: message);
  }

  final now = DateTime.now();

  DateTime? _fromDate;
  DateTime? _toDate;
  DateTime get fromDate => _fromDate ?? DateTime(now.year, now.month, 1);
  // DateTime get fromDate => _ fromDate ?? DateTime(now.year, now.month, 1);

  DateTime get toDate => _toDate ?? DateTime.now();

  String get fDate =>
      fromDate.toIso8601String(); //DateFormat('MM-dd-yyyy').format(fromDate);
  String get tDate =>
      toDate.toIso8601String(); //DateFormat('MM-dd-yyyy').format(toDate);

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
    _sharedPreference.setString('fromdate', fDate ?? '');
  }

  Future<void> selectToDate(BuildContext context) async {
    final DateTime? toDate = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year, now.month, 1),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );

    if (toDate != null) {
      _toDate = toDate ?? DateTime.now();

      notifyListeners();
    }
    _sharedPreference.setString('todate', tDate ?? '');
  }

  appPick(appPick) {
    _appPick = appPick;
    notifyListeners();
    goToGetSalesList();
    _sharedPreference.setString('appName', appPick ?? '');
  }

  void datepicks() {
    monthlySale();
    // _isvalid = true;
    notifyListeners();
  }

  void notFound(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content:
            Text('There was No sales History Please Valid FromDate and TODate'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> monthlySales() async {
    monthlySaleResponse = await runBusyFuture(_apiService.monthlySaleRes(
            MonthlySaleRequest(
                fromDate: fromDate, id: int.parse(id), toDate: toDate)))
        .catchError((err) {
      print(err);
    });
    if (hasError) {
      showErrDialog('Something went Wrong');
    } else {}
  }
}
