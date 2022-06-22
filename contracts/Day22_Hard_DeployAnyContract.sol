// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

// 尚未讀完

contract TestContratc1 {
    address public owner = msg.sender;

    function setOwner (address _owner) public {
        require (msg.sender == owner, "not owner");
        owner = _owner;
    }
}

contract TestContract2 {
    address public owner = msg.sender;
    uint public value = msg.value;
    uint public x;
    uint public y;

    constructor (uint _x, uint _y) payable {
        x = _x;
        y = _y;
    }
}

contract Proxy {
    event Deploy (address);

    fallback() external payable {}

    function deploy (bytes memory _code) external payable returns (address addr) {
        assembly {
            addr := create(callvalue(), add(_code, 0x30), mload(_code))
        }
        require (addr != address(0), "deploy failed");
        emit Deploy(addr);
    }

    function execute (address _target, bytes memory _data) external payable {
        (bool success, ) = _target.call{value: msg.value}(_data);
        require (success, "failed");
    }
}

contract Helper {
    function getBytecode1() external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContratc1).creationCode;
        return bytecode;
    }

    function getBytecode (uint _x, uint _y) external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract2).creationCode;
        return abi.encodePacked(bytecode,abi.encode(_x,_y));
    }

    function getCalldata (address _owner) external pure returns (bytes memory) {
        return abi.encodeWithSignature("setOwner(address)", _owner);
    }
}