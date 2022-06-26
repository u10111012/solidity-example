// contracts/GameItem.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

// 測試用 metadata https://gateway.pinata.cloud/ipfs/QmQGYXD2TSXZhbL7dKTFxjCnuiXDSVnwkoWUgCxyggv9Z7
// awardItem 填入 player: 你要 mint 的地址 tokenUrl: https://gateway.pinata.cloud/ipfs/QmQGYXD2TSXZhbL7dKTFxjCnuiXDSVnwkoWUgCxyggv9Z7
// tokenURL 測試路徑是否整缺(會連到 metadata)

contract GameItem is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("GameItem", "ITM") {}

    function awardItem(address player, string memory tokenURI)
        public
        returns (uint256)
    {
        uint256 newItemId = _tokenIds.current();
        _mint(player, newItemId);
        _setTokenURI(newItemId, tokenURI);

        _tokenIds.increment();
        return newItemId;
    }
}