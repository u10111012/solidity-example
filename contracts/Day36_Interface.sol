// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

interface ICounter {
    function count() external view returns (uint);
    function add() external;
}

contract CallInterface {
    uint public count;

    function examples (address _count) external {
        ICounter(_count).add();
        count = ICounter(_count).count();
    }
}