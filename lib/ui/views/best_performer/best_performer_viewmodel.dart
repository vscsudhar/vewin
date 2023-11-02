import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/enum/dialog_type.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:vewin/core/models/best_performer_model.dart';
import 'package:vewin/services/api_service.dart';
import 'package:vewin/services/user_authentication_service.dart';

class BestPerformerViewModel extends BaseViewModel with NavigationMixin {
  BestPerformerViewModel() {
    bestPerformName();
  }

  final _apiService = ApiService.init();
  final _dialogService = locator<DialogService>();
  final _sharedPreference = locator<SharedPreferences>();
  final _userAuthenticationService = locator<UserAuthenticationService>();

  List<BestPerformerResponse> _bestPerformerResponse = [];

  List<BestPerformerResponse> get bestPerformerResponse => _bestPerformerResponse;
  List<String> get bestperformName => bestPerformerResponse.map((e) => e.name.toString()).toSet().toList();
  List<String> get bestperformImage => bestPerformerResponse.map((e) => e.photo.toString()).toSet().toList();
  List<String> get bestperformSales => bestPerformerResponse.map((e) => e.sales.toString()).toSet().toList();

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
