// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

// 1.  呼叫function getMessageHash 輸入一段文字
// 2.  把加密過後的 bytes32 用 getEthSignMessageHash 再進行加密("\x19Ethereum Signed Message:\n32" 是一種簽章協定)
// https://github.com/ethers-io/ethers.js/issues/555 -- metamask 使用 \x19Ethereum Signed Message:\n32 做為簽章prefix

//ethereum.enable() --確認能連上metamask
// account = "metamask account"
// hash = "getEthSignMessageHash() 的return"
// ethereum.request({method:"personal_sign",params:[account,hash]}) -- 會拿到一個bytes32的簽章(_sig)

// example: _sig: 0x0b1b518722232265b171abfb67ad97dc16367778dec58cf2e9e8e4965f1224a817c23e21b03ec233aa2d97f80031dc95ae608bcaf5548253e210b3f6aa99ec341b

// 3. 把 getEthSignMessageHash 和 sig 丟進recover

contract VerifySig {
    function verify(address _signer, string memory _message, bytes memory _sig) external pure returns (bool) {
        bytes32 messageHash = getMessageHash(_message);
        bytes32 ethSignedMessageHash = getEthSignMessageHash(messageHash);

        return recover(ethSignedMessageHash, _sig) == _signer;
    }

    function getMessageHash(string memory _message) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_message));
    }

    function getEthSignMessageHash (bytes32 _messageHash) public pure returns (bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _messageHash));
    }

    function recover (bytes32 _ethSignedMessageHash, bytes memory _sig) public pure returns (address) {
        (bytes32 r, bytes32 s , uint8 v) = _split(_sig);
        return  ecrecover(_ethSignedMessageHash, v,r,s);
    }

    function _split(bytes memory _sig) internal pure returns (bytes32 r, bytes32 s, uint8 v) {
        require(_sig.length == 65, "invalid signature length");

        assembly {
            r := mload(add(_sig,32))
            s := mload(add(_sig,64))
            v := byte(0, mload(add(_sig,96))) 
        }
    }
}