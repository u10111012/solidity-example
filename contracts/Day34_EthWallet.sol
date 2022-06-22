// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw (uint _amount) external {
        require(msg.sender == owner, "caller is not owner");
        // payable(msg.sender).transfer(_amount);

        (bool sent, ) = payable(msg.sender).call{value: _amount}("");
        require(sent, "failed to send ether");
    }

    function getbalance() external view returns (uint) {
        return address(this).balance;
    }
}