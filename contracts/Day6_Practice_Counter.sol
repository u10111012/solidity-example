// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Counter {
    uint public count;

    function add () external {
        count += 1;
    }

    function min () external {
        count -= 1;
    }
}