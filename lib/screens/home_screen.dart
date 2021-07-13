import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:animated_qr_code_scanner/AnimatedQRViewController.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart';
import 'package:product_verification_flutter/constants/models/product.dart';
import 'package:product_verification_flutter/constants/routes.dart';
import 'package:product_verification_flutter/screens/failure_screen.dart';
import 'package:product_verification_flutter/screens/success_screen.dart';
import 'package:product_verification_flutter/widgets/custom_buttom.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:web3dart/web3dart.dart';
import '../utils/web3.dart';
import 'package:animated_qr_code_scanner/animated_qr_code_scanner.dart';
import 'package:string_validator/string_validator.dart';

class HomeScreenArguments {
  HomeScreenArguments();
}

class HomeScreen extends HookWidget {
  static const String route = '/';

  final HomeScreenArguments? arguments;
  const HomeScreen({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> qrCodeResult = useState("Not Yet Scanned");
    final AnimatedQRViewController controller = AnimatedQRViewController();
    bool isLoading = true;

    void getData(String address) async {
      final DeployedContract productFactory = await loadFactoryContract();
      final ContractFunction getProducts =
          productFactory.function("getProducts");
      List res = await web3
          .call(contract: productFactory, function: getProducts, params: []);

      List addresses = res[0];

      if (address.length == 42) {
        try {
          final data = addresses.contains(EthereumAddress.fromHex(address));
          if (data) {
            final DeployedContract productContract =
                await loadProductContract(address);
            final ContractFunction getSummary =
                productContract.function("getSummary");
            final result = await web3.call(
                contract: productContract, function: getSummary, params: []);
            Navigator.of(context).pushNamed(
              Routes.SUCCESS_SCREEN,
              arguments: SuccessScreenArguments(
                product: Product(
                  address: productContract.address.toString(),
                  name: result[0],
                  companyName: result[1],
                  manufactureYear: result[2],
                  manufacturePlace: result[3],
                ),
                controller: controller,
              ),
            );
          } else {
            Navigator.of(context).pushNamed(
              Routes.FAILURE_SCREEN,
              arguments: FailureScreenArguments(controller: controller),
            );
          }
        } catch (err) {
          Navigator.of(context).pushNamed(
            Routes.FAILURE_SCREEN,
            arguments: FailureScreenArguments(controller: controller),
          );
        }
      } else {
        Navigator.of(context).pushNamed(
          Routes.FAILURE_SCREEN,
          arguments: FailureScreenArguments(controller: controller),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'E-Product Verification',
          style: Theme.of(context).appBarTheme.textTheme!.headline6!.copyWith(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: AnimatedQRView(
              squareColor: Colors.green.withOpacity(0.25),
              animationDuration: const Duration(milliseconds: 400),
              onScanBeforeAnimation: (String str) {
                print('Callback at the beginning of animation: $str');
              },
              onScan: (String str) async {
                getData(str);
              },
              controller: controller,
            ),
          ),
          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(
                      // ColorConstants.PRIMARY,
                      Colors.grey.shade400,
                    ),
                    // backgroundColor: MaterialStateProperty.all(Colors.black54),
                    elevation: MaterialStateProperty.all(10.0),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    controller.toggleFlash();
                  },
                  child: const Text(
                    'Flash',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(
                      // ColorConstants.PRIMARY,
                      Colors.grey.shade400,
                    ),
                    // backgroundColor: MaterialStateProperty.all(Colors.black54),
                    elevation: MaterialStateProperty.all(10.0),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    controller.resume();
                  },
                  child: const Text(
                    'Rescan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(
                      // ColorConstants.PRIMARY,
                      Colors.grey.shade400,
                    ),
                    // backgroundColor: MaterialStateProperty.all(Colors.black54),
                    elevation: MaterialStateProperty.all(10.0),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    controller.flipCamera();
                  },
                  child: const Text(
                    'Flip',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(
                      // ColorConstants.PRIMARY,
                      Colors.grey.shade400,
                    ),
                    // backgroundColor: MaterialStateProperty.all(Colors.black54),
                    elevation: MaterialStateProperty.all(10.0),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    controller.resume();
                  },
                  child: const Text(
                    'Resume',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
