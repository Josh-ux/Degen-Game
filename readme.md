# Fantasy Game Contract

## Overview

The Fantasy Game contract is a smart contract built on the Ethereum blockchain using Solidity. It allows players to mint, transfer, redeem items, upgrade items, and manage tokens within the game environment. The contract also provides functionality for the owner to manage funds.

## Functionality

- **Minting Tokens**: The owner can mint new tokens and distribute them to players as rewards.
- **Transferring Tokens**: Players can transfer tokens between each other.
- **Redeeming Items**: Players can redeem items from the in-game store using their tokens.
- **Upgrading Items**: Players can upgrade their owned items using tokens.
- **Checking Token Balance**: Players can check their token balance at any time.
- **Burning Tokens**: Players can burn tokens that are no longer needed.
- **Withdrawing Funds**: The owner can withdraw funds from the contract.

## Contract Details

- **Name**: FantasyGameToken
- **Symbol**: FGT

## Events

- **TokensMinted(address indexed to, uint256 amount)**: Emitted when tokens are minted.
- **TokensBurned(address indexed burner, uint256 amount)**: Emitted when tokens are burned.
- **ItemRedeemed(address indexed player, uint256 itemId)**: Emitted when an item is redeemed.
- **ItemUpgraded(address indexed player, uint256 itemId, uint256 newLevel)**: Emitted when an item is upgraded.

## Installation and Usage

1. Deploy the Fantasy Game contract on the Ethereum blockchain.
2. Mint tokens to distribute to players using the `mintTokens` function.
3. Players can interact with the contract to transfer tokens, redeem items, upgrade items, and check balances.
4. The owner can withdraw funds from the contract using the `withdrawFunds` function.

## License

This project is licensed under the MIT License.
