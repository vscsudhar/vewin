import 'package:flutter/material.dart';

import '../shared/styles.dart';

Widget buildAppBarBackground() {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(13), bottomRight: Radius.circular(13)),
      image: DecorationImage(
        image: AssetImage(back2),
        fit: BoxFit.fill,
      ),
    ),
  );
}
