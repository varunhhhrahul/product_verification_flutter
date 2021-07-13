import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

class BounceAnimation extends StatelessWidget {
  final Widget child;
  final VoidCallback onPress;
  //
  const BounceAnimation({Key? key, required this.child, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      duration: const Duration(milliseconds: 100),
      scaleFactor: 0.5,
      onPressed: onPress ?? () => {},
      child: child,
    );
  }
}
