import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/button.dart';
import 'package:vewin/ui/common/widgets/circular_progress_indicator.dart';
import 'package:vewin/ui/common/widgets/text_field1.dart';

import 'change_password_viewmodel.dart';

class ChangePasswordView extends StackedView<ChangePasswordViewModel> {
  const ChangePasswordView({Key? key}) : super(key: key);

  static final formKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    ChangePasswordViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: appwhite1,
      body: !viewModel.isBusy
          ? SingleChildScrollView(
              child: Padding(
                padding: defaultPadding12,
                child: SafeArea(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        verticalSpacing20,
                        Text(
                          'Change Password',
                          style: fontFamilyMedium.size28.color2699FB,
                        ),

                        // TextField1(
                        //   color: appChambray,
                        //   hintText: 'Old Password',
                        //   validator: (val) => val == null || val.isEmpty ? 'Old Pass is required' : null,
                        //   onSaved: (oldpass) => viewModel.oldpass1(oldpass.toString()),
                        //   onChanged: (password) => viewModel.oldpass1(password.toString()),
                        // ),
                        verticalSpacing20,
                        TextField1(
                          color: appChambray,
                          hintText: 'New Password',
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Password is required';
                            } else if (val.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            return null;
                          },
                          onSaved: (password) => viewModel
                              .updatePasswordRequest.password = password,
                          onChanged: (password) => viewModel
                              .updatePasswordRequest.password = password,
                        ),
                        verticalSpacing20,
                        TextField1(
                          color: appChambray,
                          hintText: 'Confirm Password',
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Confirm Password is required';
                            } else if (val.length < 8) {
                              return 'Confirm Password must be at least 8 characters long';
                            }
                            return null;
                          },
                          onSaved: (repass) => viewModel.oldPass1(
                            repass.toString(),
                          ),
                        ),
                        verticalSpacing20,
                        Row(
                          children: [
                            Expanded(
                              child: Button(
                                height: 50,
                                buttoncolor: Colors.redAccent,
                                name: 'Cancel',
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Expanded(
                              child: Button(
                                height: 50,
                                buttoncolor: appViking,
                                name: 'Done',
                                onPressed: () {
                                  if (formKey.currentState?.validate() ??
                                      false) {
                                    formKey.currentState?.save();
                                    viewModel.updatePassword();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : AnimatedCircularProgressIndicator(),
    );
  }

  @override
  ChangePasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChangePasswordViewModel();
}
