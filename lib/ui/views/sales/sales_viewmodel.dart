import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';

class SalesViewModel extends BaseViewModel with NavigationMixin {
  final _bottomSheetService = locator<BottomSheetService>();

  DateTime? _sdate;
  DateTime get sdate => _sdate ?? DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      _sdate = pickedDate;
      notifyListeners();
    }
  }
}
