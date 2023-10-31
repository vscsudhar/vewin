import 'package:flutter/material.dart';

class BackGround extends StatefulWidget {
  const BackGround({super.key});

  @override
  _BackGroundState createState() => _BackGroundState();
}

class _BackGroundState extends State<BackGround>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 500), // Adjust the duration as needed
    );
    _opacityAnimation =
        Tween<double>(begin: 1, end: 0.8).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/icons/back.png',
                fit: BoxFit.fill,
                opacity: _opacityAnimation,
              ),
              // Image.asset((bottomimg))
            ],
          ),
        ),
      ),
    );
  }
}
