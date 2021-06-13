pragma solidity ^0.5.16;

contract MyContract{
    // Set a var as public make it visible for all contract
    string public stringValue = "MyValue";
    bool public myBool = true;
    int public myInt = -1;
    uint public myUint= 1;
    uint8 public myUint8 = 8;
    uint256 public myUint256 = 9999;
    
    //In this way you define a enum class
    enum State {Waiting, Ready, Active}
    // and then you intanciate to a var
    State public state;
    // This is hard type language dont forget use the semicolons
    constructor() public{
        state = State.Waiting;
    }
    
    function activate() public{
        state = State.Active;
    }
    
    function isActive() public view returns(bool){
        return state == State.Active;
    }
}

