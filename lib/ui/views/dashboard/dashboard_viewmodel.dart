import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:vewin/services/api_service.dart';

class DashboardViewModel extends BaseViewModel with NavigationMixin {
  DashboardViewModel() {}

  final _apiService = ApiService.init();
  final _dialogService = locator<DialogService>();
  final _sharedPreference = locator<SharedPreferences>();


  String get name => _sharedPreference.getString('name') ?? '';
  String get id => _sharedPreference.getString('id') ?? '';

  
  Future<void> logout() async {
    _sharedPreference.clear();
    goToLogin();
  }
}
