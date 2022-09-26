//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

library search {
    function indexOf(uint[] storage self, uint value) public view returns(uint){
        for(uint i=0; i<self.length; i++) {
            if(self[i] == value) {
                return i;
            }
        }
        return uint(int(-1));
    }
}

contract notUsingForExample {
    uint[] public data;

    using search for uint[];

    function append(uint i) public {
        data.push(i);
    }

    function replace(uint _old, uint _new) public {
        // uint index = search.indexOf(data, _old);
        uint index = data.indexOf(_old);
        if(index == uint(int(-1))) {
            data.push(_new);
        }
        else {
            data[index] = _new;
        }
    }
}