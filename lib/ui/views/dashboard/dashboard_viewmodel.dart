import 'dart:convert';
import 'dart:typed_data';

import 'package:intl/intl.dart';
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
import 'package:vewin/core/models/profile_imageUpdate_model.dart';
import 'package:vewin/services/api_service.dart';
import 'package:vewin/services/user_authentication_service.dart';

class DashboardViewModel extends BaseViewModel with NavigationMixin {
  DashboardViewModel() {
    monthlySale();
    customerListCount();
    bestPerformName();
    updateProfileImage();
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
  final List<ProfileImageUpdateResponse> _profileImageUpdateResponse = [];

  MonthlySaleResponse? get monthlySaleResponse => _monthlySaleResponse;
  // List<Announcement>? get annoncement => _userAuthenticationService.loginResponse.dashboard?.announcements = [];
  List<CustomersCount> get customerCount => _customerListCountResponse?.customersCount ?? [];
  List<Totalcustomer> get totalcustomer => _customerListCountResponse?.totalcustomer ?? [];
  List<AppSalesList> get appSale => _monthlySaleResponse?.appSalesList ?? [];
  List<Totalsale> get totalsale => _monthlySaleResponse?.totalsale ?? [];
  List<BestPerformerResponse> get bestPerformerResponse => _bestPerformerResponse;
  List<ProfileImageUpdateResponse> get profileImageUpdateResponse => _profileImageUpdateResponse;

  List<String> get appName => appSale.map((appElement) => appElement.appName.toString()).toSet().toList();
  List<String> get salesAmt => appSale.map((appElement) => appElement.sales.toString()).toSet().toList();
  List<String> get total => totalsale.map((appElement) => appElement.totalSale.toString()).toSet().toList();
  List<String> get customerApp => customerCount.map((appElement) => appElement.appName.toString()).toSet().toList();
  List<String> get customerApptotal => totalcustomer.map((appElement) => appElement.totalCustomers.toString()).toSet().toList();
  List<String> get bestperformName => bestPerformerResponse.map((e) => e.name.toString()).toSet().toList();
  List<String> get bestperformImage => bestPerformerResponse.map((e) => e.photo.toString()).toSet().toList();
  List<String> get bestperformSales => bestPerformerResponse.map((e) => e.sales.toString()).toSet().toList();
  List<String> get upDateImage => profileImageUpdateResponse.map((e) => e.profile.toString()).toSet().toList();

  final now = DateTime.now();
  DateTime get fromDate => DateTime(now.year, now.month, 1);
  DateTime get toDate => DateTime(now.year, now.month + 1, 0);

  final dateFormatter = DateFormat('yyyy-MM-dd');
  String get formattedFirstDate => dateFormatter.format(fromDate);
  String get formattedLastDate => dateFormatter.format(toDate);

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void currentIndex1(int index) {
    notifyListeners();
    _currentIndex = index;
  }

  String get token => _sharedPreference.getString('token') ?? '';
  String get updateImage1 => _sharedPreference.getString('updateProfile').toString();
  List<Announcement> get annoncement {
    final loginRes = json.decode(_sharedPreference.getString('annoncement') ?? "[{}]");
    var dashboard = LoginResponse.fromJson(loginRes);
    final announcement = dashboard.dashboard?.announcements ?? [];
    return announcement;
  }

  List<Banner> get banner {
    final loginbanner = json.decode(_sharedPreference.getString('annoncement') ?? "[{}]");
    var dashboard = LoginResponse.fromJson(loginbanner);
    final banner = dashboard.dashboard?.banners ?? [];
    return banner;
  }

  Uint8List get banners => const Base64Decoder().convert(banner.toString());

  String get name => _sharedPreference.getString('name') ?? '';
  String get id => _sharedPreference.getString('id') ?? '';
  String get photo => _sharedPreference.getString('photo') ?? '';
  // Uint8List get photo => const Base64Decoder().convert(_sharedPreference.getString('photo') ?? '');

  Future<void> logout() async {
    _sharedPreference.clear();
    goToLogin();
  }

  Future<void> monthlySale() async {
    _monthlySaleResponse = await runBusyFuture(_apiService.monthlySaleRes(MonthlySaleRequest(fromDate: fromDate, id: int.parse(id), toDate: toDate))).catchError((err) {
      print(err);
    });
    if (hasError) {
      logout();
      // showErrDialog('Something went Wrong');
    } else {}
  }

  Future<void> customerListCount() async {
    _customerListCountResponse = await runBusyFuture(_apiService.getCustomerCount(int.parse(id))).catchError((err) {
      print(err);
    });
    if (hasError) {
      // showErrDialog('Something went Wrong');
    } else {}
  }

  Future<void> bestPerformName() async {
    _bestPerformerResponse = await runBusyFuture(_apiService.getBestPerformer()).catchError((err) {
      print(err);
    });
    if (hasError) {
      // showErrDialog('Something went Wrong');
    } else {}
  }

  Future<void> updateProfileImage() async {
    final updateresponse = await runBusyFuture(_apiService.updateProfileImage(id)).catchError((err) {
      print(err);
    });
    print(updateresponse.profile.toString());
    _sharedPreference.setString('updateProfile', updateresponse.profile.toString());
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(variant: DialogType.error, title: "Message", description: message);
  }
}
// http://vewin.vewinpro.com/api/Profile/1001.jpeg
