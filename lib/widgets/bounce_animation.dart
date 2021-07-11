import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

class BounceAnimation extends StatelessWidget {
  final Widget child;
  final VoidCallback onPress;
  const BounceAnimation({required this.child, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      duration: const Duration(milliseconds: 100),
      scaleFactor: 0.5,
      onPressed: onPress != null ? onPress : () {},
      child: child,
    );
  }
}
