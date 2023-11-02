import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/circular_progress_indicator.dart';

import 'best_performer_viewmodel.dart';

class BestPerformerView extends StackedView<BestPerformerViewModel> {
  const BestPerformerView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BestPerformerViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: appwhite1,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back),
          ),
          title: Text(
            'Best Performer',
            style: fontFamilyMedium.size24.black,
          ),
          centerTitle: true,
          backgroundColor: appcolororenge,
        ),
        body: !viewModel.isBusy
            ? Center(
                child: Padding(
                  padding: defaultPadding14,
                  child: Column(
                    children: [
                      verticalSpacing20,
                      const CircleAvatar(
                        radius: 80,
                      ),
                      verticalSpacing20,
                      Text(
                        viewModel.bestperformName.toString(),
                        style: fontFamilyBold.appBrinkPink1.size28,
                      ),
                      horizontalDivider,
                      verticalSpacing40,
                      // Row(
                      //   children: [
                      //     Text(
                      //       'Target Sale',
                      //       style: fontFamilyRegular.appViking1.size26,
                      //     ),
                      //     const Spacer(),
                      //     Text(
                      //       '700000',
                      //       style: fontFamilyMedium.appChambray1.size24,
                      //     ),
                      //   ],
                      // ),
                      // verticalSpacing20,
                      Row(
                        children: [
                          Text(
                            'Total Sale',
                            style: fontFamilyRegular.appViking1.size26,
                          ),
                          const Spacer(),
                          Text(
                            viewModel.bestperformSales.toString(),
                            style: fontFamilyMedium.appChambray1.size24,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            : Center(child: AnimatedCircularProgressIndicator()));
  }

  @override
  BestPerformerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BestPerformerViewModel();
}
