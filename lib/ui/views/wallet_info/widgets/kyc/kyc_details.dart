import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/box.dart';
import 'package:vewin/ui/views/wallet_info/wallet_info_viewmodel.dart';

class KycDetails extends StackedView<WalletInfoViewModel> {
  const KycDetails({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WalletInfoViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: appwhite1,
      appBar: AppBar(
        title: Text(
          'KYC Details',
          style: fontFamilyMedium.size26.black,
        ),
        backgroundColor: appcolororenge,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
            onTap: () => viewModel.goToWalletInfo(),
            child: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpacing10,
            Box(
              padding: defaultPadding4,
              // onTap: () => viewModel.goToPan(),
              margin: defaultPadding8,
              boxColor: appcolororenge,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/icons/identity.png',
                    height: 42,
                    width: 45,
                  ),
                  Text(
                    'PAN Update',
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
              // onTap: () => viewModel.goToBankAccount(),
              margin: defaultPadding8,
              padding: defaultPadding4,
              boxColor: appcolororenge,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/icons/bank.png'),
                  Text(
                    'Bank Account Details',
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
      ),
    );
  }

  @override
  WalletInfoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WalletInfoViewModel();
}
