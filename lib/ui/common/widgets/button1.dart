import 'package:flutter/material.dart';

import '../shared/styles.dart';
import '../shared/text_style_helpers.dart';

class Button1 extends StatelessWidget {
  final String title;
  final bool disabled;
  final bool busy;
  final void Function()? onTap;
  final bool outline;
  final Widget? leading;
  final double? width;
  final Color? color;

  const Button1({
    Key? key,
    required this.title,
    this.disabled = false,
    this.busy = false,
    this.onTap,
    this.leading,
    this.width,
    this.color,
  })  : outline = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !disabled ? onTap : () {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: width ?? double.infinity,
        height: 48,
        alignment: Alignment.center,
        decoration: !outline
            ? BoxDecoration(
                color: !disabled ? appcolorFF7612 : Colors.grey,
                borderRadius: BorderRadius.circular(8),
              )
            : BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: color ?? appcolorFF7612,
                  width: 1,
                )),
        child: !busy
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leading != null) leading!,
                  if (leading != null) const SizedBox(width: 5),
                  Text(title, style: fontFamilyBold.size14.appwhite),
                ],
              )
            : const Center(
                child: Padding(
                  padding: defaultPadding20,
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                ),
              ),
      ),
    );
  }
}
