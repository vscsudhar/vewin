import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/button.dart';
import 'package:vewin/ui/common/widgets/text_field2.dart';

import 'set_password_viewmodel.dart';

class SetPasswordView extends StackedView<SetPasswordViewModel> {
  const SetPasswordView({Key? key}) : super(key: key);

  static final formKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    SetPasswordViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(
            'Otp Verified for Password',
            style: fontFamilyMedium.size26.black,
          ),
          backgroundColor: appcolororenge,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                OtpTextField(
                  onCodeChanged: (value) => value == null || value.isEmpty
                      ? 'Otp  is required'
                      : null,
                  onSubmit: (value) => viewModel.setOtp(value.toString()),
                ),
                verticalSpacing16,
                // if(viewModel.otp == true)
                Button(
                    name: 'Submit',
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        formKey.currentState?.save();
                        viewModel.sendOtpVerify();
                      }
                    }),
                verticalSpacing20,
                TextField2(
                  readOnly: true,
                  hintText: viewModel.otp,
                ),
              ],
            ),
          ),
        ));
  }

  @override
  SetPasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SetPasswordViewModel();
}
