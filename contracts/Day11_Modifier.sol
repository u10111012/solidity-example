// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

// reuse code  
// _ 是指function執行的地方
// basic input sandwith

contract FunctionModifier {
    bool public pause;
    uint public count;

    function togglePause (bool _pause) external {
        pause = _pause;
    }

    modifier WhenNotPause () {
        require (!pause , "pause");
        _;
    }

    function addCount () external WhenNotPause {
        // require (!pause , "pause");
        count += 1 ;
    }

    function minCount () external WhenNotPause {
        // require (!pause , "pause");
        count -= 1 ;
    }

    // modifier 可放入參數
    modifier cap (uint _x) {
        require (_x < 100, "x >= 100");
        _;
    }

    function inc (uint _x) external WhenNotPause cap(_x) {
        count += _x ;
    }

    // modofier 可在function 前後執行
    modifier sandwith () {
        //code here
        count += 10;
        _;
        count *=2 ;
    } 

    function foo() external sandwith {
        count += 1;
    }
}