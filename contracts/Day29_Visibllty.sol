// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Visibillity {
    uint private x = 0;
    uint internal y = 1;
    uint public z = 2;
    
    function privateFunction () private pure returns (uint) {
        return 0;
    }

    function internalFunction () internal pure returns (uint) {
        return 100;
    }

    function publicFunction () public pure returns (uint) {
        return 200;
    }

    function externalFunction () external pure returns (uint) {
        return 300;
    }

    function examples() external view {
        x + y + z;

        privateFunction();
        internalFunction();
        publicFunction();

        // this.externalFunction(); -- 從內部呼叫的方法(非常不建議)
    }
}

contract VisibillityChild is Visibillity {
    function examples2() external view {
        y + z;
        internalFunction();
        publicFunction();
    }
}
