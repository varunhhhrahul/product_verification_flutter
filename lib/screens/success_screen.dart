import 'package:animated_qr_code_scanner/AnimatedQRViewController.dart';
import 'package:flutter/material.dart';
import 'package:product_verification_flutter/constants/models/product.dart';
import 'package:product_verification_flutter/widgets/icon_animation.dart';

class SuccessScreenArguments {
  final Product product;
  final AnimatedQRViewController controller;
  SuccessScreenArguments({required this.product, required this.controller});
}

class SuccessScreen extends StatelessWidget {
  static const String route = '/success';
  final SuccessScreenArguments? arguments;
  const SuccessScreen({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product product = arguments!.product;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Verified',
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                product.name,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      letterSpacing: 1,
                    ),
              ),
              subtitle: const Text(
                'Name',
              ),
              leading: const Icon(
                Icons.production_quantity_limits,
                color: Colors.greenAccent,
              ),
            ),
            ListTile(
              title: Text(
                product.address,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      letterSpacing: 1,
                    ),
              ),
              subtitle: const Text('Address'),
              leading: const Icon(
                Icons.vpn_key,
                color: Colors.greenAccent,
              ),
            ),
            ListTile(
              title: Text(
                product.companyName,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      letterSpacing: 1,
                    ),
              ),
              leading: const Icon(
                Icons.label_rounded,
                color: Colors.greenAccent,
              ),
              subtitle: const Text('Company'),
            ),
            ListTile(
              title: Text(
                product.manufacturePlace,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      letterSpacing: 1,
                    ),
              ),
              leading: const Icon(
                Icons.home,
                color: Colors.greenAccent,
              ),
              subtitle: const Text('Manufacturing Place'),
            ),
            ListTile(
              title: Text(
                product.manufactureYear,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      letterSpacing: 1,
                    ),
              ),
              leading: const Icon(
                Icons.calendar_today,
                color: Colors.greenAccent,
              ),
              subtitle: const Text('Manufacturing Year'),
            ),
            Container(
              alignment: Alignment.center,
              child: const IconAnimation(),
            )
          ],
        ),
      ),
    );
  }
}
