import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/button.dart';
import 'package:vewin/ui/common/widgets/circular_progress_indicator.dart';
import 'package:vewin/ui/common/widgets/text_field1.dart';

import 'bank_account_viewmodel.dart';

class BankAccountView extends StackedView<BankAccountViewModel> {
  const BankAccountView({Key? key}) : super(key: key);

  // static final formKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    BankAccountViewModel viewModel,
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
          'Bank A/c Details',
          style: fontFamilyMedium.size26.black,
        ),
        backgroundColor: appcolororenge,
        centerTitle: true,
      ),
      body: !viewModel.isBusy
          ? Padding(
              padding: defaultPadding12,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      verticalSpacing20,
                      TextField1(
                        color: appChambray,
                        hintText: 'Account Number',
                        validator: (val) => val == null || val.isEmpty
                            ? 'Account Number is required'
                            : null,
                        onSaved: (account) =>
                            viewModel.bankAccountAddRequest.accNo = account,
                        onChanged: (account) =>
                            viewModel.bankAccountAddRequest.accNo = account,
                        onFieldSubmitted: (val) =>
                            formKey.currentState?.reset(),
                      ),
                      Row(
                        children: [
                          Text(
                            'Enter Your Bank Account Number',
                            style: fontFamilyLight.appChambray1,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      verticalSpacing12,
                      TextField1(
                        color: appChambray,
                        hintText: 'Re-Type Account Number ',
                        validator: (val) => val == null || val.isEmpty
                            ? 'Re-Type Account Number is required'
                            : null,
                        onSaved: (acc) => viewModel.confirmAcc(acc.toString()),
                        onFieldSubmitted: (val) =>
                            formKey.currentState?.reset(),
                      ),
                      Row(
                        children: [
                          Text(
                            'Confirm Enter Your Bank Account Number',
                            style: fontFamilyLight.appChambray1,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      verticalSpacing12,
                      TextField1(
                        color: appChambray,
                        hintText: 'IFSC Code',
                        validator: (val) => val == null || val.isEmpty
                            ? 'IFSC is required'
                            : null,
                        onSaved: (ifsc) =>
                            viewModel.bankAccountAddRequest.ifsc = ifsc,
                        onChanged: (ifsc) =>
                            viewModel.bankAccountAddRequest.ifsc = ifsc,
                        onFieldSubmitted: (val) =>
                            formKey.currentState?.reset(),
                      ),
                      Row(
                        children: [
                          Text(
                            'Enter11-digit Bank IFSC Code',
                            style: fontFamilyLight.appChambray1,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      verticalSpacing20,
                      TextField1(
                        color: appChambray,
                        hintText: 'Bank Name',
                        validator: (val) => val == null || val.isEmpty
                            ? 'Bank Name is required'
                            : null,
                        onSaved: (bankname) =>
                            viewModel.bankAccountAddRequest.bank = bankname,
                        onChanged: (bankname) =>
                            viewModel.bankAccountAddRequest.bank = bankname,
                        onFieldSubmitted: (val) =>
                            formKey.currentState?.reset(),
                      ),
                      Row(
                        children: [
                          Text(
                            'Your Bank Name',
                            style: fontFamilyLight.appChambray1,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      verticalSpacing20,
                      TextField1(
                        color: appChambray,
                        hintText: 'Branch Name',
                        validator: (val) => val == null || val.isEmpty
                            ? 'Branch Name is required'
                            : null,
                        onSaved: (branch) =>
                            viewModel.bankAccountAddRequest.branch = branch,
                        onChanged: (branch) =>
                            viewModel.bankAccountAddRequest.branch = branch,
                        onFieldSubmitted: (val) =>
                            formKey.currentState?.reset(),
                      ),
                      Row(
                        children: [
                          Text(
                            'Your Branch Name',
                            style: fontFamilyLight.appChambray1,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      verticalSpacing20,
                      TextField1(
                        color: appChambray,
                        hintText: 'State',
                        validator: (val) => val == null || val.isEmpty
                            ? 'State is required'
                            : null,
                        onSaved: (state) =>
                            viewModel.bankAccountAddRequest.state = state,
                        onChanged: (state) =>
                            viewModel.bankAccountAddRequest.state = state,
                        onFieldSubmitted: (val) =>
                            formKey.currentState?.reset(),
                      ),
                      Row(
                        children: [
                          Text(
                            'Your State Name',
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
                              viewModel.addBankAccount();
                              formKey.currentState?.reset();
                            }
                          })
                    ],
                  ),
                ),
              ),
            )
          : AnimatedCircularProgressIndicator(),
    );
  }

  @override
  BankAccountViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BankAccountViewModel();
}
