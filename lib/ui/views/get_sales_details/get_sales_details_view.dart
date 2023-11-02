import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/circular_progress_indicator.dart';
import 'package:vewin/ui/views/get_sales_details/widgets/list_sales_details.dart';

import 'get_sales_details_viewmodel.dart';

class GetSalesDetailsView extends StackedView<GetSalesDetailsViewModel> {
  const GetSalesDetailsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    GetSalesDetailsViewModel viewModel,
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
            child: const Icon(Icons.arrow_back)),
      ),
      body: !viewModel.isBusy ? 
      Padding(
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
                  child: Card(
                    elevation: 20.0,
                    margin: const EdgeInsets.all(2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: ListView.separated(
                      itemBuilder: (context, index) => ListSalesDetails(data: viewModel.salesDetails[index],),
                      // ListTile(
                      //   title: Column(
                      //     children: [
                      //       Row(
                      //         children: [
                      //           Text(
                      //             viewModel.saleDate[0]
                      //                 .toString()
                      //                 .replaceAll('00:00:00', ''),
                      //             style: fontFamilyRegular.size18.appChambray1,
                      //           ),
                      //           const Spacer(),
                      //           Text(
                      //             viewModel.id[index].toString(),
                      //             style: fontFamilyRegular.size18.appChambray1,
                      //           ),
                      //         ],
                      //       ),
                      //       verticalSpacing10,
                      //       Row(
                      //         children: [
                      //           Text(
                      //             viewModel.name[index].toString(),
                      //             style: fontFamilyRegular.size18.appChambray1,
                      //           ),
                      //           const Spacer(),
                      //           Text(
                      //             viewModel.amount[index].toString(),
                      //             style: fontFamilyRegular.size18.appChambray1,
                      //           ),
                      //         ],
                      //       ),
                      //       horizontalDivider,
                      //     ],
                      //   ),
                      // ),
                      separatorBuilder: (context, index) => verticalDivider,
                      itemCount: viewModel.salesDetails.length,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ) : AnimatedCircularProgressIndicator(),
    );
  }

  @override
  GetSalesDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      GetSalesDetailsViewModel();
}
