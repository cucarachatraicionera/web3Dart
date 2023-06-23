import 'dart:convert';
import 'tokens.dart';  // Importar la clase Tokens.
import 'abis.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';


//Private Key and RPC url(infura,Quicknode)
const String privateKey =
'c532993773155ca7419e5a521162292532c9897bf9d3956e51b3be1149a058c5';
const String rpcUrl = 
'https://powerful-ancient-shape.ethereum-sepolia.discover.quiknode.pro/9ff7e193f90ed8881544a49bd1e20dd0d4a445e2/';

Future<void> main() async {

  // start a client we can use to send transactions
  final client = Web3Client(rpcUrl, http.Client());

  //get keys
  final credentials = EthPrivateKey.fromHex(privateKey);
  //get address keys
  final address = credentials.address;
  print("publica: "+ address.hexEip55);

 /// This code is creating an instance of a `DeployedContract` class, which represents a smart contract
 /// deployed on the Ethereum blockchain. It takes in two arguments: the first is the contract's ABI
 /// (Application Binary Interface), which is a JSON representation of the contract's functions and
 /// their inputs and outputs. The second argument is the contract's address on the blockchain,
 /// represented as an `EthereumAddress` object. This instance can then be used to interact with the
 /// contract's functions and data.
  final contract = DeployedContract(
    ContractAbi.fromJson(json.encode(Abis.erc20Abi), 'ERC20'),
    EthereumAddress.fromHex('0x81406151B231053eaA9facED8Ac661fd2Ceb0b6F'),
  );

  //creating tokens object
  final tokens = Tokens(client,contract);

  //balance in token erc20
  final balance = await tokens.erc20Balance('0x0eE3DDA02D614468D6bF0cB17480C974F93b1EA6');
  print(balance);
  print(tokens);
 
  
  //send transaction native token
  // await client.sendTransaction(
  //   credentials,
  //   Transaction(
  //     to: EthereumAddress.fromHex('0xE5738e3868ef1025f76bB314B45e9265F9dd0A54'),
  //     gasPrice: EtherAmount.inWei(BigInt.one),
  //     maxGas: 5400000,
  //     value: EtherAmount.inWei(BigInt.one),
  //   ),
  // );

  // await client.dispose();
}