//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Auction } from './EnglishAuction.sol';

contract AuctionFactory {
    address[] public auctions;

    event AuctionCreated(address auctionContract, address owner, uint numAuctions, address[] allAuctions);

    function AuctionFactory() {
    }

    function createAuction(uint bidIncrement, uint startBlock, uint endBlock, string ipfsHash) {
        Auction newAuction = new Auction(msg.sender, bidIncrement, startBlock, endBlock, ipfsHash);
        auctions.push(newAuction);

        AuctionCreated(newAuction, msg.sender, auctions.length, auctions);
    }

    function allAuctions() constant returns (address[]) {
        return auctions;
    }
}
