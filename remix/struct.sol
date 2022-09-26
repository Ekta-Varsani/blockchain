//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract structContract {
    // struct User{
    //     address userAddress;
    //     uint balance;
    //     bool isVerified;
    // }

    // User ekta;

    // function setUserDetails(address _addr, uint _i, bool _b) public {
    //     User memory bob = User(_addr, _i, _b);
    //     ekta.userAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    //     ekta.balance = 0;
    //     ekta.isVerified = false;
    // }

    // function getUserAddress()public view returns(address){
    //     return ekta.userAddress;
    // }

    //-----------------------------------------------------------
    // struct paymentReceived {
    //     address from;
    //     uint amount;
    // }

    // paymentReceived public payment;

    // function details() public payable{
    //     payment = paymentReceived(msg.sender, msg.value);
    // }

    // function getAmount() public view returns(uint){
    //     return payment.amount;
    // }


    //----------------------------

    struct book {
        string name;
        string writter;
        uint id;
        bool available;
    }

    book public book1;

    function setValue(string memory s1, string memory s2, uint i, bool b) public {
        book1 = book(s1, s2, i, b);
    }

    function getValue() public view returns(string memory){
        return book1.name;
    }

}