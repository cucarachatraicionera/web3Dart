// tokens.dart
import 'package:tradex/abis.dart';

import 'abis.dart';
import 'package:web3dart/web3dart.dart';

class Tokens {
  final Web3Client client;
  final DeployedContract contract;

  Tokens(this.client, this.contract);

  Future<BigInt> erc20Balance(String address) async {
 
    /// This code is calling the `balanceOf` function of an ERC20 token contract deployed on the Ethereum
    /// blockchain. It first creates a `DeployedContract` object with the contract's ABI (Application Binary
    /// Interface) and address. Then, it gets the `balanceOf` function from the contract and calls it using
    /// the `client.call` method, passing in the contract, function, and parameters. The result is stored in
    /// the `balance` variable and printed to the console. This code is essentially checking the balance of
    /// a specific Ethereum address for a particular ERC20 token.
    final balanceOfFunction = contract.function('balanceOf');
    final balance = await client.call(
      contract: contract,
      function: balanceOfFunction,
      params: [
        EthereumAddress.fromHex(address)
      ],
    );
    return(balance.first);
  }


}
