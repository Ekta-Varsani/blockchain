var Tx = require('ethereumjs-tx').Transaction
const Web3 = require('web3')
const web3 = new Web3('http://127.0.0.1:7545')

const account1 = '0xf5391BacA3fF5590cf4491256e61F88316Ce1647'
const account2 = '0xFD4874D2A7B0eAb6F0Bc838a4f8bd9Cfc5F79B42'

const privateKey1 = '4fcf7b0ca277cd184ff3b7bf4c00b4bbfe67ac98bc2280240adf2927eee1b9ee'
const privateKey2 = '335ca20762c98098067b13523a685a0dc54a29295185c57786bcfdb9109df264'

const privateKey1Buffer = Buffer.from(privateKey1, 'hex')
const privateKey2Buffer = Buffer.from(privateKey2, 'hex')

web3.eth.getTransactionCount(account1, (err, txCount) => {

    // Build the transaction
    const txObject = {
        nonce: web3.utils.toHex(txCount),
        to: account2,
        value: web3.utils.toHex(web3.utils.toWei('1', 'ether')),
        gasLimit: web3.utils.toHex(21000),
        gasPrice: web3.utils.toHex(web3.utils.toWei('1', 'gwei'))
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