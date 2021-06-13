pragma solidity ^0.5.16;

contract MyContract{
    //Model Data
    uint256 public peopleCount;
    // A mapping its like a hashmap pair of [key, value] if you call an unexisting key
    // the map reeturn default values
    mapping(uint => Person) public people;
    //This struct is an array
   struct Person{
        uint _id; // Unssigned int
        string _firstName;
        string _lastName;
    }
    // To list all the people that exist in the mapping we need to use a for loop and call in secuence
    function addPerson(string memory _firstName, string memory _lastName)public{
        peopleCount +=1;
        people[peopleCount] = Person(peopleCount, _firstName,_lastName);
    }
}
