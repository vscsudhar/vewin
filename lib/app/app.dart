import 'package:vewin/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:vewin/ui/views/home/home_view.dart';
import 'package:vewin/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/ui/views/register/register_view.dart';
import 'package:vewin/ui/views/dashboard/dashboard_view.dart';
import 'package:vewin/ui/views/change_password/change_password_view.dart';
import 'package:vewin/ui/views/profile/profile_view.dart';
import 'package:vewin/ui/views/sales/sales_view.dart';
import 'package:vewin/ui/views/best_performer/best_performer_view.dart';
import 'package:vewin/ui/views/customer_list/customer_list_view.dart';
import 'package:vewin/ui/views/wallet_info/wallet_info_view.dart';
import 'package:vewin/ui/views/pan/pan_view.dart';
import 'package:vewin/ui/views/bank_account/bank_account_view.dart';
import 'package:vewin/ui/views/history/history_view.dart';
import 'package:vewin/ui/views/otp/otp_view.dart';
import 'package:vewin/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vewin/ui/views/forgot_password/forgot_password_view.dart';
import 'package:vewin/ui/views/reset_password/reset_password_view.dart';
import 'package:vewin/ui/views/set_password_otp/set_password_view.dart';
import 'package:vewin/services/user_authentication_service.dart';
import 'package:vewin/ui/views/get_sales_details/get_sales_details_view.dart';
import 'package:vewin/ui/views/app_customer_list/app_customer_list_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: ChangePasswordView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: SalesView),
    MaterialRoute(page: BestPerformerView),
    MaterialRoute(page: CustomerListView),
    MaterialRoute(page: WalletInfoView),
    MaterialRoute(page: PanView),
    MaterialRoute(page: BankAccountView),
    MaterialRoute(page: HistoryView),
    MaterialRoute(page: OtpView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: ResetPasswordView),
    MaterialRoute(page: SetPasswordView),
    MaterialRoute(page: GetSalesDetailsView),
    MaterialRoute(page: AppCustomerListView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    // LazySingleton(classType: UserAuthenticationService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService, resolveUsing: ApiService.init),
    Presolve(
        classType: SharedPreferences,
        presolveUsing: SharedPreferences.getInstance),
    LazySingleton(classType: UserAuthenticationService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  // dialogs: [
  //   StackedDialog(classType: InfoAlertDialog),
  //   // @stacked-dialog
  // ],
)
class App {}
