// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TanmayToken {
    address public owner;
    uint public TotalSupply;
    mapping (address=>uint) balance;
    constructor() {
        owner = msg.sender;
    }
    function mintTo(address _to,uint _amount) public {
        require(owner==msg.sender, "Only Owner can MINT TOKENS");
        balance[_to] += _amount;
        TotalSupply += _amount;
    }
    function transfer(address _to,uint _amount) public {
        require(balance[msg.sender]>=_amount, "Insuffiecient Balance");
        address from = msg.sender;
        address to = _to;
        balance[from] -= _amount;
        balance[to] += _amount;
    }
    function burn(uint _amount) public {
        require(balance[msg.sender]>=_amount, "Insuffiecient Balance");
        balance[msg.sender] -= _amount;
        TotalSupply -= _amount;
    }
    function getTokenBalance() public view returns (uint){
        return balance[msg.sender];
    }
}