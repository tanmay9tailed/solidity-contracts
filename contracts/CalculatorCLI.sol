// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Icalculator{
    function add(uint _num) external  ;
    function subtract(uint _num) external  ;
    function divide(uint _num) external  ;
    function multiply(uint _num) external ;
    function getValue() external  view returns (uint);
}

contract CalculatorCLI{
    address public ad;
    constructor(){
        ad = 0x5FD6eB55D12E759a21C09eF703fe0CBa1DC9d88D;
    }
    function addProxy(uint _num) public {
        Icalculator(ad).add(_num);
    }
    function subProxy(uint _num) public {
        Icalculator(ad).subtract(_num);
    }
    function divideProxy(uint _num) public {
        Icalculator(ad).divide(_num);
    }
    function mulProxy(uint _num) public {
        Icalculator(ad).multiply(_num);
    }
    function getValueProxy() public view returns (uint) {
        return Icalculator(ad).getValue();
    }
}
