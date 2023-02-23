var Tx = require('ethereumjs-tx').Transaction
const Web3 = require('web3')
const web3 = new Web3('http://127.0.0.1:7545')

const contractAdd = '0xb96AEA8405b6f7530a72681642249B4cf9dAAA11'
const contractABI = [
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_x",
				"type": "uint256"
			}
		],
		"name": "setVal",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address payable",
				"name": "add",
				"type": "address"
			},
			{
				"internalType": "uint256",
				"name": "amount",
				"type": "uint256"
			}
		],
		"name": "transfer",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "val",
		"type": "event"
	},
	{
		"inputs": [],
		"name": "x",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]

const contract = new web3.eth.Contract(contractABI, contractAdd)


contract.getPastEvents(
    'allEvents',
    {
        fromBlock: 0,
        toBlock: 'latest'
    },
    (err, events) => {
        console.log(events.length);
    }
)