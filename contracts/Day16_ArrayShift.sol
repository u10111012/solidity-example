// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract ArrayShift {
    uint[] public arr;

    function example () external {
        arr = [1,2,3,4,5];
        delete arr[1];      // [1,0,3]
    }

    // 往右平移 (不建議)
    // [1,2,3,4,5] -- 刪除index(1) -- [1,3,4,5,2] --pop() -- [1,3,4,5]
    function remove (uint index) public {
        require (index < arr.length,"index out of bound");
        for (uint i=index; i < arr.length - 1; i++ ) {
            arr[i] = arr[i+1];
        }
        arr.pop();
    }

    function test () external {
        arr = [1,2,3,4,5];
        remove(2);
        // [1,2,4,5]
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);

    }
}