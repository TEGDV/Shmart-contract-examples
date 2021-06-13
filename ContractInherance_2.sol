pragma solidity ^0.8.5;
// Multiple contract communication

contract ERC20Token{
    string public name;
    mapping(address => uint256) public balances;
    
    constructor(string memory _name) public{
        name=_name;
    }
    //Keep an eye that when you call a contract from other contract
    //The msg.sender its not who invoked parent contract its the
    //Parent contract address
    //The virtual stament mean that the behavior of this function could be
    //modificated by some child contract that inherit from ERC20Token contract
    function mint() virtual public{
        balances[tx.origin]++;
    }
}

contract MyToken is ERC20Token{
    string public symbol;
    address[] public owners;
    uint256 ownerCount;
    
    constructor(string memory _name, string memory _symbol) ERC20Token(_name) public{
        symbol = _symbol;
    }
    //The override keyword means that this its a function that inherits from a parent contract
    //And was overrided by the child contract this is the way Solidity handle the Polimorfism
    function mint() public override{
        super.mint(); // The way to inherance a class, if you use the contract name actually works, like ERC20Token.mint()
        ownerCount++;
        owners.push(msg.sender);
    }
}

