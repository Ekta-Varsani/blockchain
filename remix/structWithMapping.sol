//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract mappingStrcut {
    // struct worker {
    //     string worker;
    //     string duty;
    //     uint renumaration;
    // }

    //  mapping(address => worker) public result;
    //  address[] public worker_result;

    //----------------------------------

    struct student {
        string name;
        string subject;
        uint mark;
    }

    mapping(address => student) public result;
    address[] public student_result;

    function adding_values() public { //0.4.18
        // var student = result[msg.sender];
  
        // student.name = "John";
        // student.subject = "Chemistry";
        // student.mark = 88;
        // student_result.push(msg.sender) -1;
  
    }

    //-------------------------
    string public matched;

    function getSpecificResult() public {
        for(uint i = 0; i<student_result.length; i++){
            if(student_result[i] == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4){
                matched = "it's a match!!!";
            }
            else{
                matched = "oops..not matched!";
            }
        }
    }
    //--------------------------------

    function get_student_result() view public returns(address[] memory) {
        return student_result;
    }

    function count_students() view public returns (uint) {
        return student_result.length;
    }
}