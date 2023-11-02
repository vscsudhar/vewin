import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/enum/dialog_type.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:vewin/core/models/best_performer_model.dart';
import 'package:vewin/core/models/customer_list_model.dart';
import 'package:vewin/core/models/login_response_model.dart';
import 'package:vewin/core/models/monthly_sale_model.dart';
import 'package:vewin/services/api_service.dart';
import 'package:vewin/services/user_authentication_service.dart';

class DashboardViewModel extends BaseViewModel with NavigationMixin {
  DashboardViewModel() {
    monthlySale();
    customerListCount();
    bestPerformName();
  }

  final _apiService = ApiService.init();
  final _dialogService = locator<DialogService>();
  final _sharedPreference = locator<SharedPreferences>();
  final _userAuthenticationService = locator<UserAuthenticationService>();

  LoginResponse? get loginResponse => _userAuthenticationService.loginResponse;
  Dashboard? get dashboard => _userAuthenticationService.loginResponse.dashboard;
  MonthlySaleResponse? _monthlySaleResponse;
  CustomerListCountResponse? _customerListCountResponse;
  List<BestPerformerResponse> _bestPerformerResponse = [];

  // List<Announcement>? get annoncement => _userAuthenticationService.loginResponse.dashboard?.announcements = [];
  List<CustomersCount> get customerCount => _customerListCountResponse?.customersCount ?? [];
  List<Totalcustomer> get totalcustomer => _customerListCountResponse?.totalcustomer ?? [];
  List<AppSalesList> get appSale => _monthlySaleResponse?.appSalesList ?? [];
  List<Totalsale> get totalsale => _monthlySaleResponse?.totalsale ?? [];
  List<BestPerformerResponse> get bestPerformerResponse => _bestPerformerResponse;

  List<String> get appName => appSale.map((appElement) => appElement.appName.toString()).toSet().toList();
  List<String> get salesAmt => appSale.map((appElement) => appElement.sales.toString()).toSet().toList();
  List<String> get total => totalsale.map((appElement) => appElement.totalSale.toString()).toSet().toList();
  List<String> get customerApp => customerCount.map((appElement) => appElement.appName.toString()).toSet().toList();
  List<String> get customerApptotal => totalcustomer.map((appElement) => appElement.totalCustomers.toString()).toSet().toList();
  List<String> get bestperformName => bestPerformerResponse.map((e) => e.name.toString()).toSet().toList();
  List<String> get bestperformImage => bestPerformerResponse.map((e) => e.photo.toString()).toSet().toList();
  List<String> get bestperformSales => bestPerformerResponse.map((e) => e.sales.toString()).toSet().toList();

  String get token => _sharedPreference.getString('token') ?? '';
  List<Announcement> get annoncement {
    var json1 = {"annoncement": json.decode(_sharedPreference.getString('annoncement') ?? "[{}]")};
    return Dashboard.fromJson(json1).announcements ?? [];
  }

  String get name => _sharedPreference.getString('name') ?? '';
  String get id => _sharedPreference.getString('id') ?? '';
  String get photo => _sharedPreference.getString('photo') ?? '';

  Future<void> logout() async {
    _sharedPreference.clear();
    goToLogin();
  }

  Future<void> monthlySale() async {
    _monthlySaleResponse = await runBusyFuture(_apiService.monthlySaleRes()).catchError((err) {
      print(err);
      showErrDialog('Something went Wrong');
    });
    if (hasError) {
      showErrDialog('Something went Wrong');
    } else {}
  }

  Future<void> customerListCount() async {
    _customerListCountResponse = await runBusyFuture(_apiService.getCustomerCount()).catchError((err) {
      print(err);
      showErrDialog('Something went Wrong');
    });
    if (hasError) {
      showErrDialog('Something went Wrong');
    } else {}
  }

  Future<void> bestPerformName() async {
    _bestPerformerResponse = await runBusyFuture(_apiService.getBestPerformer()).catchError((err) {
      print(err);
      showErrDialog('Something went Wrong');
    });
    if (hasError) {
      showErrDialog('Something went Wrong');
    } else {}
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(variant: DialogType.error, title: "Message", description: message);
  }
}
