import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/button.dart';
import 'package:vewin/ui/common/widgets/button1.dart';
import 'package:vewin/ui/common/widgets/circular_progress_indicator.dart';

import 'sales_viewmodel.dart';

class SalesView extends StackedView<SalesViewModel> {
  const SalesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SalesViewModel viewModel,
    Widget? child,
  ) {
    final formKey = GlobalKey<FormState>();

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
          ? Scaffold(
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
                              margin: const EdgeInsets.only(top: 12) + leftPadding10 + rightPadding10,
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(DateFormat.yMMMEd().format(viewModel.fromDate)),
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
                              margin: const EdgeInsets.only(top: 12) + leftPadding10 + rightPadding10,
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(DateFormat.yMMMEd().format(viewModel.toDate)),
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
                            onTap: () {},
                          ),
                          verticalSpacing20,
                          SingleChildScrollView(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.90,
                              height: 500,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: appChambray,
                              ),
                              child: Padding(
                                padding: defaultPadding12,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: topPadding40 + topPadding10,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 90,
                                        height: MediaQuery.of(context).size.height * 90,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: ListView.builder(
                                          itemCount: viewModel.totalsale.length,
                                          itemBuilder: (context, index) => ListTile(
                                            onTap: () => viewModel.appPick(viewModel.appname[index]),
                                            // print(viewModel.appname[index]

                                            title: Row(
                                              children: [
                                                Text(
                                                  viewModel.totalsale[index].appName.toString(),
                                                  style: fontFamilyMedium.size16.appViking1,
                                                ),
                                                horizontalDivider,
                                                const Spacer(),
                                                Text(
                                                  viewModel.totalsale[index].sales.toString(),
                                                  style: fontFamilyMedium.size16.appwhite,
                                                ),
                                              ],
                                            ),
                                          ),

                                          //SalesDetailsList(
                                          //   data: viewModel.totalsale[index],
                                          // ),
                                          // separatorBuilder: (context, index) => verticalDivider,
                                          // itemCount: viewModel.totalsale.length,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: defaultPadding12,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Application',
                                            style: fontFamilyBold.appwhite.size20,
                                          ),
                                          const Spacer(),
                                          Text(
                                            'Amount',
                                            style: fontFamilyBold.appwhite.size20,
                                          )
                                          // Expanded(
                                          //   child: Button(
                                          //     width: MediaQuery.of(context).size.width * .5,
                                          //     name: 'Application',
                                          //     onPressed: () {},
                                          //   ),
                                          // ),
                                          // horizontalSpacing10,
                                          // Expanded(
                                          //   child: Button(
                                          //     width: MediaQuery.of(context).size.width * .5,
                                          //     name: 'amount',
                                          //     onPressed: () {},
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          verticalSpacing20
                        ],
                      ),
                    ),
                  ),
                ],
              ))
          : Center(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        verticalSpacing20,
                        verticalSpacing20,
                        const TextField(), // Replace this with your own shimmer effect widget
                        verticalSpacing12,
                        Button(
                          onPressed: () {},
                          name: '',
                        ), // Replace this with your own shimmer effect widget
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  @override
  SalesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SalesViewModel();
}
