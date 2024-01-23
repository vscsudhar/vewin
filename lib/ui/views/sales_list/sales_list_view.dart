import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';

import 'sales_list_viewmodel.dart';

class SalesListView extends StackedView<SalesListViewModel> {
  const SalesListView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SalesListViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: appwhite1,
        appBar: AppBar(
          title: Text(
            'Sales List',
            style: fontFamilyMedium.size28,
          ),
          backgroundColor: appcolororenge,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(children: [
          SingleChildScrollView(
              child: Padding(
            padding: defaultPadding12,
            child: Column(
              children: [
                const Row(
                  children: [
                    Text('Application'),
                    Spacer(),
                    Text('Amount'),
                  ],
                ),
                Container(
                  height: 500,
                  width: 400,
                  color: appcolororenge,
                  child: ListView.builder(
                    itemCount: viewModel.totalsale.length,
                    itemBuilder: (context, index) => ListTile(
                      onTap: () => viewModel.appPick(viewModel.appname[index]),
                      title: Row(
                        children: [
                          Text(
                            viewModel.totalsale[index].appName.toString(),
                            style: fontFamilyMedium.size16,
                          ),
                          horizontalDivider,
                          const Spacer(),
                          Text(
                            viewModel.totalsale[index].sales.toString(),
                            style: fontFamilyMedium.size16,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ))
        ])

        //   body: Column(
        //     children: [
        //       if (viewModel.isvalid == true)
        //         viewModel.appList.isNotEmpty
        //             ? SingleChildScrollView(
        //                 child: Stack(
        //                   children: [
        //                     Center(
        //                       child: Container(
        //                         width: MediaQuery.of(context).size.width * 0.90,
        //                         height: 500,
        //                         decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(15),
        //                           color: appChambray,
        //                         ),
        //                         child: Padding(
        //                           padding: defaultPadding12,
        //                           child: Stack(
        //                             children: [
        //                               Padding(
        //                                 padding: topPadding40 + topPadding10,
        //                                 child: Container(
        //                                   width: MediaQuery.of(context).size.width * 90,
        //                                   height: MediaQuery.of(context).size.height * 90,
        //                                   decoration: BoxDecoration(
        //                                     borderRadius: BorderRadius.circular(10),
        //                                   ),
        //                                   child: ListView.builder(
        //                                     itemCount: viewModel.totalsale.length,
        //                                     itemBuilder: (context, index) => ListTile(
        //                                       onTap: () => viewModel.appPick(viewModel.appname[index]),
        //                                       title: Row(
        //                                         children: [
        //                                           Text(
        //                                             viewModel.totalsale[index].appName.toString(),
        //                                             style: fontFamilyMedium.size16.appViking1,
        //                                           ),
        //                                           horizontalDivider,
        //                                           const Spacer(),
        //                                           Text(
        //                                             viewModel.totalsale[index].sales.toString(),
        //                                             style: fontFamilyMedium.size16.appwhite,
        //                                           ),
        //                                         ],
        //                                       ),
        //                                     ),
        //                                   ),
        //                                 ),
        //                               ),
        //                               Column(
        //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                                 children: [
        //                                   Padding(
        //                                     padding: defaultPadding12,
        //                                     child: Row(
        //                                       children: [
        //                                         Text(
        //                                           'Application',
        //                                           style: fontFamilyBold.appwhite.size20,
        //                                         ),
        //                                         const Spacer(),
        //                                         Text(
        //                                           'Amount',
        //                                           style: fontFamilyBold.appwhite.size20,
        //                                         ),
        //                                       ],
        //                                     ),
        //                                   ),
        //                                   Text(
        //                                     'Total Sale : ${viewModel.totalSaleAmt.join()}',
        //                                     style: fontFamilyBold.size18.appwhite,
        //                                   )
        //                                 ],
        //                               ),
        //                             ],
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               )
        //             : const Center(
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   crossAxisAlignment: CrossAxisAlignment.end,
        //                   children: [
        //                     Text('data is not available'),
        //                   ],
        //                 ),
        //               ),
        //       verticalSpacing20,
        //     ],
        //   ),
        );
  }

  @override
  SalesListViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SalesListViewModel();
}
