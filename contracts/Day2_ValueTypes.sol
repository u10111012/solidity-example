// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

//資料型態 values and references

contract ValueTypes {
    bool public a;     // default : false

    uint public b;     // dafault : 0 
                       // uint8 = 0 到 2*8 - 1
                       // uint16 = 0 到 2*16 - 1
                       // uint256 = 0 到 2*256 - 1  

    int public c;      // default : 0 
                       // int8 = -2*8 到 2*8 -1 

    int public maxInt = type(int).max;      // int 最大值
    int public minInt = type(int).min;      // int 最小值

    address public addr;        // defalut 0x0000000000000000000000000000000000000000
    bytes32 public b32 ;        // default 0x0000000000000000000000000000000000000000000000000000000000000000
}