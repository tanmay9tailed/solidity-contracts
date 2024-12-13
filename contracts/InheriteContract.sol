// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Inherite {
    struct Inheritance {
        uint amount;
        uint releaseTime;
        uint lastVisited;
        address nominee;
    }

    mapping(address => Inheritance) public inheritances;

    function deposit(address _to) public payable {
        require(msg.value > 0, "Amount must be greater than 0");
        require(_to != address(0), "Invalid nominee address");

        Inheritance storage inheritance = inheritances[msg.sender];

        if (inheritance.nominee == address(0)) {
            // First-time deposit for this sender
            inheritances[msg.sender] = Inheritance({
                amount: msg.value,
                releaseTime: block.timestamp + 1 minutes,
                lastVisited: block.timestamp,
                nominee: _to
            });
        } else {
            // Add to existing inheritance
            require(inheritance.nominee == _to, "Nominee address mismatch");
            inheritance.amount += msg.value;
            inheritance.releaseTime = block.timestamp + 1 minutes; // Reset the timer
        }
    }

    function pull(address _from) public {
        Inheritance storage inheritance = inheritances[_from];
        require(msg.sender == inheritance.nominee, "Only the nominee can pull the funds");
        require(block.timestamp >= inheritance.releaseTime, "Funds are not yet available for release");
        require(inheritance.amount > 0, "No funds available to pull");

        uint amount = inheritance.amount;
        inheritance.amount = 0; // Reset the stored amount

        payable(msg.sender).transfer(amount);
    }

    function ping() public {
        Inheritance storage inheritance = inheritances[msg.sender];
        require(inheritance.amount > 0, "No active inheritance to extend");

        inheritance.releaseTime = block.timestamp + 1 minutes;
        inheritance.lastVisited = block.timestamp;
    }
}
