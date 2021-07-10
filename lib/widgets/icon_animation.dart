import 'package:flutter/material.dart';
import 'package:animated_check/animated_check.dart';

class IconAnimation extends StatefulWidget {
  const IconAnimation({Key? key}) : super(key: key);

  @override
  _IconAnimationState createState() => _IconAnimationState();
}

class _IconAnimationState extends State<IconAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutCirc,
    ));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCheck(
      progress: _animation,
      size: 200,
      color: Colors.greenAccent,
    );
  }
}
