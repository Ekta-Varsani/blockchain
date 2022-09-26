//SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

contract owned {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not allowed!!");
        _;
    }
}

contract InheritanceWithModifiers is owned {
    mapping(address => uint) public tokenBalance;

    uint tokenPrice = 1 ether;

    constructor() {
        tokenBalance[owner] = 100;
    }

    function createToken() public onlyOwner{
        tokenBalance[msg.sender]++;
    }

    function burnToken() public onlyOwner{
        tokenBalance[msg.sender]--;
    }

    function purchaseToken() public payable {
        require((tokenBalance[owner] * tokenPrice) / msg.value > 0, "Not enough tokens!!!");
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value / tokenPrice;
    }
    
    function sendToken(address _to, uint amount) public payable {
        require(tokenBalance[msg.sender] >= amount, "Not enough tokens");
        tokenBalance[msg.sender] -= amount;
        tokenBalance[_to] += amount;
    }
}