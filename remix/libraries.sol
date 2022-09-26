//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract libraries {
    using SafeMath for uint;

    mapping(address => uint) public tokenBalance;

    constructor() {
        tokenBalance[msg.sender] = tokenBalance[msg.sender].add(1);
    }

    function sendToken(address _to, uint amount) public returns(bool){
        tokenBalance[msg.sender] = tokenBalance[msg.sender].sub(amount);
        tokenBalance[_to] = tokenBalance[_to].add(amount);
        return true;
    }
}