import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
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

  @override
  Widget builder(
      BuildContext context, DashboardViewModel viewModel, Widget? child) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return !viewModel.isBusy
        ? Column(
            children: <Widget>[
              CarouselSlider(
                items: viewModel.annoncement.map((annoncement) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () => viewModel.goToAnnouncement(annoncement),
                        child: Container(
                          width:
                              screenWidth, // Use screenWidth instead of double.infinity
                          height: 250,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              color: appcolororenge, //const Color(0xFF571E90),
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                verticalSpacing4,
                                Padding(
                                  padding: leftPadding10 +
                                      rightPadding10 +
                                      topPadding8,
                                  child: Text(
                                    annoncement.title ?? '',
                                    textAlign: TextAlign.center,
                                    style: fontFamilyMedium.size18.black
                                        .copyWith(fontStyle: FontStyle.italic),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                                verticalSpacing8,
                                // Text(
                                //   annoncement.description ?? '',
                                //   textAlign: TextAlign.center,
                                //   style: fontFamilyMedium.size12
                                //       .copyWith(color: appViking),
                                //   overflow: TextOverflow.ellipsis,
                                //   maxLines: 2,
                                // ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  scrollDirection: Axis.vertical,
                  height: 110,
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
  DashboardViewModel viewModelBuilder(BuildContext context) =>
      DashboardViewModel();
}
