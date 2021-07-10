import 'package:flutter/material.dart';
import 'package:animated_check/animated_check.dart';

class FailAnimation extends StatefulWidget {
  const FailAnimation({Key? key}) : super(key: key);

  @override
  _FailAnimationState createState() => _FailAnimationState();
}

class _FailAnimationState extends State<FailAnimation>
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
    return AnimatedIcon(
      icon: AnimatedIcons.menu_close,
      progress: _animation,
      size: 200,
      color: Colors.redAccent,
    );
  }
}
