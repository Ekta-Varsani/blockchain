var Tx = require('ethereumjs-tx').Transaction
const Web3 = require('web3')
const web3 = new Web3('http://127.0.0.1:7545')

const account1 = '0xCe998c31082c9609E0C208778d97461EE176FCDA'
const account2 = '0xc04542b71c1B1e4211b43139Cee1A38C8Fd4251F'

const privateKey1 = '35a530960c1eadbcf0ed566e67a99e47ed7d4ae79698490be524f62074ff9504'
const privateKey2 = '4c55e97873d56c9f8e7eb1f6f9e2ea9b36015c3bd79c55fd772d7ac34e9e9a61'

const privateKey1Buffer = Buffer.from(privateKey1, 'hex')
const privateKey2Buffer = Buffer.from(privateKey2, 'hex')

const contractAdd = '0x7A48c9e716fb86A3aD0E7CdF048264bf4135a17C'
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
const data = contract.methods.transfer(account2, 10).encodeABI()

web3.eth.getTransactionCount(account1, (err, txCount) => {

    // Build the transaction
    const txObject = {
        nonce: web3.utils.toHex(txCount),
        to: '0xd9145CCE52D386f254917e481eB44e9943F39138',
        // value: web3.utils.toHex(web3.utils.toWei('1', 'ether')),
        gasLimit: web3.utils.toHex(80000),
        gasPrice: web3.utils.toHex(web3.utils.toWei('10', 'gwei')),
        data: data
    }
    
    // Sign the transaction
    const tx = new Tx(txObject)
    tx.sign(privateKey1Buffer)

    const serializedTransaction = tx.serialize()
    const raw = '0x' + serializedTransaction.toString('hex')

    // Broadcast the transaction
    web3.eth.sendSignedTransaction(raw, (err, txHash) => {
        console.log('hash: ', txHash);
    })
})

