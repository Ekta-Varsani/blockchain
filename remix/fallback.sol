//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract fallbackReceiveContract {
    string public receiveOrFallback;
    uint public myUint;

    receive() external payable{
        myUint = msg.value;
        receiveOrFallback = "Receive";
    }

    fallback() external payable{
        myUint = msg.value;
        receiveOrFallback = "Fallback";
    }
}