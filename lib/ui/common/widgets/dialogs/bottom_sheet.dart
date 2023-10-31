import 'package:flutter/material.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';

showBottomSheet1(BuildContext context) {
  showModalBottomSheet(
    elevation: 0,
    backgroundColor: Colors.grey.shade100,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
    context: context,
    builder: (BuildContext context) {
      bool? isChecked = false;
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildHeader(context),
          Expanded(
              child: Padding(
            padding: defaultPadding20,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpacing20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'August Month Report',
                        style: fontFamilyBold.size18,
                      ),
                      const Spacer(),
                      Checkbox(
                        value: isChecked,
                        onChanged: (newValue) {
                          isChecked = newValue;
                        },
                      ),
                    ],
                  ),
                  verticalSpacing12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Spept Month Report',
                        style: fontFamilyBold.size18,
                      ),
                      const Spacer(),
                      Checkbox(
                        value: isChecked,
                        onChanged: (newValue) {
                          isChecked = newValue;
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
        ],
      );
    },
  );
}

Widget buildHeader(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      color: appcolororenge,
    ),
    padding: defaultPadding8,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: defaultPadding8,
          child: Text(
            'Monthly',
            style: fontFamilyBold.size16,
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
