pragma solidity ^0.8.5;

contract MyContract{
    mapping(address => uint256) public balances;
    address payable wallet; //a transfer method just accept payable types
    
    
    //To handle the wallet its necesary to instance in the constructor
    //In this case the wallet its the account where the money ends
    constructor(address payable _wallet) public{
        wallet = _wallet;
    }
    // Read docs to know more about fallbacks and receivers
    fallback() external payable{
        buyToken();
    }
    
    // Payable its used to a funtion accept ether
    function buyToken() public payable{
        //Buy a buyToken
        balances[msg.sender] += 1;
        //Send ETH to the wallet
        wallet.transfer(msg.value);
    }
}
