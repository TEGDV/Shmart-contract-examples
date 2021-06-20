pragma solidity ^0.8.0;
import "./Ownable.sol";
contract MessageStore is Ownable{
    //Basic patterns on solidity

    string private message; 
    
    function setMessage(string memory _message)public payable{
        assert(msg.value == 3 ether);
        message = _message;
    }
    
    function getMessage()public view returns(string memory){
        return message;
    }
    
    function getBalance() public view  returns(uint){
        return address(this).balance;
    }
    
    function getBalanceInEther()public view returns(uint){
        return getBalance()/1e18;
    }
    
    function transferTo(uint _amount) public payable isOwner{
        require(address(this).balance >= _amount);
        payable(owner).transfer(_amount);
    }
    function transferToAddress(address payable _to, uint _amount) public payable isOwner{
        require(address(this).balance>=_amount);
        require(_to != address(0));
        _to.transfer(_amount);
    }
}
