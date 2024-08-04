
----------------------------------
create table EnergyCategories 
(EnergyCategoryID Serial PRIMARY KEY NOT NULL,
EnergyCategory VARCHAR (25) NULL);

Insert into EnergyCategories
(EnergyCategory)
VALUES
('Fossil'),
('Renewable');

select * from Energycategories;
-------------------------------------
create table Energy
(EnergyID Serial PRIMARY KEY NOT NULL,
Energy VARCHAR (25) NULL,
EnergyCategory VARCHAR (25) NULL);

Insert into Energy
(Energy, EnergyCategory)
VALUES
('Electricity', 'Fossil'),
('Gas', 'Fossil'),
('Steam', 'Fossil'),
('Fuel Oil', 'Fossil'),
('Solar', 'Renewable'),
('Wind', 'Renewable');

select * from energy;
-------------------------------------
 create table buildings
 (BuildingID Serial PRIMARY KEY NOT NULL,
 EnergyID INT NOT Null 
 References Energy(EnergyID),
 Building VARCHAR(100));

 Insert into Buildings
 (EnergyID, Building)
 Values
 (1, 'Empire State Building'),
 (2, 'Empire State Building'),
 (3, 'Empire State Building'),
 (3, 'Chrysler Building'),
 (1, 'Chrysler Building'),
 (1, 'Empire State Building'),
 (3, 'Empire State Building'),
 (2, 'Empire State Building');

 select building, Energy from buildings b join energy e on b.energyid = e.energyid ;

 ------------------------------------------



