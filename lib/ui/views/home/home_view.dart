import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/button.dart';
import 'package:vewin/ui/common/widgets/text_field1.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: defaultPadding12,
              child: Column(children: [
                verticalSpacing20,
                Text("SignIn", style: fontFamilyMedium.appChambray1.size26),
                verticalSpacing20,
                Text("Welcome Back", style: fontFamilyMedium.size34.colororg),
                verticalSpacing20,
                Text(
                  "SignIn With Your Password and Phone No",
                  style: fontFamilyMedium.appChambray1.size26,
                  textAlign: TextAlign.center,
                ),
                verticalSpacing40,
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField1(
                          type: TextInputType.number,
                          hintText: 'Phone NO',
                          color: appChambray,
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
                        ),
                      ),
                      verticalSpacing20,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField1(
                          obscureText: true,
                          color: appChambray,
                          hintText: "Password",
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Password is required';
                            } else if (val.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            return null;
                          },
                          onSaved: (password) =>
                              viewModel.setPass(password.toString()),
                        ),
                      ),
                      verticalSpacing20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => viewModel.goToForgotPass(),
                            child: const Text(
                              "Forgot Password..?",
                            ),
                          ),
                        ],
                      ),
                      verticalSpacing20,
                      Button(
                          buttoncolor: appcolororenge,
                          name: 'Login',
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              formKey.currentState?.save();
                              viewModel.userLogin();
                              formKey.currentState?.reset();
                            }
                          }),
                      verticalSpacing10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Dont have an Account..?',
                            style: fontFamilyMedium.size14,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () => viewModel.goToRegister(),
                              child: Text(
                                ' Create New Account',
                                style: fontFamilyMedium.size14.appViking1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

class TextFormField1 {}
