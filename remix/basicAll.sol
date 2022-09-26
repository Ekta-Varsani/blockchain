//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract coin {
    address public owner;

    mapping(address => uint) public balance;

    event sent(address from, address to, uint amount);

    constructor() {
        owner = msg.sender;
    }

    function sendMoney(address to, uint amount) public {
        require(msg.sender == owner, "you are not the owner");
        balance[to] += amount;
    }

    error revertError(uint requested, uint available);

    function send(address to, uint amount) public {
        if(amount > balance[msg.sender]) {
            revert revertError ({
                requested: amount,
                available: balance[msg.sender]
            });
        }

        balance[msg.sender] -= amount;
        balance[to] += amount;

        emit sent(msg.sender, to, amount);
    }

    fallback() external payable {
        balance[msg.sender] += msg.value;
    }
    
}