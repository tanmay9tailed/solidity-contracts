// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract calculator {
    uint num = 0;
    constructor(uint _num){
        num = _num;
    }
    function add(uint _num) public {
        num += _num;
    }
    function subtract(uint _num) public {
        num -= _num;
    }
    function divide(uint _num) public {
        num /= _num;
    }
    function multiply(uint _num) public {
        num *= _num;
    }
    function getValue() public view returns (uint) {
        return num;
    }
    
}

