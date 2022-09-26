//SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

contract destroy {
    receive() external payable{}
    
    function destroysmartcontract() public {
        selfdestruct(payable(msg.sender));
    }
}