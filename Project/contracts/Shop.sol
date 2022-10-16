// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

interface IERC20MintableBurnable is IERC20 {
    function mint(address, uint256) external;
    function burnFrom(address, uint256) external;

}

interface IERC721MintableBurnable is IERC721 {
    function safeMint(address, uint256) external;
    function burn(uint256) external;

}


contract Shop is Ownable {
    uint256 public purchaseRatio;
    uint256 public mintPrice;
    address public paymentToken;
    address public collection;
    

    constructor(uint256 _purchaseRatio, uint256 _mintPrice, address _paymentToken, address _collection){
        purchaseRatio = _purchaseRatio;
        mintPrice = _mintPrice;
        paymentToken = IERC20MintableBurnable(_paymentToken);
        collection = IERC721MintableBurnable(_collection);
    }

    function purchaseTokens() public payable {
        paymentToken.mint(msg.sender, msg.value / purchaseRatio);
    }
}
   