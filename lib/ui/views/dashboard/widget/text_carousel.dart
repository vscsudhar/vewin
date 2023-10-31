import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';

class TextHeaderCarousel extends StatefulWidget {
  const TextHeaderCarousel({Key? key}) : super(key: key);

  @override
  _TextHeaderCarouselState createState() => _TextHeaderCarouselState();
}

class _TextHeaderCarouselState extends State<TextHeaderCarousel> {
  int currentIndex = 0;

  final List<String> textHeaders = [
    'Provide a concise and compelling description.',
    'Explain how it adds value to the customer.',
    'Encourage the customer to take immediate action, if applicable.',
    // Add more text headers as needed
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        CarouselSlider(
          items: textHeaders.map((header) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: screenWidth, // Use screenWidth instead of double.infinity
                  height: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: const Color(0xFF571E90), border: Border.all(), borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      header,
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
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        verticalSpacing10,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: textHeaders.asMap().entries.map((entry) {
            int index = entry.key;
            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentIndex == index ? Colors.blue : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
