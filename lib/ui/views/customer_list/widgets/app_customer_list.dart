import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/circular_progress_indicator.dart';
import 'package:vewin/ui/views/customer_list/customer_list_viewmodel.dart';
import 'package:vewin/ui/views/customer_list/widgets/list/customer_list.dart';

class AppCustomerList extends StackedView<CustomerListViewModel> {
  const AppCustomerList({Key? key}) : super(key: key);

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
          'App Wise Customer List',
          style: fontFamilyMedium.size26.black,
        ),
        backgroundColor: appcolororenge,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(onTap: () => Navigator.pop(context), child: const Icon(Icons.arrow_back)),
      ),
      body: !viewModel.isBusy ?
       SingleChildScrollView(
        child: Padding(
          padding: defaultPadding12,
          child: Column(
            children: [
              verticalSpacing40,
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: appViking),
                ),
              ),
              verticalSpacing40,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.70,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Name of Customer',
                          style: fontFamilyMedium.size18,
                        ),
                        const Spacer(),
                        Text('Total Purchase', style: fontFamilyMedium.size18),
                      ],
                    ),
                    Padding(
                      padding: topPadding30,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 90,
                        height: MediaQuery.of(context).size.height * 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListView.separated(
                          itemBuilder: (context, index) => const Text(''), //const CustomerList(),
                          separatorBuilder: (context, index) => verticalDivider,
                          itemCount: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ) : Center(child: AnimatedCircularProgressIndicator()),
    );
  }

  @override
  CustomerListViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomerListViewModel();
}
