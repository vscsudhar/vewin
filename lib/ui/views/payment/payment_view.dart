import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/views/payment/widgets/payment_list.dart';

import 'payment_viewmodel.dart';

class PaymentView extends StackedView<PaymentViewModel> {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PaymentViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: fontFamilyMedium.size28,
        ),
        backgroundColor: appcolororenge,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: defaultPadding10,
        child: ListView.builder(
            itemBuilder: (context, index) => Card(
                  elevation: 20.0,
                  margin: const EdgeInsets.all(1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  child: InkWell(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: defaultPadding4,
                              child: Text(
                                viewModel.paymentListResponse[index].month.toString(),
                                style: fontFamilyRegular.size18.appChambray1,
                              ),
                            ),
                            const Spacer(),
                            horizontalDivider,
                            Padding(
                              padding: defaultPadding8,
                              child: Text(
                                viewModel.paymentListResponse[index].bank.toString(),
                                style: fontFamilyRegular.size18.appChambray1,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: defaultPadding4,
                              child: Text(
                                viewModel.paymentListResponse[index].dateOfPayment.toString().replaceAll("00:00:00.000", ''),
                                style: fontFamilyRegular.size18.appChambray1,
                              ),
                            ),
                            const Spacer(),
                            horizontalDivider,
                            Padding(
                              padding: defaultPadding8,
                              child: Text(
                                viewModel.paymentListResponse[index].salesAmount.toString(),
                                style: fontFamilyRegular.size20.appChambray1,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            itemCount: viewModel.paymentListResponse.length),
      ),
    );
  }

  @override
  PaymentViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PaymentViewModel();
}
