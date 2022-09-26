//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract strctContract {
    struct todo {
        string text;
        bool completed;
    }

    todo[] public todos;

    function create(string memory _text) public {
        todos.push(todo({text: _text, completed: false}));
    }

    function getText() public view returns(string memory) {
        return todos[0].text;
    }

    function getSpecificText(uint index) public view returns(string memory, bool) {
        return (todos[index].text, todos[index].completed);
    }

    function updateText(uint index, string memory _text) public {
        todos[index].text = _text;
    }

    function toggleForCompleted(uint index) public {
        todos[index].completed = !todos[index].completed;
    }
}