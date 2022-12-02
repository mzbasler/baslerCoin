//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract BaslerCoin{
    
    mapping(address => uint) public balances;
    
    uint public totalSuply = 21000000 * 10 ** 18;
    string public name = "Basler Coin";
    string public symbol = "BAS";
    uint public decimals = 18; 
    
    event Transfer (address indexed from, address indexed to, uint value);
    
    constructor(){
        balances [msg.sender] = totalSuply;
     }

    function balanceOf ( address owner) public view returns (uint){
        return balances [owner];
    }

    function transfer (address to, uint value) public returns(bool){
        require(balanceOf(msg.sender) >= value, "saldo insuficiente");
        balances[to] += value;
        balances [msg.sender] -= value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

}