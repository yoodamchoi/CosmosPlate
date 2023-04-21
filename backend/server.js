const express = require('express');
const bodyParser = require('body-parser');
const { CosmosClient } = require("@azure/cosmos");

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Initialize CosmosDB client
// const cosmosEndpoint = "https://<YOUR_ACCOUNT_NAME>.documents.azure.com:443/";
// const cosmosKey = "<YOUR_ACCOUNT_KEY>";
// const cosmosClient = new CosmosClient({ endpoint: cosmosEndpoint, key: cosmosKey });

// Initialize database and container references
// const databaseId = "<YOUR_DATABASE_ID>";
// const containerId = "<YOUR_CONTAINER_ID>";
// const database = cosmosClient.database(databaseId);
// const container = database.container(containerId);

// Route for creating a reservation
app.post('/reservations', async (req, res) => {
  try {
    // Create reservation object from request body
    const reservation = {
      restaurant: req.body.restaurant,
      user: req.body.user,
      time: req.body.time,
      confirmed: false
    };
    
    // Insert reservation into CosmosDB
    const { resource: createdReservation } = await container.items.create(reservation);
    
    // Return created reservation as response
    res.status(201).send(createdReservation);
  } catch (err) {
    console.error(err);
    res.status(500).send(err);
  }
});

// Route for confirming a reservation
app.put('/reservations/:id', async (req, res) => {
  try {
    // Find reservation by ID in CosmosDB
    const { resource: reservation } = await container.item(req.params.id).read();
    
    // Update reservation to mark it as confirmed
    reservation.confirmed = true;
    const { resource: updatedReservation } = await container.item(req.params.id).replace(reservation);
    
    // Return updated reservation as response
    res.status(200).send(updatedReservation);
  } catch (err) {
    console.error(err);
    res.status(500).send(err);
  }
});

// Start server
app.listen(3000, () => {
  console.log('Server listening on port 3000');
});
