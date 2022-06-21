// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract literableMapping {
    mapping (address => uint) public balances;
    mapping (address => bool) public inserted;
    address[] public keys;

    function set (address _key, uint _value) external {
        balances[_key] = _value;

        if (!inserted[_key]){
            inserted[_key] = true;
            keys.push(_key);
        }
    }

    function getsize () external view returns (uint) {
        return keys.length;
    }

    function first () external view returns (uint) {
        return balances[keys[0]];
    }

    function last () external view returns (uint) {
        return balances[keys[keys.length - 1]];
    }

    function get (uint _i) external view returns (uint) {
        return balances[keys[_i]];
    } 


}