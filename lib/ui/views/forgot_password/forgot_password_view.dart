import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/button.dart';
import 'package:vewin/ui/common/widgets/button1.dart';
import 'package:vewin/ui/common/widgets/circular_progress_indicator.dart';
import 'package:vewin/ui/common/widgets/text_field1.dart';

import 'forgot_password_viewmodel.dart';

class ForgotPasswordView extends StackedView<ForgotPasswordViewModel> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  static final formKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    ForgotPasswordViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: appwhite1,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Password Change',
          style: fontFamilyMedium.size26.black,
        ),
        backgroundColor: appcolororenge,
        centerTitle: true,
      ),
      body: !viewModel.isBusy
          ? Padding(
              padding: defaultPadding12,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    verticalSpacing16,
                    const Text('Enter Your Mobile Number'),
                    verticalSpacing20,
                    TextField1(
                      color: appChambray,
                      hintStyle: fontFamilyMedium.appChambray1.appViking1,
                      type: TextInputType.number,
                      hintText: 'Mobile Number',
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Phone Number is required';
                        } else if (!RegExp(r'^[0-9]{10}$').hasMatch(val)) {
                          return 'Please enter a 10-digit number';
                        }
                        return null;
                      },
                      onSaved: (mobile) =>
                          viewModel.setMobile(mobile.toString()),
                      onChanged: (value) =>
                          viewModel.setMobile(value.toString()),
                    ),
                    verticalSpacing20,
                    Button1(
                      title: 'Submit',
                      onTap: () {
                        if (formKey.currentState?.validate() ?? false) {
                          formKey.currentState?.save();
                          viewModel.mobileNoVerified();
                        }
                      },
                    ),
                    verticalSpacing20,
                  ],
                ),
              ),
            )
          : Center(child: AnimatedCircularProgressIndicator()),
    );
  }

  @override
  ForgotPasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ForgotPasswordViewModel();
}
