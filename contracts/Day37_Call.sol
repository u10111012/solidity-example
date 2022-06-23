// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract TestCall {
    string public message;
    uint public x;

    event Log(string message);

    fallback() external payable {
        emit Log ("fall back was called");
    }

    function foo (string memory _message, uint _x) external payable returns (bool, uint) {
        message = _message;
        x = _x;
        return (true,999);
    }
}

contract Call {
    bytes public data;

    function callFoo(address _test) external payable {
        (bool success, bytes memory _data) = _test.call{value:333}(abi.encodeWithSignature("foo(string,uint256)","foo call",123));
        require(success, "call foo failed");
        data = _data;
    }

    function callDoesNotExist(address _test) external {
        (bool success, ) = _test.call(abi.encodeWithSignature("doesNotExist()"));
        require(success, "call failed");
    }
}