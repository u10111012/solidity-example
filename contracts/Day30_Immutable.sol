// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Immutable {
    // 45696 gas
    // address public owner = msg.sender;
    // 43563 gas
    address public immutable owner;
    // 通常 immutable 會用在constructor裏
    constructor() {
        owner = msg.sender;
    }
    uint public x;

    function example () external {
        require (owner == msg.sender, "not owner");
        x += 1;
    }
}