import 'package:flutter/material.dart';

import '../shared/styles.dart';

class ViewBox extends StatelessWidget {
  const ViewBox({
    required this.child,
    this.iconColor,
    this.icon,
    this.height,
    this.width,
    this.onTap,
    this.padding,
    this.margin,
    this.boxColor,
    super.key,
  });

  final Widget child;
  final Widget? icon;
  final Color? iconColor;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? boxColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: padding ?? defaultPadding14,
            margin: margin ?? defaultPadding20,
            width: width ?? double.infinity,
            height: height,
            decoration: BoxDecoration(
                color: boxColor ?? appChambray,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                )),
            child: child,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: padding ?? const EdgeInsets.only(top: 34, right: 3),
                child: icon ??
                    Icon(
                      Icons.arrow_circle_right_rounded,
                      size: 50,
                      color: iconColor ?? Colors.black,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
