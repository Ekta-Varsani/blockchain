//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract operators {
    uint public sum;
    uint public sub;
    uint public mul;
    uint public div;
    uint public mod;
    uint public and;
    uint public or;
    uint public leftshift;
    uint public rightshift;
    uint public ternary;

    function calc(uint a, uint b) public {
        ternary = a > b ? a : b;
        sum = a + b;
        sub = a - b;
        mul = a * b;
        div = a / b;
        mod = a % b;
        and = a & b;
        or = a | b;
        leftshift = a << 1;
        rightshift = a >> 1;
        
    }
}