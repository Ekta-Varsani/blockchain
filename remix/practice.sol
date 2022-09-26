//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract base {
    uint data;

    constructor(uint _data) {
        data = _data;
    }

    function print() public view returns(string memory) {
        return "EKTA";
    }
}

 contract derived is base(2) {
     constructor(){}

     function getData() external view returns(uint) {
         uint result = data**2;
         return result;
     }
 }

 contract caller {
     derived c = new derived();

     function getResult() public returns(uint) {
         c.print();
         return c.getData();
     }
 }