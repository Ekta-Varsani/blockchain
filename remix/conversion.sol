//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract conversion {
    int public x = -5;
    uint public y = uint(x);

    uint32 public a = 0x12345678;
    uint16 public b = uint16(a);

    uint16 public c = 0x1234;
    uint32 public d = uint32(c);

    bytes2 public e = 0x1234;
    bytes1 public f = bytes1(e);

    bytes2 public g = 0x1234;
    bytes4 public h = bytes4(g);
}