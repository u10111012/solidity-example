// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

// fallback() or receive()
// calldata 不填走 receive 但要看 contract 有沒有receive function 沒有走fallback
// calldata 有填統一走 fallback
 
contract Fallback{
    event Log(string func, address sender, uint value, bytes data);

    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }
}