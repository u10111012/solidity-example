// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

// Array - dynamic or fixed size
// push get update delete pop length
// create array in memory
// return array from function (不建議)

contract Array {
    uint[] public nums = [1,2,3];
    uint[3] public fixedNums = [4,5,6];     // 無法 pop and push 

    function examples () external {
        nums.push(4);
        uint x = nums[1];
        nums[2] = 777;
        delete nums[1];
        nums.pop();
        uint len = nums.length;

        uint[] memory a = new uint[](5);    // 無法 pop and push 
        a[1] = 123;
    }

    function returnArray () external view returns ( uint[] memory) {
        return nums;
    }
} 