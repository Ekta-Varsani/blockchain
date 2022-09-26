//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract enumContract {
    enum Status {
        pending,
        completed,
        started,
        finished
    }

    Status public status;

    function getStatus() public view returns(Status) {
        return status;
    }

    function setStatus(Status _status) public {
        status = _status;
    }

    function cancel() public {
        status = Status.completed;
    }
}