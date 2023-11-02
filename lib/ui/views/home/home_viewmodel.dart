import 'package:shared_preferences/shared_preferences.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/services/user_authentication_service.dart';

class HomeViewModel extends BaseViewModel with NavigationMixin {
  HomeViewModel() {
    init();
  }
  init() async {
    _sharedPreference = await SharedPreferences.getInstance();
  }

  final _dialogService = locator<DialogService>();
  late SharedPreferences _sharedPreference;
  String? _mobile;
  String? _password;

  final _userAuthenticationService = locator<UserAuthenticationService>();

  String get mobile => _mobile ?? '';
  String get password => _password ?? '';

  void userLogin() async {
    if (mobile.length == 10) {
        setBusy(true);
        notifyListeners();
        await _userAuthenticationService.login(mobile, password);
        setBusy(false);
        final token = _userAuthenticationService.loginResponse.token;
        if (token != null) {
          _sharedPreference.setString('token', token);
        } else {
          showErrDialog('login failed');
        }
      } else {
        showErrDialog('Please Check Your Mobile Number (or) it should be 10 digit');
    }
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(title: "Message", description: message);
  }

  void setMobile(String mobile) {
    _mobile = mobile;
    notifyListeners();
  }

  void setPass(String password) {
    _password = password;
    notifyListeners();
  }
}
