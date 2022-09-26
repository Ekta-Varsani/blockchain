//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract mappingContract {

    //extra--------------
    // mapping(address => uint) public myMap;

    // function get(address _addr) public view returns(uint){
    //     return myMap[_addr];
    // }

    // function set(address _addr, uint _i) public {
    //     myMap[_addr] = _i;
    // }

    // function remove(address _addr) public {
    //     delete myMap[_addr];
    // }

    //---------------------------------
    // mapping(uint => bool) public uintToBoolMap;
    // mapping(address => bool) public addToBoolMap;

    // function setUint(uint _i) public{
    //     uintToBoolMap[_i] = true;
    // }    

    // function setAdd() public {
    //     addToBoolMap[msg.sender] = true;
    // }

    //---------------------------

    mapping(address => uint) public balanceReceived;

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function sendMoney() public payable{
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawAllMoney(address payable _to, uint _amount) public {
        // uint balanceToSend = balanceReceived[msg.sender];
        // balanceReceived[msg.sender] = 0;
        // _to.transfer(balanceToSend);

        uint balanceToSend = _amount;
        require(balanceToSend >= balanceReceived[msg.sender], "You don't have that much amount!!!");
        balanceReceived[msg.sender] = balanceReceived[msg.sender] - _amount;
        _to.transfer(balanceToSend);
    }

}