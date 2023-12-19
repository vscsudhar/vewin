import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/box.dart';
import 'package:vewin/ui/views/dashboard/widget/carousel.dart';
import 'package:vewin/ui/views/dashboard/widget/text_carousel.dart';

class ShimmerView extends StatelessWidget {
  const ShimmerView({super.key});
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(children: [
              TextHeaderCarousel(),
              Box(
                boxColor: const Color(0xFF571E90),
                child: Column(
                  children: [
                    Text(
                      'surprise For You',
                      style: fontFamilyLight.size16.appwhite,
                    ),
                    verticalSpacing10,
                    Text(
                      'CashBack UpTo 20%',
                      textAlign: TextAlign.end,
                      style: fontFamilyMedium.size22.appwhite,
                    ),
                  ],
                ),
              ),
              verticalSpacing12,
              ImageCarousel(),
              verticalSpacing12,
              // verticalSpacing20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Box(
                        boxColor: appcolororenge,
                        margin: zeroPadding,
                        padding: defaultPadding12,
                        child: Column(
                          children: [
                            Text(
                              '   ',
                              style: fontFamilyBold.size18,
                              textAlign: TextAlign.center,
                            ),
                            Image.asset(
                              'assets/icons/sales1.png',
                              width: 50,
                              height: 60,
                            ),
                            Text(
                              '     ',
                              style: fontFamilyBold.size18,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                  ),
                  horizontalSpacing12,
                  Expanded(
                    child: Box(
                        boxColor: appcolororenge,
                        margin: zeroPadding,
                        padding: defaultPadding12,
                        child: Column(
                          children: [
                            Text(
                              "    ",
                              style: fontFamilyBold.size18,
                              textAlign: TextAlign.center,
                            ),
                            Image.asset(
                              'assets/icons/bestperform1.png',
                              width: 50,
                              height: 60,
                            ),
                            horizontalSpacing20,
                            Text(
                              '',
                              style: fontFamilyBold.size14,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              verticalSpacing12,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Box(
                        boxColor: appcolororenge,
                        margin: zeroPadding,
                        padding: defaultPadding12,
                        child: Column(
                          children: [
                            Text(
                              '   ',
                              style: fontFamilyBold.size18,
                              textAlign: TextAlign.center,
                            ),
                            Image.asset(
                              'assets/icons/customerlist1.png',
                              width: 50,
                              height: 60,
                            ),
                            Text(
                              '   ',
                              style: fontFamilyBold.size18,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                  ),
                  horizontalSpacing12,
                  Expanded(
                    child: Box(
                        boxColor: appcolororenge,
                        margin: zeroPadding,
                        padding: defaultPadding12,
                        child: Column(
                          children: [
                            Text(
                              "    ",
                              style: fontFamilyBold.size18,
                              textAlign: TextAlign.center,
                            ),
                            Image.asset(
                              'assets/icons/wallet1.png',
                              width: 50,
                              height: 60,
                            ),
                            horizontalSpacing20,
                            Text(
                              "  ",
                              style: fontFamilyBold.size18,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
