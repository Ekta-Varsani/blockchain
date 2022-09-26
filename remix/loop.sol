//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract loop {
    uint[] public data;
    uint i = 0;
    uint j = 0;

    function increment() public returns(uint[] memory) {
        while(i < 5){
            i++;
            if(i == 2){
                continue;
            }
            else if( i == 4){
                break;
            }
            data.push(i);
        }
        return data;
    }

    function doWhileLoop() public returns(uint[] memory){
        do{
            j++;
            data.push(j);
        } while(j < 5);
        return data;
    }

    function getLength() public view returns(uint) {
        return data.length;
    }

    // uint public constant min = type(uint).min;
    // uint public max = type(uint).max;

}