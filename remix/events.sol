//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract events {
    mapping(address => uint) public tokenBalance;

    event tokenSet(address _from, address _to, uint amount);

    constructor() {
        tokenBalance[msg.sender] = 100;
    }

    function sendTokens(address _to, uint amount) public returns(bool) {
        require(tokenBalance[msg.sender] >= amount, "not enought tokens!!");
        tokenBalance[msg.sender] -= amount;
        tokenBalance[_to] += amount;

        emit tokenSet(msg.sender, _to, amount);
        return true;
    }


}