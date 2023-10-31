import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/views/customer_list/widgets/app_customer_list.dart';
import 'package:vewin/ui/views/sales/sales_viewmodel.dart';

class SalesDetailsList extends ViewModelWidget<SalesViewModel> {
  const SalesDetailsList({
    // required this.data,
    // required this.index,
    super.key,
  });

  // final Datum data;
  // final int index;
  @override
  Widget build(BuildContext context, SalesViewModel viewModel) {
    return Padding(
      padding: defaultPadding8,
      child: Container(
        height: 70, //150
        decoration: BoxDecoration(
          color: appChambray,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Card(
          elevation: 20.0,
          margin: const EdgeInsets.all(2),
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
                        'Application ',
                        style: fontFamilyRegular.size18.appChambray1,
                      ),
                    ),
                    const Spacer(),
                    horizontalDivider,
                    Padding(
                      padding: defaultPadding8,
                      child: Text(
                        'Sales Amount',
                        style: fontFamilyRegular.size18.appChambray1,
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
