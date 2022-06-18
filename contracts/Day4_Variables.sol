// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

// StateVaribles localVariables globalVaribles 區別

// StateVariables: 儲存於 contract 之內 function 之外
// localVariables: 儲存於 function 之內
// globalVaribles: 預設變數 可隨意調用

contract Var {
    uint public stateVariables = 123;

    function func () external {
        uint localVariables;  // default 0
        localVariables += 1;

        stateVariables += 2;
    }

    function glob () external view returns (address, uint, uint) {
        address sender = msg.sender;
        uint timestamp = block.timestamp;
        uint blockNum = block.number;

        return (sender, timestamp, blockNum);
    }
}