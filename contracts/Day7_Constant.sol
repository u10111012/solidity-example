// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;
// 部署需花費 119816 gas
contract Constant {
    address public constant MyAccount = 0xEc82818BBD209f6694165757f9Ac9A0d0C7048aB; 
}
// 部署需花費 149779 gas
contract NotConstant {
    address public MyAccount = 0xEc82818BBD209f6694165757f9Ac9A0d0C7048aB;
}