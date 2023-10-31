import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/core/models/register_model.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/button.dart';
import 'package:vewin/ui/common/widgets/text_field2.dart';

import 'otp_viewmodel.dart';

class OtpView extends StackedView<OtpViewModel> {
  const OtpView({Key? key}) : super(key: key);

  static final formKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    OtpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: appwhite1,
        appBar: AppBar(
          // leading: InkWell(
          //   onTap: () => viewModel.goToWalletInfo(),
          //   child: const Icon(Icons.arrow_back),
          // ),
          title: Text(
            'Otp Verification',
            style: fontFamilyMedium.size26.black,
          ),
          backgroundColor: appcolororenge,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: defaultPadding12,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  verticalSpacing40,
                  TextField2(
                    keyboard: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 4,
                    hintText: 'OTP',
                    hintStyle: fontFamilyRegular,
                    validator: (val) =>
                        val == null || val.isEmpty ? 'OTP is required' : null,
                    onSaved: (otp) => viewModel.setOtp(otp.toString()),
                  ),
                  // OtpTextField(
                  //   showFieldAsBox: true,
                  //   focusedBorderColor: appcolororenge,
                  //   onSubmit: (otp) =>
                  //           viewModel.setOtp(otp.toString()),
                  //   onCodeChanged: (value) => value != viewModel.otp || value.isEmpty ? 'Please Enter verified Otp' : null,
                  // ),
                  verticalSpacing10,
                  Row(
                    children: [
                      const Text(
                        'Your Not get OTP Please Click',
                        style: fontFamilyMedium,
                      ),
                      const Spacer(),
                      Text(
                        ' Resend OTP',
                        style: fontFamilyMedium.color2699FB,
                      )
                    ],
                  ),
                  verticalSpacing40,
                  Button(
                      buttoncolor: Colors.green,
                      name: 'Verified',
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          formKey.currentState?.save();
                          viewModel.registerOtp();
                        }
                      }),
                  verticalSpacing60,
                  TextField2(
                    readOnly: true,
                    hintText: viewModel.otp,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  OtpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OtpViewModel();
}
