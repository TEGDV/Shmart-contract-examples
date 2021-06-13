pragma solidity ^0.8.5;

contract MyContract{
    mapping(address => uint256) public balances;
    address payable wallet;
    
    //Events are the way the people could subscribe to know when something
    //happen in this shmart contract
    event Purchase(
        address indexed _buyer,
        uint256 _amount
        );
    
    constructor(address payable _wallet) public{
        wallet = _wallet;
    }
    // Read docs to know more about fallbacks and receivers
    fallback() external payable{
        buyToken();
    }
    
    // Payable its used to a funtion accept ether
    function buyToken() public payable{
        balances[msg.sender] += 1;
        wallet.transfer(msg.value);
        // this send a logs as json format that contains the info instanciated in the event 
        // definition
        emit Purchase(msg.sender, msg.value);
    }
}
