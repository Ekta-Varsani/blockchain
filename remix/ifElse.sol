//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract ifElse {

    string public result;

    function check(int a) public {
        if(a > 0){
            result = "Enered number is greater than zero";
        }
        else if(a < 0){
            result = "Entered number is less than zero";
        }
        else{
            result = "Entered number is zero!!!";
        }
    }
}