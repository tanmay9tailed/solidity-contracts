// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract personsContract {
    struct Person{
        string name;
        uint age;
        address addr;
    }
    
    mapping (address => Person) public persons;

    function setPerson(string memory _name, uint _age)public {
        persons[msg.sender] = Person({
            name: _name,
            age: _age,
            addr: msg.sender
        });
    }

    function getPerson()public view returns (string memory,uint,address){
        Person memory p1 = persons[msg.sender]; 
        return (p1.name,p1.age,p1.addr);
    }
}