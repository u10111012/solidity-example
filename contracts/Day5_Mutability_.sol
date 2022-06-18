// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

// Mutability 種類

// pure 單純讀取
// view 讀取鏈上資料 (state varibles)
// default 更改鏈上資料 可讀可寫

contract Mutability {
    uint public num; 

    function pureFunc() external pure returns (uint) {
        return 1;
    }

    function addPureFunc(uint x) external pure returns (uint) {
        return x + 1;
    }

    function viewFunc() external view returns (uint) {
        return num;
    }

    function addViewFunc(uint x) external view returns (uint) {
        return num + x;
    }

    function defaultFunc (uint _num) external returns (uint) {
        num = _num;
        return num;
    }
}