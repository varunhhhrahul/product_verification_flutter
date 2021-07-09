import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreenArguments {
  HomeScreenArguments();
}

class HomeScreen extends HookWidget {
  static const String route = '/';
  final HomeScreenArguments? arguments;
  const HomeScreen({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
