// import 'package:flutter/material.dart';

// class BounceAnimation extends StatefulWidget {
//   final Widget child;
//   const BounceAnimation({this.child});
//   @override
//   _BounceAnimationState createState() => _BounceAnimationState();
// }

// class _BounceAnimationState extends State<BounceAnimation>
//     with SingleTickerProviderStateMixin {
//   double _scale;
//   AnimationController _controller;
//   @override
//   void initState() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(
//         milliseconds: 500,
//       ),
//       lowerBound: 0.0,
//       upperBound: 0.1,
//     )..addListener(() {
//         setState(() {});
//       });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }

//   void _tapDown(TapDownDetails details) {
//     _controller.forward();
//   }

//   void _tapUp(TapUpDetails details) {
//     _controller.reverse();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _scale = 1 - _controller.value;
//     return GestureDetector(
//       onTapDown: _tapDown,
//       onTapUp: _tapUp,
//       child: Transform.scale(
//         scale: _scale,
//         child: widget.child,
//       ),
//     );
//   }
// }

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
