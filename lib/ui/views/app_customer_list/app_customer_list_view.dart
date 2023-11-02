import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/circular_progress_indicator.dart';
import 'package:vewin/ui/views/app_customer_list/widgets/customer_list.dart';

import 'app_customer_list_viewmodel.dart';

class AppCustomerListView extends StackedView<AppCustomerListViewModel> {
  const AppCustomerListView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AppCustomerListViewModel viewModel,
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
      body: !viewModel.isBusy
          ? SingleChildScrollView(
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
                              Text('Area', style: fontFamilyMedium.size18),
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
                                    itemBuilder: (context, index) => CustomerList(
                                          data: viewModel.name[index], index: index,
                                        ),
                                    separatorBuilder: (context, index) => const Text(''),
                                    itemCount: viewModel.appname.length)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Center(child: AnimatedCircularProgressIndicator()),
    );
  }

  @override
  AppCustomerListViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AppCustomerListViewModel();
}
