import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/enum/dialog_type.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:vewin/core/models/customer_list_details.dart';
import 'package:vewin/services/api_service.dart';
import 'package:vewin/services/user_authentication_service.dart';

class AppCustomerListViewModel extends BaseViewModel with NavigationMixin {
  AppCustomerListViewModel() {
    getCustomerAppDetails();
  }

  final _bottomSheetService = locator<BottomSheetService>();
  final _apiService = ApiService.init();
  final _dialogService = locator<DialogService>();
  final _sharedPreference = locator<SharedPreferences>();
  final _userAuthenticationService = locator<UserAuthenticationService>();

  List<CustomerListDetailsResponse> _customerListDetailsResponse = [];

  String? _applicationPick;
  String? _appName;

  List<CustomerListDetailsResponse> get name => _customerListDetailsResponse;
  // List<CustomerListDetailsResponse> get area => _customerListDetailsResponse;

  String? get appPickup => _sharedPreference.getString('applicationName') ?? '';
  String get id => _sharedPreference.getString('id') ?? '';


  List<String> get appname => _customerListDetailsResponse.map((element) => element.name.toString()).toSet().toList();
  List<String> get custarea => _customerListDetailsResponse.map((element) => element.area.toString()).toSet().toList();

  Future<void> getCustomerAppDetails() async {
    _customerListDetailsResponse = await runBusyFuture(_apiService.getCustomerDetails(appPickup.toString(), int.parse(id))).catchError((err) {});
    if (hasError) {
      showErrDialog('Something went Wrong');
    } else {}
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(variant: DialogType.error, title: "Message", description: message);
  }
}
