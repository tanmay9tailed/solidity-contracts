// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Money{
    uint public totalMoney;
    constructor(){
        totalMoney = 0;
    }

    function DepositETH() public payable{
        totalMoney += msg.value;
    }

    function WithdrawETH(address payable ad,uint amount) public {
        if(amount>totalMoney) return;
        payable(ad).transfer(amount);
        totalMoney -= amount;
    }
}