import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/widgets/text_field2.dart';

import '../../common/shared/text_style_helpers.dart';
import 'register_viewmodel.dart';

class RegisterView extends StackedView<RegisterViewModel> {
  const RegisterView({Key? key}) : super(key: key);

  static final formKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    RegisterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: defaultPadding20,
              child: Form(
                key: formKey,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  verticalSpacing40,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SignUp.....!',
                        style: fontFamilyBold.size20.appChambray1,
                      ),
                    ],
                  ),
                  verticalSpacing10,
                  Center(
                    child: Text(
                      'Register Account',
                      style: fontFamilyBold.size34.colororg,
                    ),
                  ),
                  verticalSpacing10,
                  Center(
                    child: Text(
                      'Complete Your Details',
                      style: fontFamilyBold.size22.appChambray1,
                    ),
                  ),
                  // const Text(
                  //   'Please Enter Detail to Register',
                  //   style: TextStyle(color: Colors.white70),
                  // ),
                  verticalSpacing10,
                  // verticalSpacing20,
                  TextField2(
                    hintText: 'name',
                    hintStyle: fontFamilyMedium,
                    validator: (val) => val == null || val.isEmpty ? 'Name is required' : null,
                    onSaved: (name) => viewModel.registerRequest.name = name,
                  ),
                  verticalSpacing10,
                  TextField2(
                    keyboard: TextInputType.emailAddress,
                    hintText: 'email',
                    hintStyle: fontFamilyRegular,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Email is required';
                      } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(val)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onSaved: (email) => viewModel.registerRequest.email = email,
                  ),
                  verticalSpacing10,
                  TextField2(
                    maxLength: 10,
                    keyboard: TextInputType.number,
                    hintText: 'Phone',
                    hintStyle: fontFamilyRegular,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Phone Number is required';
                      } else if (!RegExp(r'^[0-9]{10}$').hasMatch(val)) {
                        return 'Please enter a 10-digit number';
                      }
                      return null;
                    },
                    onSaved: (phone) => viewModel.registerRequest.mobile = phone,
                  ),
                  verticalSpacing10,
                  TextField2(
                    hintText: 'Address',
                    hintStyle: fontFamilyRegular,
                    validator: (val) => val == null || val.isEmpty ? 'Address is required' : null,
                    onSaved: (add) => viewModel.registerRequest.address = add,
                  ),
                  verticalSpacing10,
                  TextField2(
                    hintText: 'Pincode',
                    hintStyle: fontFamilyRegular,
                    validator: (val) => val == null || val.isEmpty ? 'PinCode is required' : null,
                    onSaved: (pincode) => viewModel.registerRequest.pincode = pincode,
                  ),
                  verticalSpacing10,
                  TextField2(
                    obscureText: true,
                    hintText: 'passWord',
                    hintStyle: fontFamilyRegular,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Password is required';
                      } else if (val.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    onSaved: (password) => viewModel.setpass(password.toString()),
                    onChanged: (pass) => viewModel.registerRequest.password = pass,
                  ),
                  verticalSpacing10,
                  TextField2(
                    hintText: 'retype password',
                    hintStyle: fontFamilyRegular,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Re-Type Password is required';
                      } else if (val.length < 6) {
                        return 'ReType Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    onSaved: (password) => viewModel.confirmpass(password.toString()),
                  ),
                  verticalSpacing20,
                  verticalSpacing12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            formKey.currentState?.save();
                            viewModel.registerUser();
                          }
                        },
                        child: Padding(
                          padding: rightPadding40,
                          child: Text('Register', style: fontFamilyBold.size32),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: defaultPadding8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Already have an account',
                          style: fontFamilyRegular,
                        ),
                        InkWell(
                          onTap: () => viewModel.goToLogin(),
                          child: Text(
                            ' Login',
                            style: fontFamilyMedium.colororg,
                          ),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  RegisterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegisterViewModel();
}
