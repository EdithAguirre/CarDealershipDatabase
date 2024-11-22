# ---------------------------------------------------------------------- #
# Target DBMS:           MySQL                                           #
# Project name:          CarDealershipDatabase                           #
# ---------------------------------------------------------------------- #
DROP DATABASE IF EXISTS CarDealershipDatabase;

CREATE DATABASE CarDealershipDatabase;

USE CarDealershipDatabase;

# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
# Add table "Dealerships"                                                #
# ---------------------------------------------------------------------- #
CREATE TABLE `Dealerships` (
	`Dealership_id` INTEGER NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(50),
    `Address` VARCHAR(50),
	`Phone` VARCHAR(12),
	CONSTRAINT `PK_Dealerships` PRIMARY KEY(`Dealership_id`)
);

CREATE INDEX `Name` ON `Dealerships`(`Name`);

# ---------------------------------------------------------------------- #
# Add table "Vehicles"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `Vehicles` (
	`VIN` VARCHAR(17),
    `Year` INTEGER,
    `Make` VARCHAR(50),
    `Model` VARCHAR(50),
    `Vehicle_Type` VARCHAR(50),
    `Color` VARCHAR(50),
    `Odometer` FLOAT,
    `Price` FLOAT,
    `Sold` BOOLEAN,
    `Dealership_id` INTEGER NOT NULL, 
	CONSTRAINT `PK_Vehicles` PRIMARY KEY(`VIN`)
);

CREATE INDEX `Vehicle_Type` ON `Vehicles`(`Vehicle_Type`);

CREATE INDEX `Make` ON `Vehicles`(`Make`);

CREATE INDEX `Model` ON `Vehicles`(`Model`);

# ---------------------------------------------------------------------- #
# Add table "Inventory"                                                  #
# ---------------------------------------------------------------------- #
CREATE TABLE `Inventory`(
	`Dealership_id` INTEGER NOT NULL,
    `VIN` VARCHAR(17),
    CONSTRAINT `PK_Inventory` PRIMARY KEY(`Dealership_id`,`VIN`)
);


# ---------------------------------------------------------------------- #
# Add table "Sales_Contracts"                                            #
# ---------------------------------------------------------------------- #
CREATE TABLE `Sales_Contracts` (
	`VIN` VARCHAR(17),
    `Dealership_id` INTEGER,
	`Sales_Contracts_ID` INTEGER NOT NULL AUTO_INCREMENT,
	`Contract_Date` DATETIME,
	`Customer_Name` VARCHAR(50),
    `Customer_Phone_Number` VARCHAR(50),
    CONSTRAINT `PK_Sales_Contracts` PRIMARY KEY(`Sales_Contracts_ID`)
);

# ---------------------------------------------------------------------- #
# Add info into "Dealerships"                                            #
# ---------------------------------------------------------------------- #
TRUNCATE TABLE Dealerships;
INSERT INTO Dealerships (Name, Address, Phone) VALUES
('Speedy Autos', '123 Main St', '555-123-4567'),
('Luxury Rides', '456 Elm Ave', '555-234-5678'),
('Budget Wheels', '789 Oak Dr', '555-345-6789'),
('Family Cars', '321 Pine Ln', '555-456-7890'),
('Eco Drive', '654 Maple Ct', '555-567-8901'),
('Urban Motors', '789 Birch Rd', '555-678-9012'),
('Suburban Dealers', '852 Cedar St', '555-789-0123'),
('Coastal Cars', '951 Pine Ave', '555-890-1234'),
('Hometown Motors', '147 Oak Blvd', '555-901-2345'),
('Prime Auto Group', '258 Maple Dr', '555-012-3456'),
('NextGen Cars', '369 Birch Way', '555-234-5670'),
('Elite Autos', '741 Elm Ct', '555-345-6780'),
('Affordable Rides', '963 Oak Cir', '555-456-7891'),
('Family Wheels', '753 Cedar Ave', '555-567-8902'),
('Luxury Drive', '159 Maple Blvd', '555-678-9013'),
('Speedy Deals', '951 Birch St', '555-789-0124'),
('Highway Motors', '147 Pine Way', '555-890-1235'),
('Eco Motors', '258 Oak Ave', '555-901-2346'),
('City Cars', '369 Elm Dr', '555-012-3457'),
('Suburban Wheels', '741 Cedar Ct', '555-234-5671');

