import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/core/models/login_response_model.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/widgets/circular_progress_indicator.dart';
import 'package:vewin/ui/views/dashboard/dashboard_viewmodel.dart';

class TextHeaderCarousel extends StackedView<DashboardViewModel> {
  TextHeaderCarousel({Key? key}) : super(key: key);

//   @override
//   _TextHeaderCarouselState createState() => _TextHeaderCarouselState();
// }

// class _TextHeaderCarouselState extends State<TextHeaderCarousel> {
  int currentIndex = 0;

  final List<String> textHeaders = [
    'Provide a concise and compelling description.',
    'Explain how it adds value to the customer.',
    'Encourage the customer to take immediate action, if applicable.',
    // Add more text headers as needed
  ];

  @override
  Widget builder(BuildContext context, DashboardViewModel viewModel, Widget? child) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return !viewModel.isBusy
        ? Column(
            children: <Widget>[
              CarouselSlider(
                items: textHeaders.map((annoncement) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: screenWidth, // Use screenWidth instead of double.infinity
                        height: 200,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: const Color(0xFF571E90), border: Border.all(), borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            annoncement,
                            textAlign: TextAlign.center,
                            style: fontFamilyMedium.size20.appwhite,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  scrollDirection: Axis.vertical,
                  height: 100,
                  viewportFraction: 1,
                  padEnds: false,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                ),
              ),
            ],
          )
        : AnimatedCircularProgressIndicator();
  }

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) => DashboardViewModel();
}
