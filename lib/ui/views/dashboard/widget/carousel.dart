import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/views/dashboard/dashboard_viewmodel.dart';

class ImageCarousel extends StackedView<DashboardViewModel> {
  ImageCarousel({Key? key}) : super(key: key);

  final int currentIndex = 0;

  final List<String> image = [
    'assets/images/offer4.jpg',
    'assets/images/offer3.jpg',
    'assets/images/offer2.png',
    'assets/images/offer1.jpg',
  ];

  @override
  Widget builder(
      BuildContext context, DashboardViewModel viewModel, Widget? child) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        CarouselSlider(
          items: viewModel.banner.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  onTap: () => viewModel.banner,
                  child: Container(
                    width:
                        screenWidth, // Use screenWidth instead of double.infinity
                    height: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: appwhite1,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Image.network(
                        banner.image.toString(),
                        fit: BoxFit.fill,
                      ),
                      // child: Image.memory(
                      //   base64Decode(banner.image.toString()),
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 200,
            viewportFraction: 1,
            padEnds: false,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            onPageChanged: (index, reason) {
              // Update currentIndex based on image index
              viewModel.currentIndex1(index); //% viewModel.banner.length;
            },
          ),
        ),
        const SizedBox(height: 10), // Adjust the spacing as needed
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: viewModel.banner.asMap().entries.map((entry) {
            int index = entry.key;
            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    viewModel.currentIndex == index ? Colors.blue : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) =>
      DashboardViewModel();
}
