pragma solidity ^0.8.5;

contract MyContract{
    //Only owner could see the function addPerson
    address owner;
    //This is like decorator in python
    modifier onlyOwner(){
        require(msg.sender == owner); //require that the sender be the contract owner
        _;
    }
    //This is the way that you could manipulate dates with solidity
    //In this case the modifier says that the function add Person
    //only can used after the openingTime
    modifier onlyWhileOpen(){
        require(block.timestamp >= openingTime);
        _;
    }
    uint256 openingTime = 1623546807;
    uint256 public peopleCount;
    mapping(uint => Person) public people;
    struct Person{
        uint _id;
        string _firstName;
        string _lastName;
    }
    
    constructor() public{
        owner = msg.sender;
    }
    
    function addPerson(string memory _firstName, string memory _lastName) public onlyWhileOpen{
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName,_lastName);
    }
    function incrementCount()internal{
        peopleCount +=1;
    }
}
