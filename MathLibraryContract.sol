pragma solidity ^0.8.5;
//Handle maths and libraries

import "./modules/Math.sol"; //In this way you call libraries :) a strange mix of Python and JS

contract MyContract{
    //DRY - "Don't Reapeat Yourself"
    uint256 public value;
    function calculate(uint _value1,uint _value2)public{
        value = Math.divide(_value1,_value2);
    }
}

