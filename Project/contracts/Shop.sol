// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Shop is Ownable {
    uint256 public purchaseRatio;
    uint256 public mintPrice;
    

    constructor(uint256 _purchaseRatio, uint256 _mintPrice){
        purchaseRatio = _purchaseRatio;
        mintPrice = _mintPrice;
    }
}
