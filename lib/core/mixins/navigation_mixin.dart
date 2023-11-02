import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/app/app.router.dart';

mixin NavigationMixin {
  final NavigationService _navigationService = locator<NavigationService>();

  void goToLogin() => _navigationService.clearStackAndShow(Routes.homeView);
  void goToWalletInfo() => _navigationService.navigateTo(Routes.walletInfoView);
  void goToCustomerList() =>
      _navigationService.navigateTo(Routes.customerListView);
  void goToBestPerformer() =>
      _navigationService.navigateTo(Routes.bestPerformerView);
  void goToChangePassword() =>
      _navigationService.navigateTo(Routes.changePasswordView);
  void goToDashboard() =>
      _navigationService.clearStackAndShow(Routes.dashboardView);
  void goToRegister() => _navigationService.navigateTo(Routes.registerView);
  void goToGetSalesList() =>
      _navigationService.navigateTo(Routes.getSalesDetailsView);
  void goToProfile() => _navigationService.navigateTo(Routes.profileView);
  void goToAppCustomerList() => _navigationService.navigateTo(Routes.appCustomerListView);
  void goToSales() => _navigationService.navigateTo(Routes.salesView);
  void goToPan() => _navigationService.navigateTo(Routes.panView);
  void goToHistory() => _navigationService.navigateTo(Routes.historyView);
  void goToBankAccount() =>
      _navigationService.navigateTo(Routes.bankAccountView);
  void goToOtpRegister() => _navigationService.navigateTo(Routes.otpView);
  void goToForgotPass() =>
      _navigationService.navigateTo(Routes.forgotPasswordView);
  void goToResetPass() =>
      _navigationService.replaceWith(Routes.resetPasswordView);
  void goToSetPassOtp() =>
      _navigationService.replaceWith(Routes.setPasswordView);
}
