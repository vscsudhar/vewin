import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/button1.dart';
import 'package:vewin/ui/common/widgets/dialogs/shimmer.dart';

import 'sales_viewmodel.dart';

class SalesView extends StackedView<SalesViewModel> {
  const SalesView({Key? key}) : super(key: key);
  static final formKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    SalesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: appwhite1,
      appBar: AppBar(
        title: Text(
          'Sales',
          style: fontFamilyMedium.size28,
        ),
        backgroundColor: appcolororenge,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => viewModel.goToDashboard(),
        ),
      ),
      body: !viewModel.isBusy
          ? RefreshIndicator(
              onRefresh: () => viewModel.monthlySales(),
              child: Scaffold(
                  backgroundColor: appwhite1,
                  body: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: topPadding20,
                          child: Column(
                            children: [
                              Padding(
                                padding: leftPadding10,
                                child: Text(
                                  'From Date',
                                  style: fontFamilyBold.size14,
                                ),
                              ),
                              InkWell(
                                onTap: () => viewModel.selectFromDate(context),
                                child: Container(
                                  margin: const EdgeInsets.only(top: 12) +
                                      leftPadding10 +
                                      rightPadding10,
                                  padding: defaultPadding12,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      5,
                                    ),
                                    boxShadow: const <BoxShadow>[
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.4),
                                        offset: Offset(3, 3),
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(DateFormat.yMMMEd()
                                          .format(viewModel.fromDate)),
                                      const Icon(Icons.calendar_today),
                                    ],
                                  ),
                                ),
                              ),
                              verticalSpacing10,
                              Padding(
                                padding: leftPadding10,
                                child: Text(
                                  'To Date',
                                  style: fontFamilyBold.size14,
                                ),
                              ),
                              InkWell(
                                onTap: () => viewModel.selectToDate(context),
                                child: Container(
                                  margin: const EdgeInsets.only(top: 12) +
                                      leftPadding10 +
                                      rightPadding10,
                                  padding: defaultPadding12,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      5,
                                    ),
                                    boxShadow: const <BoxShadow>[
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.4),
                                        offset: Offset(3, 3),
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(DateFormat.yMMMEd()
                                          .format(viewModel.toDate)),
                                      const Icon(Icons.calendar_today),
                                    ],
                                  ),
                                ),
                              ),
                              verticalSpacing40,
                              Button1(
                                color: appcolororenge,
                                width: 200,
                                title: 'Submit',
                                onTap: () {
                                  viewModel.datepicks();
                                },
                              ),
                              verticalSpacing20,
                              // if (viewModel.isvalid == true)
                              viewModel.appList.isNotEmpty
                                  ? SingleChildScrollView(
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.90,
                                              height: 370,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: appChambray,
                                              ),
                                              child: Padding(
                                                padding: defaultPadding12,
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding: topPadding40 +
                                                          topPadding10,
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            90,
                                                        // height: MediaQuery.of(context).size.height * 90,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: ListView.builder(
                                                          itemCount: viewModel
                                                              .totalsale.length,
                                                          itemBuilder: (context,
                                                                  index) =>
                                                              ListTile(
                                                            onTap: () => viewModel
                                                                .appPick(viewModel
                                                                        .appname[
                                                                    index]),
                                                            // print(viewModel.appname[index]

                                                            title: Row(
                                                              children: [
                                                                Text(
                                                                  viewModel
                                                                      .totalsale[
                                                                          index]
                                                                      .appName
                                                                      .toString(),
                                                                  style: fontFamilyMedium
                                                                      .size16
                                                                      .appViking1,
                                                                ),
                                                                horizontalDivider,
                                                                const Spacer(),
                                                                Text(
                                                                  viewModel
                                                                      .totalsale[
                                                                          index]
                                                                      .sales
                                                                      .toString(),
                                                                  style: fontFamilyMedium
                                                                      .size16
                                                                      .appwhite,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              defaultPadding12,
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                'Application',
                                                                style:
                                                                    fontFamilyBold
                                                                        .appwhite
                                                                        .size20,
                                                              ),
                                                              const Spacer(),
                                                              Text(
                                                                'Amount',
                                                                style:
                                                                    fontFamilyBold
                                                                        .appwhite
                                                                        .size20,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              1,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              color: appViking),
                                                          child: Center(
                                                            child: Text(
                                                              'Total Sale : ${viewModel.totalSaleAmt.join()}',
                                                              style:
                                                                  fontFamilyBold
                                                                      .size18,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Center(
                                          //     child: Text(
                                          //   viewModel.totalsale.toString(),
                                          //   style: fontFamilyBold.size24.appViking1,
                                          // )),
                                        ],
                                      ),
                                    )
                                  : const Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text('data is not available'),
                                        ],
                                      ),
                                    ),
                              verticalSpacing20,
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            )
          : const ShimmerView(),
    );
  }

  @override
  SalesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SalesViewModel();
}
