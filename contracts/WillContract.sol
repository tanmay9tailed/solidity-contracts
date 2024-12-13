// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WillContract{
    address public sendTo;
    constructor(address _sendTo) {
        sendTo = _sendTo;
    }
}