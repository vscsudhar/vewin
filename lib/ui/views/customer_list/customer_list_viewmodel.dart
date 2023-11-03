import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/enum/dialog_type.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:vewin/core/models/customer_list_model.dart';
import 'package:vewin/services/api_service.dart';
import 'package:vewin/services/user_authentication_service.dart';

class CustomerListViewModel extends BaseViewModel with NavigationMixin {
  CustomerListViewModel() {
    customerListCount();
  }

  final _apiService = ApiService.init();
  final _dialogService = locator<DialogService>();
  final _sharedPreference = locator<SharedPreferences>();
  final _userAuthenticationService = locator<UserAuthenticationService>();
  String? _applicationPick;

  CustomerListCountResponse? _customerListCountResponse;
  CustomerListCountResponse? get  customerListCountResponse => _customerListCountResponse;
  List<CustomersCount> get customerCount => _customerListCountResponse?.customersCount ?? [];
  List<Totalcustomer> get totalcustomer => _customerListCountResponse?.totalcustomer ?? [];

  List<String> get customerApp => customerCount.map((appElement) => appElement.appName.toString()).toSet().toList();
  List<String> get customersCount => customerCount.map((appElement) => appElement.count.toString()).toSet().toList();
  List<String> get customerApptotal => totalcustomer.map((appElement) => appElement.totalCustomers.toString()).toSet().toList();

    String get id => _sharedPreference.getString('id') ?? '';


  Future<void> customerListCount() async {
    _customerListCountResponse = await runBusyFuture(_apiService.getCustomerCount(int.parse(id))).catchError((err) {
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

  appPick(applicationPick) {
    _applicationPick = applicationPick;
    notifyListeners();
    _sharedPreference.setString('applicationName', applicationPick ?? '');
    goToAppCustomerList();
  }
}
