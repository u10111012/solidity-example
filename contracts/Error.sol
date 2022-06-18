// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract Errors{
    function testRequire(uint _i) public pure{
        require(_i<=10, "i>10");
    }

    function testRevert(uint _i) public pure {
        if(_i>10){
            revert("i>10");
        }
    }

    uint public num =123;

    function testAssert() public view {
        assert(num == 123);
    }

    function foo(uint _i) public{
        num+=1;
        require(_i < 10);
    }

    error MyEoor(address caller, uint i);

    function testcustom(uint _i) public view{
        if(_i > 10){
            revert MyEoor(msg.sender, _i);
        }
    }
}