import 'package:animated_qr_code_scanner/AnimatedQRViewController.dart';
import 'package:flutter/material.dart';
import 'package:product_verification_flutter/widgets/fail_animation.dart';

class FailureScreenArguments {
  final AnimatedQRViewController controller;
  FailureScreenArguments({required this.controller});
}

class FailureScreen extends StatelessWidget {
  static const String route = '/failure';
  final FailureScreenArguments? arguments;
  const FailureScreen({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Unverified Product',
          style: Theme.of(context).appBarTheme.textTheme!.headline6!.copyWith(),
        ),
        leading: IconButton(
          onPressed: () {
            arguments!.controller.resume();
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.chevron_left,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const FailAnimation(),
      ),
    );
  }
}
