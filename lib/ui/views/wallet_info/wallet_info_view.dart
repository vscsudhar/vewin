import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/box.dart';
import 'package:vewin/ui/views/wallet_info/widgets/kyc/kyc_details.dart';

import 'wallet_info_viewmodel.dart';

class WalletInfoView extends StackedView<WalletInfoViewModel> {
  const WalletInfoView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WalletInfoViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: appwhite1,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => viewModel.goToDashboard(),
            child: const Icon(Icons.arrow_back),
          ),
          title: Text(
            'Wallet Info',
            style: fontFamilyMedium.size26.black,
          ),
          backgroundColor: appcolororenge,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpacing20,
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      appBrinkPink,
                      appcolororenge,
                      appViking,
                    ], // Replace these colors with your desired gradient colors
                  ),
                ),
                child: Padding(
                  padding: defaultPadding12,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Balance',
                            style: fontFamilyMedium.size28.appwhite,
                          ),
                        ],
                      ),
                      verticalSpacing16,
                      Text(
                        '40000',
                        style: fontFamilyBold.size34,
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpacing20,
              Box(
                margin: defaultPadding8,
                boxColor: appcolororenge,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Withdrawal',
                      style: fontFamilyMedium.size20,
                    ),
                    const Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 40,
                      color: appChambray,
                    )
                  ],
                ),
              ),
              Box(
                onTap: () => viewModel.goToHistory(),
                margin: defaultPadding8,
                boxColor: appcolororenge,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'History',
                      style: fontFamilyMedium.size20,
                    ),
                    const Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 40,
                      color: appChambray,
                    )
                  ],
                ),
              ),
              Box(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const KycDetails())),
                margin: defaultPadding8,
                boxColor: appcolororenge,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My KYC Details',
                      style: fontFamilyMedium.size20,
                    ),
                    const Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 40,
                      color: appChambray,
                    )
                  ],
                ),
              ),
              Box(
                margin: defaultPadding8,
                boxColor: appcolororenge,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Transaction',
                      style: fontFamilyMedium.size20,
                    ),
                    const Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 40,
                      color: appChambray,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  @override
  WalletInfoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WalletInfoViewModel();
}
