pragma solidity ^0.8.0;

contract Restaurant {
    address owner;
    uint256 capacity;
    mapping(uint256 => bool) reservations;

    event ReservationMade(uint256 time, address user);
    event ReservationCancelled(uint256 time, address user);

    constructor(address _owner, uint256 _capacity) {
        owner = _owner;
        capacity = _capacity;
    }

    function makeReservation(uint256 time) public {
        require(msg.sender != owner, "Owner cannot make a reservation");
        require(reservations[time] == false, "Reservation already taken");
        reservations[time] = true;
        emit ReservationMade(time, msg.sender);
    }

    function cancelReservation(uint256 time) public {
        require(reservations[time] == true, "Reservation does not exist");
        reservations[time] = false;
        emit ReservationCancelled(time, msg.sender);
    }

    function getCapacity() public view returns (uint256) {
        return capacity;
    }

    function getReservations() public view returns (mapping(uint256 => bool) memory) {
        return reservations;
    }
}
