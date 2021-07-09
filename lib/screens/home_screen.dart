import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

// import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart';
import 'package:product_verification_flutter/constants/models/product.dart';
import 'package:product_verification_flutter/constants/routes.dart';
import 'package:product_verification_flutter/screens/failure_screen.dart';
import 'package:product_verification_flutter/screens/success_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:web3dart/web3dart.dart';
import '../utils/web3.dart';

class HomeScreenArguments {
  HomeScreenArguments();
}

class HomeScreen extends StatefulHookWidget {
  static const String route = '/';
  final HomeScreenArguments? arguments;
  const HomeScreen({Key? key, this.arguments}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late Barcode result;
  // late QRViewController controller;
  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller.pauseCamera();
  //   } else if (Platform.isIOS) {
  //     controller.resumeCamera();
  //   }
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

// void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
// getData(result['address'])
//       });
//     });
//   }
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> qrCodeResult = useState("Not Yet Scanned");

    bool isLoading = true;
    final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

    void getData(String address) async {
      final DeployedContract productFactory = await loadFactoryContract();
      final ContractFunction getProducts =
          productFactory.function("getProducts");
      List addresses = await web3
          .call(contract: productFactory, function: getProducts, params: []);
      final data = addresses.firstWhere((element) => element == address);
      if (data) {
        final DeployedContract productContract =
            await loadProductContract(address);
        final ContractFunction getSummary =
            productFactory.function("getSummary");
        final result = await web3
            .call(contract: productContract, function: getSummary, params: []);
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
          ),
        );
      } else {
        Navigator.of(context).pushNamed(
          Routes.FAILURE_SCREEN,
          arguments: FailureScreenArguments(),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan QR Code"),
      ),
      body: Column(
        children: const <Widget>[
          // Expanded(
          //   flex: 5,
          //   child: QRView(
          //     key: qrKey,
          //     onQRViewCreated: _onQRViewCreated,
          //   ),
          // ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }
}
