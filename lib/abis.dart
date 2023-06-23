

class Abis{

static const erc20Abi = [
      {
        "constant": true,
        "inputs": [
          {"name": "owner", "type": "address"}
        ],
        "name": "balanceOf",
        "outputs": [
          {"name": "", "type": "uint256"}
        ],
        "type": "function"
      },
      {
        "constant": false,
        "inputs": [
          {"name": "_to", "type": "address"},
          {"name": "_value", "type": "uint256"}
        ],
        "name": "transfer",
        "outputs": [
          {"name": "", "type": "bool"}
        ],
        "type": "function"
      }
    ];

}