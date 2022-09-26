//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract consumer {
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    function deposite() public payable {}
}

contract smartWalletContract {
    address payable owner;
    address payable nextOwner;
    uint guardianResetCount;
    uint public constant confirmationsFromGuardiansForReset = 3;

    mapping(address => uint) public allowance;
    mapping(address => bool) public isAlloweToSend;
    mapping(address => bool) public guardian;
    mapping(address => mapping(address => bool)) public nextOwnerGuardianVotedBool;
    
    constructor() {
        owner = payable(msg.sender);
    }

    function setGuardian(address _guardian, bool isGuardian) public{
        require(msg.sender == owner, "You are not an owner, aborting!!");
        guardian[_guardian] = isGuardian;
    }

    function proposeNewOwner(address payable newOwner) public {
        require(guardian[msg.sender], "You are not a guardian of this wallet, aborting!");
        require(nextOwnerGuardianVotedBool[msg.sender][newOwner] == false, "you have already voted, aborting");
        if(newOwner != nextOwner) {
            nextOwner = newOwner;
            guardianResetCount = 0;
        }

        guardianResetCount++;

        if(guardianResetCount > confirmationsFromGuardiansForReset){
            owner = nextOwner;
            nextOwner = payable(address(0));
        }
    }

    function setAllowance(address _for, uint amount) public {
        require(msg.sender == owner, "Youe are not n owner!!");
        allowance[_for] = amount;
        if(amount > 0){
            isAlloweToSend[_for] = true;
            // allowance[_for] = amount;
        }
        else{
            isAlloweToSend[_for] = false;
        }
    }

    function transfer(address payable _to, uint amount, bytes memory payload) public returns(bytes memory){
        if(msg.sender != owner){
            require(allowance[msg.sender] >= amount, "You are trying to more than allow, aborting");
            require(isAlloweToSend[msg.sender], "Your are not allowed to send, aborting...");
            allowance[msg.sender] -= amount;
        }

        (bool success, bytes memory returnData) = _to.call{value: amount}("");
        require(success, "Transaction fails, aborting!");
        return returnData;
    }

    receive() external payable {}
}