//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

// contract varContract {
//     uint256 public myUint;

//     function setUint(uint _myUint) public {
//         myUint = _myUint;
//     }

//     function decrementUintUnchecked() public{
//         // unchecked {
//             myUint--;
//         // }
        
//     }

//     bool public myBool;

//     function setBool(bool _myBool) public {
//         myBool = _myBool;
//     }

//     uint8 public myUint8;

//     function setUint8(uint8 _myUint8) public {
//         myUint8 = _myUint8;
//     }

//     function increment() public{
//         myUint8++;
//     }

//     function decrement() public{
//         myUint8--;
//     }

//     address public myAddress;

//     function setAddress(address _myAddress) public {
//         myAddress = _myAddress;
//     }

//     function getBalance() public view returns(uint) {
//         return myAddress.balance;
//     }

//     string public myString = "hello";
//     bytes public myBytes = unicode"Hello wörld"; //ö needs 2 bytes

//     function getLengthOfByte() public view returns(uint){
//         return myBytes.length;
//     }

//     function setString(string memory _myString) public {
//         myString = _myString;
//     }

//     function compareString(string memory _myString) public view returns(bool) {
//         return keccak256(abi.encodePacked(myString)) == keccak256(abi.encodePacked(_myString));
//         // myBytes = keccak256(abi.encodePacked(myString));
//     }
// }



contract CodiesAlert {
    string name = "Anni";

    function result(string calldata _a) external pure returns(string calldata) {
        return _a;
    }

    // Access externally Marked function inside the contract
    function accessExternal() public view returns(string memory) {
        // this keyword is used to access externally marked function inside the contract
        return this.result(name);
    }

    // Below function can be access externally as well as internally
    // function result(string calldata _a) external pure returns(string calldata) {
    //     return _a;
    // }
}