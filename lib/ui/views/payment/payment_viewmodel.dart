import 'dart:math';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/enum/dialog_type.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:vewin/core/models/payment_list_model.dart';
import 'package:vewin/services/api_service.dart';

class PaymentViewModel extends BaseViewModel with NavigationMixin {
  PaymentViewModel() {
    // _paymentListRequest = PaymentListRequest();

    paymentListView();
  }

  final _apiService = ApiService.init();
  final _dialogService = locator<DialogService>();
  final _sharedPreference = locator<SharedPreferences>();

  PaymentListRequest? _paymentListRequest;
  List<PaymentListResponse> _paymentListResponse = [];
  List<PaymentListResponse> get paymentListResponse => _paymentListResponse;
  PaymentListRequest? get paymentListRequest => _paymentListRequest;

  List<String> get dateOfPayment => _paymentListResponse.map((e) => e.dateOfPayment.toString()).toSet().toList();

  String? get customerId => _sharedPreference.getString('id');

  Future<void> paymentListView() async {
    _paymentListResponse = await runBusyFuture(_apiService.payMentList(PaymentListRequest(customerId: customerId, month: "", year: ""))).catchError((err) {});
    if (hasError) {
      showErrDialog('Something went Wrong');
    } else {}
  }

  List<String> months = List.generate(12, (index) {
    return DateFormat.MMMM().format(DateTime(DateTime.now().year, index + 1, 1));
  });

  List<int> years = List.generate(5, (index) => DateTime.now().year - index);

  String? selectedMonth = DateFormat.MMMM().format(DateTime.now());
  int selectedYear = DateTime.now().year;

  void monthSelect(month) {
    notifyListeners();
    selectedMonth = month;
  }

  void yearSelect(year) {
    notifyListeners();
    selectedYear = year;
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(variant: DialogType.error, title: "Message", description: message);
  }
}
