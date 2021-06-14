// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

//This module its a ERC20 Custom Token contract
import "./modules/Token.sol";
//This contract store an amount of ether that could be exchaged by the custom token
//And the new token can be withdraw once the realeaseTime comes
contract TokenTimeLock{
    
    Token public token;
    address payable beneficiary;
    uint256 public realeaseTime;
    
    constructor(Token _token, address payable _beneficiary, uint256 _realeaseTime) public payable{
        //This is the time validator, you only could send valid dates    
        require(_realeaseTime > block.timestamp);
        token = _token;
        beneficiary = _beneficiary;
        realeaseTime = _realeaseTime;
    }
    
    function realease()public payable{
        require(block.timestamp >= realeaseTime);
        uint256 amount = token.balanceOf(address(this));
        require(amount > 0);
        token.transfer(beneficiary, amount);
    }
}
