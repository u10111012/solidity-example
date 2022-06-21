// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Mapping {
    mapping (address => uint) public balances;
    mapping (address => mapping(address => uint)) public isFriend;

    function examples () external {
        balances[msg.sender] = 100;
        uint bal = balances[msg.sender];
        uint bal2 = balances[address(1)];

        balances[msg.sender] += 300;
        delete balances[msg.sender];
    }
}