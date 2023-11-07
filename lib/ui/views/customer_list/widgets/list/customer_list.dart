import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/core/models/customer_list_model.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/circular_progress_indicator.dart';
import 'package:vewin/ui/views/customer_list/customer_list_viewmodel.dart';

class CustomerList extends ViewModelWidget<CustomerListViewModel> {
  const CustomerList({
    required this.data,
    // required this.index,
    super.key,
  });

  final CustomersCount data;
  // final int index;
  @override
  Widget build(BuildContext context, CustomerListViewModel viewModel) {
    return Padding(
      padding: defaultPadding12,
      child: !viewModel.isBusy
          ? Container(
              height: 60, //150
              decoration: BoxDecoration(
                color: appChambray,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Card(
                elevation: 20.0,
                margin: const EdgeInsets.all(2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: InkWell(
                  onTap: () => viewModel.appPick(viewModel.customerApp),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: defaultPadding8,
                            child: Text(
                              '${viewModel.customerApp}',
                              style: fontFamilyRegular.size18.appChambray1,
                            ),
                          ),
                          const Spacer(),
                          horizontalDivider,
                          Padding(
                            padding: defaultPadding8,
                            child: Text(
                              '${viewModel.customersCount}',
                              style: fontFamilyRegular.size18.appChambray1,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : AnimatedCircularProgressIndicator(),
    );
  }
}
