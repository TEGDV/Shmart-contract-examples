// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;
//an Escrow contract works as a middle men that wait until the all stakeholders
//comply with their own part of the contract
//For example in a NFT buy we need to things the Money and the asset 
//The Escrow contract wait until the stakeholders sends their respective
//transaction and then make the exchange creating an secure way to
//Exchage assets

import "./modules/SafeMath.sol";

//This is literally just someone acts as the Escrow (some friend by example)
contract Escrow{
    // the agent its the dude that deposit the Money
    address agent;
    mapping(address => uint256) public deposits;
    using SafeMath for uint256;
    
    modifier onlyAgent(){
        require(msg.sender == agent);
        _;
    }
    
    constructor() public{
        agent = msg.sender;
    }
    // The payee its the dude that reieve the money but they couldn't
    //withdraw the money until the agent invokes that function
    function deposit(address payee)public onlyAgent payable{
        uint256 amount = msg.value;
        deposits[payee] = deposits[payee].add(amount);
        
    }
    
    function withdraw(address payable payee) public onlyAgent{
        uint256 payment = deposits[payee];
        deposits[payee] = 0;
        payee.transfer(payment);
    }
}
