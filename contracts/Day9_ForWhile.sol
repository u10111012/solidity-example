// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract ForWhile {
    function Loops () external pure {
        for (uint i = 1; i < 10; i++){
            if (i == 3) {
                continue;
            }
            // code
            if (i == 5) {
                break;
            }
            //more code
        }
    }

    function sum (uint x) external pure returns (uint) {
        uint s;
        for (uint i =1; i < x; i++){
            s+=i;
        }
        return s;
    }
}