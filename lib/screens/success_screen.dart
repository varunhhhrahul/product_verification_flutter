import 'package:flutter/material.dart';
import 'package:product_verification_flutter/constants/models/product.dart';
import 'package:web3dart/contracts.dart';

class SuccessScreenArguments {
  final Product product;
  SuccessScreenArguments({required this.product});
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
