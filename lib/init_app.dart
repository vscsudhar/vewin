import 'package:flutter/material.dart';
import 'package:vewin/app/app.bottomsheets.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/ui/setup_dialog_ui.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
}
