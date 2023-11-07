import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/circular_progress_indicator.dart';
import 'package:vewin/ui/views/app_customer_list/widgets/customer_list.dart';

import 'customer_list_viewmodel.dart';

class CustomerListView extends StackedView<CustomerListViewModel> {
  const CustomerListView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CustomerListViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: appwhite1,
      appBar: AppBar(
        title: Text(
          'Customer List',
          style: fontFamilyMedium.size26.black,
        ),
        backgroundColor: appcolororenge,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: !viewModel.isBusy
          ? Padding(
              padding: defaultPadding12,
              child: Stack(
                children: [
                  Row(
                    children: [
                      Text(
                        'Application',
                        style: fontFamilyMedium.size22,
                      ),
                      const Spacer(),
                      Text('No of Customer', style: fontFamilyMedium.size22)
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: topPadding40,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 90,
                        height: MediaQuery.of(context).size.height * 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // child: ListView.separated(
                        //   itemBuilder: (context, index) => CustomerList(
                        //     data: viewModel.customerListCountResponse[index],
                        //     // index: index,
                        //   ),
                        //   separatorBuilder: (context, index) => const Text(''),
                        //   itemCount: viewModel.customerCount.length,
                        // ),
                        child: ListView.builder(
                          itemCount: viewModel.customerCount.length,
                          itemBuilder: (context, index) => ListTile(
                            onTap: () =>
                                viewModel.appPick(viewModel.customerApp[index]),
                            title: Row(
                              children: [
                                Text(
                                  viewModel.customerCount[index].appName
                                      .toString(),
                                  style: fontFamilyMedium.size16.appBrinkPink1,
                                ),
                                const Spacer(),
                                Padding(
                                  padding: rightPadding40,
                                  child: Text(
                                    viewModel.customerCount[index].count
                                        .toString(),
                                    style: fontFamilyMedium.size16.appViking1,
                                  ),
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
                  ),
                ],
              ),
            )
          : Center(child: AnimatedCircularProgressIndicator()),
    );
  }

  @override
  CustomerListViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomerListViewModel();
}
