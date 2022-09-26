//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract exception {
    mapping(address => uint64) public balance;

    function receiveMoney() public payable{
        assert(msg.value == uint64(msg.value));
        balance[msg.sender] += uint64(msg.value);
        assert(balance[msg.sender] >= uint64(msg.value));
    }

    function withdrawMoney(address payable _to, uint64 amount) public {
        require(balance[msg.sender] >= amount, "not enough ether");
        assert(balance[msg.sender] >= balance[msg.sender] - amount);
        balance[msg.sender] -= amount;
        _to.transfer(amount); 
    }

}