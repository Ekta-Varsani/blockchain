//SPDX-license-Identifier: MIT
pragma solidity ^0.8.15;

contract crowdFund {

    address owner;

    constructor() {
        owner = msg.sender;
    }

    struct user {
        string name;
        uint age;
        uint requireMoney;
        string reason;
        bool received;
    }

    user newUser;

    mapping(address => user) public userInfo;

    event donateFund(address _from, uint _amount);
    event sendFund(address _to, uint _amount);

    uint totalFundOfCharity;

    function checkFundOfCharity() public view returns(uint){
        require(msg.sender == owner, "You are not the owner");
        return totalFundOfCharity;
    }

    function donateFundToCharity() public payable{
        totalFundOfCharity += msg.value;
        emit donateFund(msg.sender, msg.value);
    }

    function registerUser(string memory _name, uint _age, uint _requireMoney, string memory _reason) public {
        require(msg.sender != owner, "you can't register!!");
        userInfo[msg.sender].name = _name;
        userInfo[msg.sender].age = _age;
        userInfo[msg.sender].requireMoney = _requireMoney;
        userInfo[msg.sender].reason = _reason;
        userInfo[msg.sender].received = false;
    }   

    function sendMoneyToUser(address payable _to) public{
        require(msg.sender == owner, "You are not the owner");
        require(userInfo[_to].received == false, "User is already get paid");
        require(totalFundOfCharity >= userInfo[_to].requireMoney, "Not enough funds!!");
        _to.transfer(userInfo[_to].requireMoney);
        userInfo[_to].received = true;
        totalFundOfCharity -= userInfo[_to].requireMoney;

        emit sendFund(_to, userInfo[_to].requireMoney);
    }

}
