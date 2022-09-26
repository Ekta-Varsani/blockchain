//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

//-------------------modifiers-------------------
// contract Owner {
//    address owner;
//    constructor() public {
//       owner = msg.sender;
//    }
//    modifier onlyOwner {
//       require(msg.sender == owner);
//       _;
//    }
//    modifier costs(uint price) {
//       if (msg.value >= price) {
//          _;
//       }
//    }
// }
// contract Register is Owner {
//    mapping (address => bool) registeredAddresses;
//    uint price;
//    constructor(uint initialPrice) public { price = initialPrice; }
   
//    function register() public payable costs(price) {
//       registeredAddresses[msg.sender] = true;
//    }
//    function changePrice(uint _price) public onlyOwner {
//       price = _price;
//    }
// }

//------------------inheritance-------------------------
// contract C {
//     uint private data;

//     uint public info;

//     constructor() public{
//         info = 10;
//     }

//     function increment(uint a) private pure returns(uint) {
//         return a+1;
//     }

//     function getData() public view returns(uint){
//         return data;
//     }

//     function compute(uint a, uint b) internal pure returns(uint){
//         return a+b;
//     }
// }

// contract E is C {
//     uint private result;
//     C private c;

//     constructor() public {
//         c = new C();
//     }

//     function getComputedResult() public {
//         result = compute(3,5);
//     }

//     function getResult() public view returns(uint) {
//         return result;
//     }

//     function getInfo() public view returns(uint) {
//         return c.info();
//     }

// }

//-------------------------------------------
contract functionModifier {
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not allowed!!");
        _;
    }

    modifier validAddress(address _addr) {
        require(_addr != address(0), "add not valid");
        _;
    }

    function chnageOwner(address newOwner) public onlyOwner validAddress(newOwner){
        owner = newOwner;
    }

    modifier noReEnterancy() {
        require(!locked, "No ReEnterancy!!");
        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) public noReEnterancy{
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }

}