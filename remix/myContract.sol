pragma solidity ^0.8.14;

contract myContract{
    // string public myString = "Hello!!";

    // function updateString(string memory _updateString) public {
    //     myString = _updateString;
    // }

    uint public myUint = 10;

    function setUint(uint newUint) public {
        myUint = newUint;
    }
}

// 0x06540f7e