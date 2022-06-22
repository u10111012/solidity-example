// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

// Data location - storage, memory and calldata
// storage 會存在鏈上的記憶體
// memory 會複製一份在 function 裡暫存 通常用於讀取資料
// calldata 單純傳輸資料 不會複製一份記憶體 通常用於 internal function 的參數傳遞 

contract DataLocations {
    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function examples (uint[] calldata y, string calldata s) external returns (uint[] memory) {
        myStructs[msg.sender] = MyStruct({ foo:123, text:"bar" });

        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo";

        MyStruct memory mystruct = myStructs[msg.sender];
        mystruct.text = "456";

        _internal(y);

        uint[] memory memArr = new uint[](2);
        memArr[0] = 234;
        return memArr; 

    }

    function _internal (uint [] calldata y) private pure {
        uint x = y[0];
    }
}