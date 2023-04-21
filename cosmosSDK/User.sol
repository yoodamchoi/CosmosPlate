pragma solidity ^0.8.0;

contract User {
    
    // state variables
    address public owner;
    string public name;
    string public email;
    uint public reservationCount;
    
    // constructor
    constructor(string memory _name, string memory _email) {
        owner = msg.sender;
        name = _name;
        email = _email;
        reservationCount = 0;
    }
    
    // modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }
    
    // function to update the user's name
    function updateName(string memory _name) public onlyOwner {
        name = _name;
    }
    
    // function to update the user's email
    function updateEmail(string memory _email) public onlyOwner {
        email = _email;
    }
    
    // function to increment the user's reservation count
    function incrementReservationCount() public onlyOwner {
        reservationCount += 1;
    }
    
    // function to get the user's reservation count
    function getReservationCount() public view returns (uint) {
        return reservationCount;
    }
}
