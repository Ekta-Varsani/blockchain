pragma solidity ^0.8.13 ;

contract startStop {

    address public owner;
    uint public balanceReceived;
    bool public paused;
    address public senderAdd;
    address public toAdd;

    constructor() public {
        owner = msg.sender;
    }

    //extra-------------
    function sendMoney() public payable {
        balanceReceived += msg.value;
        senderAdd = msg.sender;
    }

    //extra--------------
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function setPaused(bool _paused) public {
        require(msg.sender == owner, "You are not an owner");
        paused = _paused;
    }

    function withdrowAllMoney(address payable _to) public {
        toAdd = _to;
        senderAdd = msg.sender;
        require(msg.sender == owner, "You can not withdrow!!");
        // require(paused == false, "contract paused!");
        _to.transfer(address(this).balance);
    }

    // function destroysmartcontract(address payable _to) public {
    //     require(msg.sender == owner, "You are not an owner!!");
    //     selfdestruct(_to);
    // }
}