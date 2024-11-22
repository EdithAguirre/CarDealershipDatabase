USE CarDealershipDatabase;

-- 1. Get all dealerships
SELECT * FROM dealerships;

-- 2. Find all vehicles from a specific dealership
SELECT * FROM Vehicles WHERE Dealership_id = 3;

-- 3. Find a car by VIN
SELECT	* FROM Vehicles WHERE VIN = 'WAUFFAFL9AN678901';

-- 4. Find the dealership where a certain car is located by VIN