# ---------------------------------------------------------------------- #
# Add info into "Vehicles"                                               #
# ---------------------------------------------------------------------- #
TRUNCATE TABLE Vehicles;
INSERT INTO Vehicles (VIN, Year, Make, Model, Vehicle_Type, Color, Odometer, Price, Sold, Dealership_id) VALUES
('1HGCM82633A123456', 2023, 'Toyota', 'Corolla', 'Sedan', 'Blue', 15000.5, 22000.00, FALSE, 1),
('2FTRX18W1XCA23457', 2022, 'Honda', 'Civic', 'Sedan', 'Red', 12000.2, 21000.00, TRUE, 1),
('1GNEK13Z23R345678', 2021, 'Ford', 'F-150', 'Truck', 'Black', 20000.0, 35000.00, FALSE, 18),
('3N1CB51D24L456789', 2020, 'Chevrolet', 'Equinox', 'SUV', 'White', 25000.3, 28000.00, TRUE, 2),
('WBA3A5G50EN567890', 2023, 'BMW', 'X5', 'SUV', 'Silver', 5000.1, 60000.00, FALSE, 3),
('WAUFFAFL9AN678901', 2019, 'Audi', 'A4', 'Sedan', 'Gray', 30000.4, 35000.00, FALSE, 3),
('5YJSA1E26GF789012', 2022, 'Tesla', 'Model S', 'Electric', 'White', 8000.5, 75000.00, TRUE, 17),
('1N4AL3AP7GC890123', 2020, 'Nissan', 'Altima', 'Sedan', 'Blue', 18000.6, 25000.00, FALSE, 20),
('4JGDA5HBXFA901234', 2021, 'Mercedes-Benz', 'GLC', 'SUV', 'Green', 15000.7, 45000.00, TRUE, 5),
('1FA6P8CF4K5123456', 2023, 'Ford', 'Mustang', 'Coupe', 'Yellow', 12000.8, 55000.00, FALSE, 5),
('2HKRM4H57FH623457', 2022, 'Honda', 'CR-V', 'SUV', 'Red', 14000.9, 33000.00, FALSE, 6),
('1G1FB1RS4H5123457', 2021, 'Chevrolet', 'Camaro', 'Coupe', 'Black', 16000.1, 37000.00, TRUE, 6),
('5TFAX5GN5GX734568', 2020, 'Toyota', 'Tacoma', 'Truck', 'Blue', 22000.2, 32000.00, FALSE, 7),
('1C4BJWEG2FL834569', 2019, 'Jeep', 'Wrangler', 'SUV', 'Orange', 28000.3, 40000.00, TRUE, 13),
('4S4BSANC6K3345701', 2021, 'Subaru', 'Outback', 'SUV', 'Silver', 11000.4, 27000.00, FALSE, 8),
('KNDJT2A23C3345712', 2023, 'Kia', 'Soul', 'SUV', 'Pink', 9000.5, 24000.00, TRUE, 8),
('KMHD74LF5KU345713', 2022, 'Hyundai', 'Elantra', 'Sedan', 'Purple', 14000.6, 22000.00, FALSE, 9),
('JM3KFBDM3K1345714', 2021, 'Mazda', 'CX-5', 'SUV', 'Gray', 16000.7, 33000.00, TRUE, 9),
('1FM5K8D86HGD45715', 2023, 'Ford', 'Explorer', 'SUV', 'Black', 11000.8, 47000.00, FALSE, 19),
('3GCNWAEF5KGD45716', 2020, 'Chevrolet', 'Silverado', 'Truck', 'Red', 30000.9, 45000.00, TRUE, 10),
('5XXGT4L32HG135673', 2021, 'Kia', 'Optima', 'Sedan', 'White', 22000.5, 20000.00, TRUE, 1),
('JN8AZ1MW4AW142637', 2023, 'Nissan', 'Murano', 'SUV', 'Black', 10000.8, 34000.00, FALSE, 15),
('1C3CCBBB4CN324523', 2022, 'Chrysler', '200', 'Sedan', 'Gray', 18000.3, 25000.00, TRUE, 3),
('3VW5A7AT5FM092384', 2023, 'Volkswagen', 'Jetta', 'Sedan', 'Blue', 5000.2, 21000.00, FALSE, 4),
('2T1BURHE1KC342876', 2019, 'Toyota', 'Camry', 'Sedan', 'Red', 30000.1, 24000.00, TRUE, 5),
('1FMZU73K05UA19473', 2020, 'Ford', 'Escape', 'SUV', 'Green', 12000.6, 27000.00, FALSE, 6),
('2GNFLCEK9F6243784', 2021, 'Chevrolet', 'Traverse', 'SUV', 'Silver', 14000.4, 33000.00, TRUE, 7),
('5UXZV4C54BL721983', 2022, 'BMW', 'X3', 'SUV', 'Black', 9000.3, 49000.00, FALSE, 16),
('1GNSKJE73BR123768', 2023, 'GMC', 'Yukon', 'SUV', 'White', 7000.7, 63000.00, TRUE, 9),
('1FMEU7EE8AUA54329', 2020, 'Ford', 'Explorer', 'SUV', 'Blue', 19000.9, 45000.00, FALSE, 10);



