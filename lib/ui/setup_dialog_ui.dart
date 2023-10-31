import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/enum/dialog_type.dart';
import 'package:vewin/ui/common/widgets/dialogs/error_dialog.dart';
import 'package:vewin/ui/common/widgets/dialogs/message_dialog.dart';

void setupDialogUi() {
  locator<DialogService>().registerCustomDialogBuilders(
    {
      null: (context, dialogRequest, completer) => MessageDialog(
            title: dialogRequest.title,
            description: dialogRequest.description,
            mainButtonTitle: dialogRequest.mainButtonTitle,
            onMainButtonClick: () => completer(
              DialogResponse(confirmed: true),
            ),
          ),
      DialogType.error: (context, dialogRequest, completer) => ErrorDialog(
            title: dialogRequest.title,
            description: dialogRequest.description,
            mainButtonTitle: dialogRequest.mainButtonTitle,
            onMainButtonClick: () => completer(
              DialogResponse(confirmed: true),
            ),
          ),
    },
  );
}
