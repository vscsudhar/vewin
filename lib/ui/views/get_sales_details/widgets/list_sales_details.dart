import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/core/models/get_sales_details_model.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/circular_progress_indicator.dart';
import 'package:vewin/ui/views/get_sales_details/get_sales_details_viewmodel.dart';

class ListSalesDetails extends ViewModelWidget<GetSalesDetailsViewModel> {
  const ListSalesDetails({
    required this.data,
    // required this.index,
    super.key,
  });

  final GetSalesDetailsResponse data;
  // final int index;
  @override
  Widget build(BuildContext context, GetSalesDetailsViewModel viewModel) {
    return !viewModel.isBusy
        ? Padding(
            padding: defaultPadding4,
            child: Container(
              height: 100, //150
              decoration: BoxDecoration(
                color: appcolororenge,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Card(
                elevation: 20.0,
                margin: const EdgeInsets.all(1.1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: InkWell(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: defaultPadding4,
                            child: Text(
                              data.date.toString().replaceAll('00:00:00', ''),
                              style: fontFamilyMedium.size18.black,
                            ),
                          ),
                          const Spacer(),
                          horizontalDivider,
                          // Padding(
                          //   padding: defaultPadding8,
                          //   child: Text(
                          //     '${data.id}',
                          //     style: fontFamilyMedium.size18.appChambray1,
                          //   ),
                          // )
                        ],
                      ),
                      verticalSpacing10,
                      Row(
                        children: [
                          Padding(
                            padding: defaultPadding8,
                            child: Text(
                              '${data.name}',
                              // viewModel.appname.toString(),
                              style: fontFamilyBold.size18.appViking1,
                            ),
                          ),
                          const Spacer(),
                          horizontalDivider,
                          Padding(
                            padding: defaultPadding8,
                            child: Text(
                              '${data.amount}',
                              style: fontFamilyMedium.size18.colororg,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : AnimatedCircularProgressIndicator();
  }
}
