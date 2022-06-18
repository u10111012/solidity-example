// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

// 錯誤處理 require revert assert
// require 適合於判斷一個條件時
// revert 適合於判斷多個條件時
// assert 適合於判斷鏈上資料
// 退回 gas, state variables 更新會被revert

// Error custom -- 8.0版本新增功能 (省gas 原因是revert 輸出的文字過長時會導致gas過高)
contract Errors {
    uint public num = 123;

    function testRequire (uint x) external pure {
        require (x <= 10, "x > 10");
    }

    function testRevert (uint x) external pure {
        if (x <= 10) {
            revert ("i > 10");
        }
    }

    function testAssert () public view {
        assert(num == 123);
    }

    function foo (uint x) external {
        num += x;
        require (x <= 10);
    }

    error MyError(address caller, uint x);

    function testCustomError (uint _x) external view {
        if (_x < 10) {
            revert MyError(msg.sender, _x);
        }
    }

}