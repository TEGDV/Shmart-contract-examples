// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

//This contract store an amount of ether for an amount of time once the time period pass
//the money can be withdraw or realeased
contract TimeLock{
    address payable public beneficiary;
    uint256 public realeaseTime;
    
    //if the constructor use payable vars the constructor need to be payable
    constructor(address payable _beneficiary, uint256 _realeaseTime)public payable{
        require(_realeaseTime > block.timestamp);
        beneficiary = _beneficiary;
        realeaseTime = _realeaseTime;
    }
    
    // This fuction can be executed once the specified date was come, before that 
    //it fails
    function realease()payable public{
        require(block.timestamp >= realeaseTime);
        payable(beneficiary).transfer(address(this).balance);
    }
}
