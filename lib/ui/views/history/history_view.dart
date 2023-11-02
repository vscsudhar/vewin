import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/circular_progress_indicator.dart';
import 'package:vewin/ui/common/widgets/dialogs/bottom_sheet.dart';

import 'history_viewmodel.dart';

class HistoryView extends StackedView<HistoryViewModel> {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HistoryViewModel viewModel,
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
          'History',
          style: fontFamilyMedium.size26.black,
        ),
        backgroundColor: appcolororenge,
        centerTitle: true,
      ),
      body: !viewModel.isBusy ? 
      Padding(
        padding: defaultPadding12,
        child: Stack(children: [
          Row(
            children: [
              InkWell(
                onTap: () => showBottomSheet1(context),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(),
                  ),
                  child: const Row(
                    children: [
                      horizontalSpacing8,
                      Text('Monthly'),
                      horizontalSpacing20,
                      Icon(
                        Icons.arrow_drop_down,
                      ),
                    ],
                  ),
                ),
              ),
              horizontalSpacing12,
              Container(
                margin: defaultPadding10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(),
                ),
                child: const Row(
                  children: [
                    horizontalSpacing8,
                    Text('Catagories'),
                    horizontalSpacing20,
                    Icon(
                      Icons.arrow_drop_down,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: topPadding40 + topPadding8,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.95,
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) => const Card(
                  color: Color.fromARGB(135, 255, 255, 255),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.download_outlined,
                              size: 60,
                            ),
                            Spacer(),
                            Text('Amount'),
                          ],
                        ),
                        verticalSpacing10,
                        Row(
                          children: [
                            Text('2 days To go'),
                            Spacer(),
                            Text('credit to'),
                            Icon(Icons.abc),
                          ],
                        ),
                        // verticalSpacing10,
                        // horizontalDivider
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ]),
      ) : AnimatedCircularProgressIndicator()
    );
  }

  @override
  HistoryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HistoryViewModel();
}
