// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TanmayToken is ERC20, Ownable {
    constructor() ERC20("TANMAY", "TAN") Ownable(msg.sender) {
        _mint(msg.sender, 1000);
    }

    function mintTo(address _to, uint amount) public onlyOwner {
        _mint(_to, amount);
    }
}