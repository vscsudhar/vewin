import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/button.dart';
import 'package:vewin/ui/common/widgets/circular_progress_indicator.dart';
import 'package:vewin/ui/common/widgets/text_field1.dart';

import 'reset_password_viewmodel.dart';

class ResetPasswordView extends StackedView<ResetPasswordViewModel> {
  const ResetPasswordView({Key? key}) : super(key: key);

  static final formKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    ResetPasswordViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: appwhite1,
        appBar: AppBar(
          title: Text(
            'Password Confirmation',
            style: fontFamilyMedium.size26.black,
          ),
          backgroundColor: appcolororenge,
          centerTitle: true,
        ),
        body: !viewModel.isBusy ? 
        SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                verticalSpacing20,
                verticalSpacing20,
                TextField1(
                  hintText: 'New Password',
                  obscureText: true,
                  hintStyle: fontFamilyMedium,
                  color: appChambray,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Password is required';
                    } else if (val.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                  onSaved: (password) => viewModel.setpass(password.toString()),
                  onChanged: (password) => viewModel.updatePasswordRequest.password = password,
                ),
                verticalSpacing12,
                TextField1(
                  color: appChambray,
                  hintText: 'Confirm Password',
                  hintStyle: fontFamilyMedium,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Confirm Password is required';
                    } else if (val.length < 8) {
                      return 'Confirm Password must be at least 8 characters long';
                    }
                    return null;
                  },
                  onSaved: (repass) => viewModel.confirmpass(repass.toString()),
                ),
                verticalSpacing12,
                Button(
                  name: 'Submit',
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      formKey.currentState?.save();
                      viewModel.updatePassword();
                    }
                  },
                )
              ],
            ),
          ),
        ) : AnimatedCircularProgressIndicator(),
        );
  }

  @override
  ResetPasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ResetPasswordViewModel();
}