# ---------------------------------------------------------------------- #
# Add info into "Inventory"                                              #
# ---------------------------------------------------------------------- #
TRUNCATE TABLE Inventory;
INSERT INTO Inventory (Dealership_id, VIN) VALUES
(1, '1HGCM82633A123456'),
(1, '2FTRX18W1XCA23457'),
(2, '1GNEK13Z23R345678'),
(2, '3N1CB51D24L456789'),
(3, 'WBA3A5G50EN567890'),
(3, 'WAUFFAFL9AN678901'),
(4, '5YJSA1E26GF789012'),
(4, '1N4AL3AP7GC890123'),
(5, '4JGDA5HBXFA901234'),
(5, '1FA6P8CF4K5123456'),
(6, '2HKRM4H57FH623457'),
(6, '1G1FB1RS4H5123457'),
(7, '5TFAX5GN5GX734568'),
(7, '1C4BJWEG2FL834569'),
(8, '4S4BSANC6K3345701'),
(8, 'KNDJT2A23C3345712'),
(9, 'KMHD74LF5KU345713'),
(9, 'JM3KFBDM3K1345714'),
(10, '1FM5K8D86HGD45715'),
(10, '3GCNWAEF5KGD45716');



# ---------------------------------------------------------------------- #
# Add info into "Sales_Contracts"                                        #
# ---------------------------------------------------------------------- #
TRUNCATE TABLE Sales_Contracts;
INSERT INTO Sales_Contracts (VIN, Sales_Contracts_ID, Contract_Date, Customer_Name, Customer_Phone_Number, Dealership_id) VALUES
('2FTRX18W1XCA23457', 1, '2024-11-10 14:30:00', 'Alice Johnson', '555-123-4567', 1),
('3N1CB51D24L456789', 2, '2024-11-12 10:15:00', 'Bob Smith', '555-987-6543', 2),
('WAUFFAFL9AN678901', 3, '2024-10-20 16:45:00', 'Charlie Brown', '555-555-1212', 3),
('5YJSA1E26GF789012', 4, '2024-11-05 12:00:00', 'Diana Prince', '555-111-2222', 4),
('4JGDA5HBXFA901234', 5, '2024-09-15 09:30:00', 'Ethan Hunt', '555-333-4444', 5),
('1G1FB1RS4H5123457', 6, '2024-11-18 11:20:00', 'Fiona Hill', '555-666-7777', 6),
('1C4BJWEG2FL834569', 7, '2024-10-22 14:00:00', 'George Lucas', '555-888-9999', 7),
('KNDJT2A23C3345712', 8, '2024-11-07 13:45:00', 'Hannah Montana', '555-000-1111', 8),
('JM3KFBDM3K1345714', 9, '2024-10-29 17:00:00', 'Ian Fleming', '555-222-3333', 9),
('3GCNWAEF5KGD45716', 10, '2024-11-20 08:30:00', 'Jack Reacher', '555-444-5555', 10);




# ---------------------------------------------------------------------- #
# Foreign key constraints                                                #
# ---------------------------------------------------------------------- #

ALTER TABLE `Sales_Contracts` ADD CONSTRAINT `FK_VIN` 
    FOREIGN KEY (`VIN`) REFERENCES `Vehicles` (`VIN`);

ALTER TABLE `Vehicles` ADD CONSTRAINT `FK_Dealership_id` 
    FOREIGN KEY (`Dealership_id`) REFERENCES `Dealerships` (`Dealership_id`);