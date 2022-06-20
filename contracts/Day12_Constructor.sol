// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

// constructor :部署之前須輸入初始化數據

contract Constructor {
    address public owner;
    uint public x;

    constructor (uint _x) {
        owner = msg.sender;
        x = _x;
    }
}