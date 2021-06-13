pragma solidity ^0.5.16;

contract MyContract{
  // define types
  string value;
  //Constructor this executes when the contract its instanciaded in the blockchain
    constructor()public{
        value= "MyValue";
    }
  //getter
  function get() public returns(string memory){
   return value;
  }
  //setter
  function set(string memory _value) public{
      value = _value;
  }
}
