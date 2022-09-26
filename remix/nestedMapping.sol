//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract nestedMapping {
    mapping(address =>mapping(uint => bool)) public myMap;

    function get(address _addr, uint _i) public view returns(bool) {
        return myMap[_addr][_i];
    }

    function set(address _addr, uint _i, bool _b) public {
        myMap[_addr][_i] = _b;
    }

    function remove(address _addr, uint _i) public {
        delete myMap[_addr][_i];
    }
}