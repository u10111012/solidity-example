// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

contract Func {
    function add(uint x, uint y) external pure returns (uint) {
        return  x + y;
    }

    function min (uint x, uint y) external pure returns (uint) {
        return x-y;
    }
}