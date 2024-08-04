drop view flightscombined;
drop table dflights;

--CREATE SQL TABLES

create table dflights
("Year" Int Null,     
 "Month" Int Null, 
 DayofMonth Int Null, 	
 DayOfWeek Int Null, 	
 DepTime Int Null, 
 ArrTime	Int Null, 
 UniqueCarrier varchar(10) Null, 	
 FlightNum Int NOT NULL, 	
 TailNum	varchar(10) Null, 
 ActualElapsedTime Int Null, 	
 AirTime Int Null, 
 ArrDelay Int Null, 	
 DepDelay Int Null, 	
 Origin varchar(10) Null, 	
 Dest varchar(10) Null, 	
 Distance Int Null, 	
 TaxiIn Int Null, 	
 TaxiOut	Int Null, 
 Cancelled Int Null, 	
 Diverted Int Null)

Import All data from R to Postgres SQL
Copy Dflights from 'C:\Program Files\PostgreSQL\9.3\share\Dflights.csv' DELIMITER ',' CSV;

--Create combined view

create view flightscombined as 
select tailnum, concat("month",'/',"day",'/',"year") as FlightDate, Dep_delay as DepDelay, Arr_delay as ArrDelay, Dest, Origin from flights
union all
select tailnum, concat("Month",'/',DayofMonth,'/',"Year") as FlightDate, depdelay, arrdelay, Dest, Origin from dflights;

--Average Delay Calculation
select round(avg(depdelay), 2) as avg_depDelay, round(avg(arrdelay),2) as avg_arrDelay, dest, origin from flightscombined where dest in ('JFK', 'LGA') and origin = 'HOU'
or dest = 'HOU' and origin in ('JFK', 'LGA')
group by dest, origin;

------------------------------

create table AirplaneSum
(FlightNum Int PRIMARY KEY NOT NULL,
FlighTime Int NULL,
TaxI float NULL,
TaxO float Null,
CancelCount float Null);

Import data from R to Prostgres SQL
Copy airplaneSum from 'C:\Program Files\PostgreSQL\9.3\share\airplaneSum.csv' DELIMITER ',' CSV;

