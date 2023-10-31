import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:vewin/services/user_authentication_service.dart';

class StartupViewModel extends BaseViewModel with NavigationMixin {
  StartupViewModel() {
    userAutoLogin();
  }
  final _userAuthenticationService = locator<UserAuthenticationService>();
  late SharedPreferences _sharedPreference;

  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    _navigationService.replaceWithHomeView();
  }

  Future<void> userAutoLogin() async {
    _sharedPreference = await SharedPreferences.getInstance();
    String mobile = _sharedPreference.getString('mobile') ?? '';
    String password = _sharedPreference.getString('password') ?? '';

    await Future.delayed(const Duration(seconds: 3), () {
      if (mobile.isEmpty || password.isEmpty) {
        goToLogin();
      } else {
        _userAuthenticationService.login(mobile, password);
      }
    });
  }
}
