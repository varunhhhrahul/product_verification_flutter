import 'package:flutter/material.dart';

class SuccessScreenArguments {
  SuccessScreenArguments();
}

class SuccessScreen extends StatelessWidget {
  static const String route = '/success';
  final SuccessScreenArguments? arguments;
  const SuccessScreen({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
