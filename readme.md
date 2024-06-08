# ERC20 and Vault Contracts

## Overview

This repository contains two smart contracts, an ERC20 token contract and a Vault contract, that work together to allow users to mint, transfer, approve, deposit, and withdraw tokens. The ERC20 contract handles the token logic, while the Vault contract provides functionality for depositing tokens and withdrawing corresponding shares.

## ERC20 Contract

The ERC20 contract is a standard implementation of the ERC20 token. It includes functions for minting, burning, transferring tokens, and managing allowances.

### ERC20 Token Details

- **Name**: Test Token
- **Symbol**: TST
- **Decimals**: 18

### Functions

- **transfer(address recipient, uint amount)**: Transfers tokens.
- **approve(address spender, uint amount)**: Approves `spender` to spend tokens.
- **transferFrom(address sender, address recipient, uint amount)**: Transfers tokens using the allowance mechanism.
- **mint(uint amount)**: Mints new tokens.
- **burn(uint amount)**: Burns tokens.

### Events

- **Transfer(address indexed from, address indexed to, uint value)**
- **Approval(address indexed owner, address indexed spender, uint value)**
