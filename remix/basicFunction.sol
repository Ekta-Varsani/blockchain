//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// import "myContract.sol";

// import * as symbolName from "myContract.sol";

contract basicFunction {
    function basic() public view returns(uint) {
        uint a = 1;
        uint b = 5;
        uint result = a + b;
        return result;
    }

    function calc() public view returns(uint product, uint sum){
        uint a = 6;
        uint b = 3;
        product = a*b;
        sum = a + b; 
    }

   
}