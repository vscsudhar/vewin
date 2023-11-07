import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/core/models/customer_list_details.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/views/app_customer_list/app_customer_list_viewmodel.dart';

class CustomerList extends ViewModelWidget<AppCustomerListViewModel> {
  const CustomerList({
    required this.data,
    // required this.index,
    super.key,
    required int index,
  });

  final CustomerListDetailsResponse data;
  // final int index;
  @override
  Widget build(BuildContext context, AppCustomerListViewModel viewModel) {
    return Padding(
      padding: defaultPadding8,
      child: Container(
        height: 60, //150
        decoration: BoxDecoration(
          color: appChambray,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Card(
          elevation: 20.0,
          margin: const EdgeInsets.all(1.1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: InkWell(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: defaultPadding8,
                      child: Text(
                        '${data.name}',
                        style: fontFamilyMedium.size18.appViking1,
                      ),
                    ),
                    const Spacer(),
                    horizontalDivider,
                    Padding(
                      padding: defaultPadding8,
                      child: Text(
                        '${data.area}',
                        style: fontFamilyMedium.size18.appChambray1,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
