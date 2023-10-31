import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/views/customer_list/widgets/list/app_list.dart';

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
            onTap: () => viewModel.goToDashboard(),
            child: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
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
                  child: ListView.separated(
                    itemBuilder: (context, index) => const AppList(),
                    separatorBuilder: (context, index) => verticalDivider,
                    itemCount: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CustomerListViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomerListViewModel();
}
