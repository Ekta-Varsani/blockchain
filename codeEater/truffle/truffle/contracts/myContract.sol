// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

contract myContract {

    uint age = 20;

    function setValue(uint _age) public {
        age = _age;
    }

    function getValue() view public returns(uint) {
        return age;
    } 

}