// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

// encodeWithSelect -- 會暫存其他合約的 stateVaribles 但宣告的 stateVariables 必須相同

contract TestDelegateCall {
    // address public owner; 如果多宣告其他的stateVariables 會完全跑掉

    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) external payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract DelegateCall {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _test, uint _num) external payable {
        // _test.delegatecall(abi.encodeWithSignature("setVars(uint256)", _num));

        (bool success, ) = _test.delegatecall(abi.encodeWithSelector(TestDelegateCall.setVars.selector, _num));
        require(success, "delegate call failed");
    }
}