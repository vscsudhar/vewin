import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/enum/dialog_type.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:vewin/core/models/get_sales_details_model.dart';
import 'package:vewin/services/api_service.dart';
import 'package:vewin/services/user_authentication_service.dart';

class GetSalesDetailsViewModel extends BaseViewModel with NavigationMixin {
  GetSalesDetailsViewModel() {
    getSalesDetails();
  }

  final _bottomSheetService = locator<BottomSheetService>();
  final _apiService = ApiService.init();
  final _dialogService = locator<DialogService>();
  final _sharedPreference = locator<SharedPreferences>();
  final _userAuthenticationService = locator<UserAuthenticationService>();

  List<GetSalesDetailsResponse> _getSalesDetailsResponse = [];

  // final List<SalesDetail> _saleDetails = [];

  String? _appPick;
  String? _appName;
  GetSalesDetailsResponse? _getSalesResponse;
  GetSalesDetailsRequest? _getSalesDetailsRequest;

  List<GetSalesDetailsResponse> get salesDetail => _getSalesDetailsResponse;
  List<GetSalesDetailsResponse> get salesDetails => _getSalesDetailsResponse;
  GetSalesDetailsRequest? get getSalesDetailsRequest => _getSalesDetailsRequest;
  final now = DateTime.now();

  String? get appPick => _sharedPreference.getString('appName') ?? '';
  String get id1 => _sharedPreference.getString('id') ?? '';
  String get fdate =>
      _sharedPreference.getString('fromdate') ??
      DateTime(now.year, now.month, 1).toIso8601String();
  String get tdate =>
      _sharedPreference.getString('todate') ?? DateTime.now().toIso8601String();

  List<String> get name =>
      salesDetails.map((element) => element.name.toString()).toSet().toList();
  List<String> get id =>
      salesDetails.map((element) => element.id.toString()).toSet().toList();
  List<String> get amount =>
      salesDetails.map((element) => element.amount.toString()).toSet().toList();
  List<String> get saleDate =>
      salesDetails.map((element) => element.date.toString()).toSet().toList();

  Future<void> getSalesDetails() async {
    _getSalesDetailsResponse = await runBusyFuture(_apiService.getSalesDetails(
            GetSalesDetailsRequest(
                appName: appPick,
                fromDate: DateTime.parse(fdate),
                id: int.parse(id1),
                toDate: DateTime.parse(tdate))))
        .catchError((err) {});
    if (hasError) {
      showErrDialog('Something went Wrong');
    } else {}
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(
        variant: DialogType.error, title: "Message", description: message);
  }
}
