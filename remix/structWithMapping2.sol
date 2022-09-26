//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract mappingStruct {

    struct transaction {
        uint amount;
        uint timestamp;
    }

    struct balance {
        uint totalBalance;
        uint numDeposites;
        mapping(uint => transaction) deposites;
        uint numWithdrawal;
        mapping(uint => transaction) withdrawals;
    }

    mapping(address => balance) public balanceReceived;

    function getBalance(address _addr) public view returns(uint) {
        return balanceReceived[_addr].totalBalance;
    }

    function depositeMoney() public payable {
        balanceReceived[msg.sender].totalBalance += msg.value;
        transaction memory deposit = transaction(msg.value, block.timestamp);
        balanceReceived[msg.sender].deposites[balanceReceived[msg.sender].numDeposites] = deposit;
        balanceReceived[msg.sender].numDeposites++;
    }

    function withdrawMoney(address payable _to, uint amount) public payable{
        balanceReceived[msg.sender].totalBalance -= amount;
        transaction memory withdrawal = transaction(msg.value, block.timestamp);
        balanceReceived[msg.sender].withdrawals[balanceReceived[msg.sender].numWithdrawal] = withdrawal;
        balanceReceived[msg.sender].numWithdrawal++;

        _to.transfer(amount);
    }

}