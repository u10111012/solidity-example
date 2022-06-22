// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Enum {
    enum Status {
        None,
        Pending,
        Shipping,
        Completed,
        Canceled
    }

    Status public status;

    struct Order {
        address buyer;
        Status status;
    }

    Order[] public order;

    function set(Status _status) external {
        status = _status;
    }

    function get () external view returns (Status) {
        return status;
    }

    function ship () external {
        status = Status.Shipping;
    }

    function reset () external {
        delete status;
    }
}