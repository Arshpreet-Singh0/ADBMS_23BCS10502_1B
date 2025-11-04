-- INSERT

db.cars.insertMany([
  {
    carId: "CAR001",
    make: "Tesla",
    model: "Model S Plaid",
    year: 2024,
    specifications: {
      engine: "Electric Dual Motor",
      horsepower: 1020,
      batteryRange: "396 miles",
      topSpeed: "200 mph"
    },
    price: 135000,
    colorsAvailable: ["Red", "Black", "Pearl White"],
    features: {
      autopilot: true,
      fullSelfDriving: true,
      smartSummon: true
    },
    dealer: {
      dealerId: "D001",
      name: "GreenWheels Motors",
      location: {
        city: "San Francisco",
        state: "CA"
      },
      contact: "415-890-2233"
    },
    maintenanceHistory: [
      {
        date: ISODate("2025-05-12"),
        description: "Battery health check",
        cost: 250
      },
      {
        date: ISODate("2025-09-01"),
        description: "Software update v12.5",
        cost: 0
      }
    ],
    available: true,
    createdAt: new Date()
  },

  {
    carId: "CAR002",
    make: "BMW",
    model: "M8 Competition",
    year: 2023,
    specifications: {
      engine: "4.4L Twin-Turbo V8",
      horsepower: 617,
      torque: "750 Nm",
      transmission: "8-speed automatic"
    },
    price: 135500,
    colorsAvailable: ["Marina Blue", "Matte Grey", "Jet Black"],
    features: {
      cruiseControl: true,
      heatedSeats: true,
      gestureControl: true
    },
    dealer: {
      dealerId: "D002",
      name: "AutoVerse Luxury Hub",
      location: {
        city: "New York",
        state: "NY"
      },
      contact: "212-992-3300"
    },
    maintenanceHistory: [],
    available: true,
    createdAt: new Date()
  },

  {
    carId: "CAR003",
    make: "Toyota",
    model: "Land Cruiser 300 ZX",
    year: 2025,
    specifications: {
      engine: "3.3L V6 Diesel",
      horsepower: 304,
      torque: "700 Nm",
      driveType: "4WD"
    },
    price: 112000,
    colorsAvailable: ["White", "Silver", "Desert Sand"],
    features: {
      adaptiveCruise: true,
      multiTerrainMonitor: true,
      crawlControl: true
    },
    dealer: {
      dealerId: "D001",
      name: "GreenWheels Motors",
      location: {
        city: "San Francisco",
        state: "CA"
      },
      contact: "415-890-2233"
    },
    maintenanceHistory: [
      {
        date: ISODate("2025-02-18"),
        description: "Engine tuning",
        cost: 500
      }
    ],
    available: true,
    createdAt: new Date()
  }
]);


-- READ

db.cars.find({ available: true })

db.cars.find({
  "dealer.name": "GreenWheels Motors",
  price: { $gte: 100000, $lte: 140000 }
});



-- UPDATE

db.cars.updateOne(
  { carId: "CAR002" },
  {
    $set: { available: false },
    $push: {
      maintenanceHistory: {
        date: new Date(),
        description: "Sold to customer ID C101",
        cost: 0
      }
    }
  }
);


-- DELETE

db.cars.deleteMany({ year: { $lt: 2023 } });