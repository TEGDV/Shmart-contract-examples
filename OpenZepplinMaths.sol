pragma solidity ^0.8.5;
//Handling external libraries

import "./modules/SafeMath.sol";

contract MyContract{
    //DRY - "Don't Reapeat Yourself"
    
    using SafeMath for uint256; //In this way you difine that every type that belong to uint256
    //use the SafeMath library.
    uint256 public value;
    function calculate(uint _value1,uint _value2)public{
        value = _value1.add(_value2); //And all the types inherance the SafeMath methods
    }
}
