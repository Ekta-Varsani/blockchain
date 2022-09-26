//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract payableContract {
    string public myString = "Hello!!";
    address public senderAdd;

    function updateString(string memory _myString) public payable{
        if(msg.value == 1 ether){
            myString = _myString;
            senderAdd = msg.sender;
        }
        else{
            senderAdd = msg.sender;
            payable(msg.sender).transfer(msg.value);
        }
    }
}
