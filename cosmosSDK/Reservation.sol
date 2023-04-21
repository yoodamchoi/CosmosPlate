// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Reserve {

    struct Reservation {
        address user;
        uint256 restaurantId;
        uint256 time;
        bool confirmed;
    }

    mapping (uint256 => Reservation) public reservations;
    uint256 public reservationCount;

    event ReservationMade(uint256 reservationId, address user, uint256 restaurantId, uint256 time);
    event ReservationConfirmed(uint256 reservationId, address user, uint256 restaurantId, uint256 time);

    function makeReservation(uint256 _restaurantId, uint256 _time) public returns (uint256) {
        // Create new reservation and add to reservations mapping
        Reservation memory reservation = Reservation(msg.sender, _restaurantId, _time, false);
        reservations[reservationCount] = reservation;

        // Emit event
        emit ReservationMade(reservationCount, msg.sender, _restaurantId, _time);

        // Increment reservation count
        reservationCount++;

        // Return reservation ID
        return reservationCount - 1;
    }

    function confirmReservation(uint256 _reservationId) public returns (bool) {
        Reservation storage reservation = reservations[_reservationId];

        // Only restaurant can confirm reservation
        require(msg.sender == restaurants[reservation.restaurantId].owner, "You are not authorized to confirm this reservation.");

        // Confirm reservation
        reservation.confirmed = true;

        // Emit event
        emit ReservationConfirmed(_reservationId, reservation.user, reservation.restaurantId, reservation.time);

        return true;
    }
}
