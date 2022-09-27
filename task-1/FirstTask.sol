// "SPDX-License-Identifier: MIT";
pragma solidity ^0.8.0;

contract Collector{
    address public owner;
    uint public balance;

    constructor(){
        owner = msg.sender;
    }

    receive() payable external{
        balance +=msg.value;
    }

    function withDraw(uint _amount, address payable destAdres) public{
        require(msg.sender == owner,"Address this not owner");
        require(_amount <= balance, "insufficient balance");

        destAdres.transfer(_amount);
        balance -=_amount;
    }

}