import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/circular_progress_indicator.dart';
import 'package:vewin/ui/views/payment/payment_viewmodel.dart';

class PaymentList extends ViewModelWidget<PaymentViewModel> {
  PaymentList({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context, PaymentViewModel viewModel) {
    return Padding(
      padding: defaultPadding4,
      child: !viewModel.isBusy
          ? Card(
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
                            viewModel.paymentListResponse[index].dateOfPayment.toString(),
                            style: fontFamilyRegular.size18.appChambray1,
                          ),
                        ),
                        const Spacer(),
                        horizontalDivider,
                        Padding(
                          padding: defaultPadding8,
                          child: Text(
                            viewModel.paymentListResponse[index].month.toString(),
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
                            viewModel.paymentListResponse[index].bank.toString(),
                            style: fontFamilyRegular.size18.appChambray1,
                          ),
                        ),
                        const Spacer(),
                        horizontalDivider,
                        Padding(
                          padding: defaultPadding8,
                          child: Text(
                            viewModel.paymentListResponse[index].salesAmount.toString(),
                            style: fontFamilyRegular.size18.appChambray1,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          : AnimatedCircularProgressIndicator(),
    );
  }
}
