import 'package:flutter/material.dart';

class FailureScreenArguments {
  FailureScreenArguments();
}

class FailureScreen extends StatelessWidget {
  static const String route = '/failure';
  final FailureScreenArguments? arguments;
  const FailureScreen({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
