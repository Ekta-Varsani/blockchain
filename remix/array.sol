//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract arrayContract {
   uint[] public arr;
   uint[] public arr2 = [1,2,3];

   function getElement(uint i) public view returns(uint) {
       return arr[i];
   }

   function getArray() public view returns(uint[] memory) {
       return arr;
   }

   function add(uint i) public{
       arr.push(i);
   }

   function pop() public {
       arr.pop();
   }

   function remove (uint i) public {
       //delete will not decrease length.. it will put 0 instead of deleted element
       delete arr[i];
   }
}

//remove array element by shifting....
contract arraySifting {
    uint[] public arr;

    function remove(uint i) public {
        require(i < arr.length, "index out of bound");
        for(uint j=i; j<arr.length-1; j++){
            arr[j] = arr[j+1];
        }
        arr.pop();
    }

    function test() external {
        arr = [1, 2, 3, 4, 5];
        remove(2);
        // [1, 2, 4, 5]
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);

        arr = [1];
        remove(0);
        // []
        assert(arr.length == 0);
    }
}

//Remove array element by copying last element into to the place to remove..
contract arrayReplaceFromEnd {
    uint[] public arr;
    function remove(uint index) public {
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }

    function test() public {
        arr = [1, 2, 3, 4];

        // remove(1);
        // // [1, 4, 3]
        // assert(arr.length == 3);
        // assert(arr[0] == 1);
        // assert(arr[1] == 4);
        // assert(arr[2] == 3);

        // remove(2);
        // // [1, 4]
        // assert(arr.length == 2);
        // assert(arr[0] == 1);
        // assert(arr[1] == 4);
    }
}