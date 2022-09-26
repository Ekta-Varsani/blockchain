//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

// // Defining contract
// contract parent{
//     uint x = 1;
// 	uint internal sum;
// 	function setValue() external {
// 		uint a = 10;
// 		uint b = 20;
// 		sum = a + b;
// 	}
// }

// // Defining child contract
// contract child is parent{
// 	function getValue() external view returns(uint) {
// 		return sum;
// 	}
// }

// // Defining calling contract
// contract caller{
// 	child cc = new child();
// 	function testInheritance() public returns (uint) {
// 		cc.setValue();
// 		return cc.getValue();
// 	}
// }


//-------------multilevel in heritance-----------

// // Defining parent contract A
// contract A {
// 	string internal x;
//     // string public str;
// 	string a = "Geeks" ;
// 	string b = "For";
// 	function getA() external{
// 		x = string(abi.encodePacked(a, b));
//         // str = string(abi.encodePacked(a, b));
// 	}
// }

// // Defining child contract B
// contract B is A {
// 	string public y;
// 	string c = "Geeks";
// 	function getB() external payable returns(string memory){
// 		y = string(abi.encodePacked(x, c));
// 	}
// }

// // Defining child contract C
// contract C is B {
// 	function getC() external view returns(
// 	string memory){
// 		return y;
// 	}
// }

// // Defining calling contract
// contract caller {
// 	C cc = new C();
// 	function testInheritance(
// 	) public returns (
// 	string memory) {
// 		cc.getA();
// 		cc.getB();
// 		return cc.getC();
// 	}
// }

