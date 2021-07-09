import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

Web3Client web3 = Web3Client(
  "https://rinkeby.infura.io/v3/c8516c1c39624714a99f810e4fa644cd",
  Client(),
);

Future<DeployedContract> loadFactoryContract() async {
  String abi = await rootBundle.loadString("assets/abi/ProductFactory.json");
  EthereumAddress contractAddress =
      EthereumAddress.fromHex("0x0e3e835E7952859BB4885DEE82B44888e1641893");
  final contract = DeployedContract(
    ContractAbi.fromJson(abi, "ProductFactory"),
    contractAddress,
  );
  return contract;
}

Future<DeployedContract> loadProductContract(String address) async {
  String abi = await rootBundle.loadString("assets/abi/Product.json");
  EthereumAddress contractAddress = EthereumAddress.fromHex(address);
  final contract = DeployedContract(
    ContractAbi.fromJson(abi, "Product"),
    contractAddress,
  );
  return contract;
}
