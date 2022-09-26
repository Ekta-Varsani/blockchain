//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract simpleWallet is Ownable {


    address owner ;

    constructor() public {
        owner = msg.sender;
    }

    // modifier onlyOwner {
    //     require(msg.sender == owner, "Your are not the owner..");
    //     _;
    // }

    mapping(address => uint) public allowance;

    function isOwner() public view returns(bool) {
        return (msg.sender == owner);
    }

    function addAllowance(address who, uint amount) public onlyOwner{
        allowance[who] = amount;
    }

    modifier ownerOrAllowed(uint amount) {
        require(isOwner() || allowance[msg.sender] >= amount, "You are not allowed");
        _;
    }

    function reduceAllowance(address who, uint amount) internal {
        allowance[who] -= amount;
    }

    function withdrawMoney(address payable _to, uint amount) public ownerOrAllowed(amount) {
        require(amount <= address(this).balance, "not enough funds");
        if(!isOwner()) {
            reduceAllowance(_to, amount);
        }
        _to.transfer(amount);
    }

    fallback() external payable {
        
    }
}