import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/box.dart';
import 'package:vewin/ui/common/widgets/circular_progress_indicator.dart';
import 'package:vewin/ui/views/dashboard/widget/carousel.dart';
import 'package:vewin/ui/views/dashboard/widget/drawer.dart';
import 'package:vewin/ui/views/dashboard/widget/text_carousel.dart';

import 'dashboard_viewmodel.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView(
   {Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: appwhite1,
      appBar: AppBar(
        title: Text(
          "DashBoard",
          style: fontFamilyMedium.size28.black,
        ),
        actions: [
          InkWell(
            onTap: () => viewModel.goToProfile(),
            child: Image.asset(
              'assets/icons/person1.png',
              width: 50,
              height: 60,
            ),
          ),
          // horizontalSpacing10,
          // Image.asset(
          //   'assets/icons/settings.png',
          //   width: 50,
          //   height: 60,
          // ),
          horizontalSpacing10,
        ],
        centerTitle: true,
        backgroundColor: appcolororenge,
      ),
      body: !viewModel.isBusy
          ? SingleChildScrollView(
              child: Padding(
                padding: defaultPadding12,
                child: Column(children: [
                  TextHeaderCarousel(),
                  // Box(
                  //   boxColor: const Color(0xFF571E90),
                  //   child: Column(
                  //     children: [
                  //       Text(
                  //         'surprise For You',
                  //         style: fontFamilyLight.size16.appwhite,
                  //       ),
                  //       verticalSpacing10,
                  //       Text(
                  //         'CashBack UpTo 20%',
                  //         textAlign: TextAlign.end,
                  //         style: fontFamilyMedium.size22.appwhite,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  verticalSpacing12,
                  const ImageCarousel(),
                  verticalSpacing12,
                  // verticalSpacing20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Box(
                            boxColor: appcolororenge,
                            onTap: () => viewModel.goToSales(),
                            margin: zeroPadding,
                            padding: defaultPadding12,
                            child: Column(
                              children: [
                                Text(
                                  'Monthly Sale',
                                  style: fontFamilyBold.size18,
                                  textAlign: TextAlign.center,
                                ),
                                Image.asset(
                                  'assets/icons/sales1.png',
                                  width: 50,
                                  height: 60,
                                ),
                                Text(
                                  '${viewModel.total}',
                                  style: fontFamilyBold.size18,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )),
                      ),
                      horizontalSpacing12,
                      Expanded(
                        child: Box(
                            onTap: () => viewModel.goToBestPerformer(),
                            boxColor: appcolororenge,
                            margin: zeroPadding,
                            padding: defaultPadding12,
                            child: Column(
                              children: [
                                Text(
                                  "Best Performer",
                                  style: fontFamilyBold.size18,
                                  textAlign: TextAlign.center,
                                ),
                                Image.asset(
                                  'assets/icons/bestperform1.png',
                                  width: 50,
                                  height: 60,
                                ),
                                horizontalSpacing20,
                                Text(
                                  '${viewModel.bestperformName}',
                                  // viewModel.bestperformName.toString(),
                                  style: fontFamilyBold.size14,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                  verticalSpacing12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Box(
                            onTap: () => viewModel.goToCustomerList(),
                            boxColor: appcolororenge,
                            margin: zeroPadding,
                            padding: defaultPadding12,
                            child: Column(
                              children: [
                                Text(
                                  'Customer List',
                                  style: fontFamilyBold.size18,
                                  textAlign: TextAlign.center,
                                ),
                                Image.asset(
                                  'assets/icons/customerlist1.png',
                                  width: 50,
                                  height: 60,
                                ),
                                Text(
                                  '${viewModel.customerApptotal}',
                                  // viewModel.customerApptotal.toString(),
                                  style: fontFamilyBold.size18,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )),
                      ),
                      horizontalSpacing12,
                      Expanded(
                        child: Box(
                            onTap: () => viewModel.goToWalletInfo(),
                            boxColor: appcolororenge,
                            margin: zeroPadding,
                            padding: defaultPadding12,
                            child: Column(
                              children: [
                                Text(
                                  "Wallet Info",
                                  style: fontFamilyBold.size18,
                                  textAlign: TextAlign.center,
                                ),
                                Image.asset(
                                  'assets/icons/wallet1.png',
                                  width: 50,
                                  height: 60,
                                ),
                                horizontalSpacing20,
                                Text(
                                  "[300000]",
                                  style: fontFamilyBold.size18,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ]),
              ),
            )
          : Center(child: AnimatedCircularProgressIndicator()),
      drawer: const DrawerView(),
    );
  }

  @override
  DashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardViewModel();
}
