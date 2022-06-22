// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    } 

    function bar() public pure virtual returns (string memory) {
        return "A";
    }

    function a() public pure returns (string memory) {
        return "A";
    }
}


contract B is A {
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }

    function bar() public pure virtual override returns (string memory) {
        return "B";
    }

    function bb() public pure virtual returns (string memory) {
        return "B";
    }

    function b() public pure returns (string memory) {
        return "B";
    }
}

contract C is A,B {

    function foo() public pure override(B,A) returns (string memory) {
        return "C";
    }

    function bar() public pure override(A,B) returns (string memory) {
        return "C";
    }

    function bb() public pure override(B) returns (string memory) {
        return "C";
    }
}    