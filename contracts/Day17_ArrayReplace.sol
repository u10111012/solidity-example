// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

// 與最後調換
// [1,2,3,4,5] -- remove(1) -- [1,5,3,4]
// solidity array 排序很麻煩 之後會提到

contract ArrayReplace {
    uint[] public arr;

    function remove (uint index) public {
        arr[index] = arr[arr.length -1 ];
        arr.pop();
    }

    function test () external {
        arr = [1,2,3,4,5];
        remove(1);
        // [1,5,3,4]
        assert (arr[0] == 1);
        assert (arr[1] == 5);
        assert (arr[2] == 3);
        assert (arr[3] == 4);
        assert (arr.length == 4);
    }
}