pragma solidity ^0.8.13;

contract sendMoney {

    uint public balanceReceived;
    function receiveMoney() public payable {
        balanceReceived += msg.value;
    }

    address public contractAdd = address(this);

    function getBalance() public view returns(uint) {
        // if(address(this).balance > 1){
        //     return 1;
        // }
        return address(this).balance;
    }

    function withdrowMoney() public {
        address payable to = payable(msg.sender);
        to.transfer(this.getBalance());
    }

    function withdrowMoneyTo(address payable _to) public {
        _to.transfer(this.getBalance());
    }
}