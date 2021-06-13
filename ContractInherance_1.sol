pragma solidity ^0.8.5;
// Multiple contract communication

contract ERC20Token{
    string public name;
    mapping(address => uint256) public balances;
    
    //Keep an eye that when you call a contract from other contract
    //The msg.sender its not who invoked parent contract its the
    //Parent contract address
    function mint()public{
        balances[tx.origin]++;
    }
}

contract MyContract{
    address payable wallet;
    address public token;
    
    constructor(address payable _wallet, address _token) public{
        wallet = _wallet;
        token = _token;
    }
    // Read docs to know more about fallbacks and receivers
    fallback() external payable{
        buyToken();
    }
    
    function buyToken() public payable{
        // ERC20Token _token = <THINGS> in this way we could specify
        // the contract type of a local var
        ERC20Token(address(token)).mint();
        wallet.transfer(msg.value);
    }
}
