import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/button.dart';
import 'package:vewin/ui/common/widgets/circular_progress_indicator.dart';
import 'package:vewin/ui/common/widgets/text_field1.dart';

import 'pan_viewmodel.dart';

class PanView extends StackedView<PanViewModel> {
  const PanView({Key? key}) : super(key: key);

  // static final formKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    PanViewModel viewModel,
    Widget? child,
  ) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: appwhite1,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back),
          ),
          title: Text(
            'PAN Details',
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
                      verticalSpacing20,
                      TextField1(
                        hintText: 'Name',
                        color: appChambray,
                        hintStyle: fontFamilyRegular,
                        validator: (val) => val == null || val.isEmpty
                            ? 'Password is required'
                            : null,
                        onSaved: (name) => viewModel.panAddRequest.name = name,
                        onChanged: (name) =>
                            viewModel.panAddRequest.name = name,
                      ),
                      Row(
                        children: [
                          Text(
                            'Enter Your Full Name as on PAN card',
                            style: fontFamilyLight.appChambray1,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      verticalSpacing12,
                      TextField1(
                        hintText: 'PAN ',
                        color: appChambray,
                        hintStyle: fontFamilyRegular,
                        validator: (val) => val == null || val.isEmpty
                            ? 'PAN is required'
                            : null,
                        onSaved: (pan) => viewModel.panlength(pan
                            .toString()), //viewModel.panAddRequest.pan = pan,
                        // onChanged: (pan) => viewModel.panlength(pan.toString()),
                      ),
                      Row(
                        children: [
                          Text(
                            'Enter Your 10-digit PAN',
                            style: fontFamilyLight.appChambray1,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      verticalSpacing10,
                      InkWell(
                        onTap: () => viewModel.selectDate(context),
                        child: Container(
                          margin: const EdgeInsets.only(top: 12),
                          padding: defaultPadding12,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                            border: Border.all(
                                width: 0.6,
                                style: BorderStyle.solid,
                                strokeAlign: BorderSide.strokeAlignOutside),
                            // boxShadow: const <BoxShadow>[
                            //   BoxShadow(
                            //     color: Color.fromRGBO(0, 0, 0, 0.4),
                            //     offset: Offset(3, 3),
                            //     blurRadius: 5,
                            //   ),
                            // ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(DateFormat.yMMMEd().format(viewModel.dob)),
                              const Icon(Icons.calendar_today),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Enter DOB as on the PAN Card',
                            style: fontFamilyLight.appChambray1,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      verticalSpacing20,
                      Button(
                          buttoncolor: appcolororenge,
                          name: 'Submit',
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              formKey.currentState?.save();
                              viewModel.panAddDetails();
                              formKey.currentState?.reset();
                            }
                          })
                    ],
                  ),
                ),
              )
            : AnimatedCircularProgressIndicator());
  }

  @override
  PanViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PanViewModel();
}
