# CosmosPlate
## Summary
CosmosPlate is a blockchain-based restaurant reservation system that allows users to discover and book reservations at top-rated restaurants. The system uses the Cosmos SDK and smart contracts to manage restaurant information, reservation details, and user ratings and reviews. By leveraging the security and transparency of blockchain technology, CosmosPlate provides a reliable and trustworthy platform for both restaurants and diners. With a user-friendly interface and powerful features like real-time availability updates and integrated payment processing, CosmosPlate aims to revolutionize the restaurant industry and make it easier for diners to enjoy delicious meals at their favorite establishments.
## How it works
1.	User account creation: Users would create an account on the CosmosPlate reservation website/app, providing their personal information such as name, email address, and phone number. They would also have the option to link their account to a cryptocurrency wallet for payment processing.
2.	Restaurant browsing and selection: Users would be able to browse a list of restaurants in their area and view information about each one, such as the restaurant name, cuisine type, location, availability, and rating. They could filter the results based on their preferences, such as date and time, party size, or dietary restrictions. When they find a restaurant they want to book, they would select an available reservation time and enter their desired details.
3.	Reservation submission: When the user submits their reservation request, the details would be sent to the CosmosPlate backend, which would use smart contracts to store the data on the Cosmos blockchain. The blockchain would provide an immutable record of the transaction, making it impossible to tamper with or manipulate the reservation data.
4.	Reservation confirmation: The restaurant would receive the reservation request and confirm it, also using the blockchain to record the confirmation. The user would receive a notification of the confirmation, either via email, SMS, or through the reservation website/app.
5.	Reservation management: If the user needs to cancel or modify their reservation, they can do so through the website/app, and the updates will be recorded on the blockchain. The restaurant would also be able to modify or cancel the reservation if needed.
6.	Check-in: On the day of the reservation, the user would show up at the restaurant and be able to check in through the website/app, which would again use the blockchain to record the transaction. The restaurant would confirm the check-in and mark the reservation as fulfilled on the blockchain.
7.	Payment processing: If the user has linked their account to a cryptocurrency wallet, the payment for the reservation would be automatically processed through the blockchain, with funds transferred to the restaurant owner. If the user has not linked their account to a cryptocurrency wallet, they would need to pay in person at the restaurant.
## Sequence diagram
<img width="452" alt="image" src="https://user-images.githubusercontent.com/114115158/233745444-4ebf6fbf-e38b-4062-853a-538d21b24913.png">
This sequence diagram shows the interactions between the user, the reservation website/app, the Cosmos blockchain, and the restaurant in a hypothetical restaurant reservation system.
First, the user logs in to the reservation website/app, which then displays a list of available restaurants and reservation times. The user then selects a restaurant and reservation time.
Next, the reservation details are stored on the Cosmos blockchain to provide an immutable record of the transaction. The reservation request is then sent to the restaurant, which confirms the reservation. The confirmation is stored on the Cosmos blockchain to record the transaction.
If the user needs to cancel or modify their reservation, they can do so through the website/app, and the updates will be recorded on the Cosmos blockchain. Finally, on the day of the reservation, the user checks in at the restaurant, and the check-in transaction is recorded on the Cosmos blockchain.
Overall, the sequence diagram shows how the various components of the system work together to facilitate the reservation process and ensure that all transactions are recorded accurately and securely on the Cosmos blockchain.
## Architecture diagram
<img width="267" alt="image" src="https://user-images.githubusercontent.com/114115158/233745477-56bd8eed-7041-4475-8570-c0af96394793.png">
This architecture consists of three main components:
•	Frontend: The user-facing interface of the reservation website/app, which is responsible for displaying the map, restaurant listings, and reservation-related functionality.
•	Backend API: The server-side component that handles API calls from the frontend, communicates with the Cosmos DB, and performs any necessary business logic.
•	Cosmos DB: The distributed database that stores reservation and confirmation details on the Cosmos blockchain.
When a user interacts with the frontend, such as by selecting a restaurant and reservation time, the frontend sends an API call to the backend API. The backend API then stores the reservation details on the Cosmos blockchain and sends a confirmation to the restaurant. If the user needs to modify or cancel their reservation, the frontend sends another API call to the backend API, which updates the reservation details on the Cosmos blockchain.
To display the map and top-rated restaurants, the frontend can make API calls to the backend API, which in turn queries the Cosmos DB for reservation and rating data. The backend API can then return this data to the frontend, which can use it to display the map and restaurant listings.
## Architecture
### Data model
•	Users: Information about users who are using the reservation system.
•	Restaurants: Information about the restaurants that are registered in the system.
•	Reservations: Information about reservations made by users, including the restaurant, reservation time, user details, and reservation status.
•	Confirmations: Information about the confirmations made by the restaurant, including the reservation details, confirmation status, and confirmation time.
### Frontend
The project's frontend is a web-based user interface that customers can use to browse restaurants, view availability, and make reservations. The frontend communicates with the backend server through a RESTful API to request data and update reservations.
### Backend
•	A server-side application that receives user requests from the frontend and communicates with the Cosmos blockchain to store reservation and confirmation details.
•	The backend also handles user authentication and manages the restaurant data (e.g., available reservation times, capacity).
### Cosmos blockchain
•	The blockchain stores immutable records of reservation requests, confirmations, and check-ins.
•	It provides a transparent and secure ledger for recording all transactional data related to the reservation system.
### Smart contracts
#### Restaurant.sol
Variables:
•	owner: an address variable that stores the address of the owner of the restaurant
•	capacity: a uint256 variable that stores the maximum capacity of the restaurant
•	reservations: a mapping that stores the availability status of each reservation slot. It maps a uint256 timestamp to a bool indicating whether or not the slot is reserved.
Events:
•	ReservationMade: an event that is emitted when a reservation is made. It includes the timestamp of the reservation and the address of the user who made the reservation.
•	ReservationCancelled: an event that is emitted when a reservation is cancelled. It includes the timestamp of the reservation and the address of the user who cancelled the reservation.
Functions:
•	constructor: a constructor function that initializes the owner and capacity variables.
•	makeReservation: a function that allows a user to make a reservation for a particular time slot. It checks if the caller is not the owner and if the reservation slot is available. If these conditions are met, it sets the reservation slot to be taken and emits an ReservationMade event with the time and the caller's address.
•	cancelReservation: a function that allows a user to cancel their reservation for a particular time slot. It checks if the reservation slot exists and if it is taken. If these conditions are met, it frees up the reservation slot and emits an ReservationCancelled event with the time and the caller's address.
•	getCapacity: a function that returns the maximum capacity of the restaurant.
•	getReservations: a function that returns a mapping of reservation slots and their availability status.
####User.sol
Variables:
•	owner: an address type variable that stores the address of the user who created the contract instance
•	name: a string type variable that stores the name of the user
•	email: a string type variable that stores the email of the user
•	reservationCount: a uint type variable that stores the number of reservations made by the user
Functions:
•	constructor: the constructor function takes two arguments, the name and email of the user, and initializes the state variables accordingly
•	onlyOwner modifier: a modifier that restricts access to functions to only the contract owner, which is checked by comparing the caller's address to the owner's address
•	updateName: a function that allows the owner to update the name of the user
•	updateEmail: a function that allows the owner to update the email of the user
•	incrementReservationCount: a function that allows the owner to increment the reservation count of the user
•	getReservationCount: a function that returns the reservation count of the user. This function is view-only, meaning it does not modify the state of the contract.
####Reservation.sol
Variables:
•	reservations: a mapping that maps a uint256 key to a Reservation struct value, representing reservations made by users.
•	reservationCount: a uint256 variable that keeps track of the number of reservations made by users.
Events:
•	ReservationMade: an event that is emitted when a reservation is made. It includes the following fields:
•	reservationId: a uint256 variable that stores the ID of the reservation made.
•	user: an address variable that stores the address of the user who made the reservation.
•	restaurantId: a uint256 variable that stores the ID of the restaurant for which the reservation was made.
•	time: a uint256 variable that stores the timestamp of the reservation.
•	ReservationConfirmed: an event that is emitted when a reservation is confirmed by the restaurant. It includes the following fields:
•	reservationId: a uint256 variable that stores the ID of the reservation confirmed.
•	user: an address variable that stores the address of the user who made the reservation.
•	restaurantId: a uint256 variable that stores the ID of the restaurant for which the reservation was made.
•	time: a uint256 variable that stores the timestamp of the reservation.
Functions:
•	makeReservation: a function that allows a user to make a reservation for a particular time slot. It takes two arguments:
•	_restaurantId: a uint256 variable that represents the ID of the restaurant for which the reservation is made.
•	_time: a uint256 variable that represents the timestamp of the reservation. The function creates a new Reservation struct with the caller's address, _restaurantId, _time, and false (unconfirmed) as the fields. It adds this reservation to the reservations mapping with the current reservationCount as the key, and increments reservationCount by 1. Finally, it emits a ReservationMade event with the reservationCount, caller's address, _restaurantId, and _time, and returns the reservationCount - 1 as the reservation ID.
•	confirmReservation: a function that allows the restaurant to confirm a reservation made by a user. It takes one argument:
•	_reservationId: a uint256 variable that represents the ID of the reservation to be confirmed. The function first retrieves the Reservation struct from the reservations mapping with the given _reservationId. It then checks if the caller is the owner of the restaurant for which the reservation was made, using the restaurants mapping that is not defined in the code provided. If the caller is not the owner, it reverts with an error message. If the caller is the owner, it sets the confirmed field of the Reservation struct to true, and emits a ReservationConfirmed event with the _reservationId, caller's address, _restaurantId, and _time. Finally, it returns true.
### Database
The reservation and confirmation details are stored in a distributed database, such as Cosmos DB, which can scale horizontally across multiple regions and handle high traffic volumes. The database is managed by the cloud provider and can be easily accessed and managed through the backend server.
### API
The project uses RESTful APIs to communicate between the frontend and backend, allowing customers to make and view reservations, and restaurants to confirm and manage their reservations.
