// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FantasyGame is ERC20 {
    address public owner;

    struct Item {
        string name;
        uint256 price;
        uint256 level;
    }

    mapping(address => Item[]) public playerItems;
    mapping(uint256 => Item) public storeItems;

    constructor() ERC20("FantasyGameToken", "FGT") {
        owner = msg.sender;
        // Adding some items to the store
        storeItems[1] = Item("Sword", 100, 1);
        storeItems[2] = Item("Shield", 150, 1);
        storeItems[3] = Item("Potion", 50, 1);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    event TokensMinted(address indexed to, uint256 amount);
    event TokensBurned(address indexed burner, uint256 amount);
    event ItemRedeemed(address indexed player, uint256 itemId);
    event ItemUpgraded(address indexed player, uint256 itemId, uint256 newLevel);

    // Minting new tokens; only the owner can call this function
    function mintTokens(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
        emit TokensMinted(to, amount);
    }

    // Transferring tokens between players
    function transferTokens(address to, uint256 amount) public {
        _transfer(msg.sender, to, amount);
    }

    // Redeeming tokens for items in the in-game store
    function redeemItem(uint256 itemId) public {
        Item memory item = storeItems[itemId];
        require(item.price > 0, "Item does not exist");
        require(balanceOf(msg.sender) >= item.price, "Insufficient balance to redeem item");

        _transfer(msg.sender, address(this), item.price);
        playerItems[msg.sender].push(item);

        emit ItemRedeemed(msg.sender, itemId);
    }

    // Upgrading an item
    function upgradeItem(uint256 itemId) public {
        Item[] storage items = playerItems[msg.sender];
        bool itemFound = false;
        for (uint256 i = 0; i < items.length; i++) {
            if (keccak256(abi.encodePacked(items[i].name)) == keccak256(abi.encodePacked(storeItems[itemId].name))) {
                items[i].level += 1;
                itemFound = true;
                emit ItemUpgraded(msg.sender, itemId, items[i].level);
                break;
            }
        }
        require(itemFound, "Item not owned by player");
    }

    // Checking the balance of tokens
    function checkTokenBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }

    // Burning tokens
    function burnTokens(uint256 amount) public {
        _burn(msg.sender, amount);
        emit TokensBurned(msg.sender, amount);
    }

    // Getting the player's items
    function getPlayerItems(address player) public view returns (Item[] memory) {
        return playerItems[player];
    }

    // Function for the owner to withdraw funds from the contract
    function withdrawFunds(uint256 amount) external onlyOwner {
        require(balanceOf(address(this)) >= amount, "Insufficient contract balance");
        _transfer(address(this), msg.sender, amount);
    }
}
