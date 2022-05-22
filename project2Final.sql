-- Taddey, Martin
-- Lee, Suyeon
-- CSCI 232
-- Avshalom, Ariel
-- May 22, 2022

-- Introduction
-- For this project, we exported the NYC OpenData dataset for "Motor Vehicle Collisions - Crashes" for New York city during
-- the period 2016-2021. We then imported this data to psql to answers seven different questions.
-- Link to dataset: https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Crashes/h9gi-nx95/data

---- Creation of Database
create database project2;

---- Creation of Tables

-- Table 1: Location and Time
-- Location, date, and time of motor vehicle collisions
create table location_time2(
  cid bigint NOT NULL PRIMARY KEY,
  cdate date,
  ctime time,
  borough varchar(20),
  zipcode varchar(5),
  lat varchar(12),
  lon varchar(11),
  onstreet varchar(40),
  crossstreet varchar(40),
  offstreet varchar (40)
);

\copy location_time(cid,cdate, ctime, borough, zipcode, lat, lon, street, crossstreet, offstreet)
FROM '/Users/martint/Desktop/Classes/2022 Spring/CSCI 232/Projects/Project2/location_time.csv' DELIMITER ',' CSV HEADER

-- Table 2: Number of Victims
-- Number of pedestrian, cyclist, and motorists that were injured or killed
create table number_victims(
  cid bigint NOT NULL PRIMARY KEY,
  totinj int,
  totkilled int NOT NULL,
  pedinj int NOT NULL,
  pedkilled int NOT NULL,
  cyclistinj int NOT NULL,
  cyclistkilled int NOT NULL,
  motorinj int NOT NULL,
  motorkilled int NOT NULL
);

\copy number_victims(cid, totinj, totkilled, pedinj, pedkilled, cyclistinj, cyclistkilled, motorinj, motorkilled)
FROM '/Users/martint/Desktop/Classes/2022 Spring/CSCI 232/Projects/Project2/number_victims.csv' DELIMITER ',' CSV HEADER

-- Table Contributing Factor Vehicle
-- Different contributing factors for motor vehicle collisions
create table contributing_factor(
  cid bigint NOT NULL PRIMARY KEY,
  confac1 varchar(100) NULL,
  confac2 varchar(100) NULL,
  confac3 varchar(100) NULL,
  confac4 varchar(100) NULL,
  confac5 varchar(100) NULL
);

\copy contributing_factor(cid, confac1, confac2, confac3, confac4, confac5)
FROM '/Users/martint/Desktop/Classes/2022 Spring/CSCI 232/Projects/Project2/contributing_factor.csv' DELIMITER ',' CSV HEADER

-- Vehicle Type
-- Type of vehicles involved in the motor vehicle collisions
create table vehicle_type(
  cid bigint NOT NULL PRIMARY KEY,
  vtype1 varchar(100) NULL,
  vtype2 varchar(100) NULL,
  vtype3 varchar(100) NULL,
  vtype4 varchar(100) NULL,
  vtype5 varchar(100) NULL
);

\copy vehicle_type(cid, vtype1, vtype2, vtype3, vtype4, vtype5)
FROM '/Users/martint/Desktop/Classes/2022 Spring/CSCI 232/Projects/Project2/vehicle_type.csv' DELIMITER ',' CSV HEADER

---- Queries:
-- Type of queries done to answer the different questions

-- Question 1
-- Has the number of car accidents increased or decreased from 2016 to 2021?
-- We reapeated this query for every year to compare them. No need for a more complex query as the number of years is small

select count(cid) from location_time where cdate between '2019-01-01' and ' 2019-12-31';


-- Question 2
-- What is the number one combination of factors that contributed to the increase/reduction of motor vehicle collisions
-- during the years analyzed?

select count(*), c.confac1, c.confac2, c.confac3, c.confac4, c.confac5
	from contributing_factor c
	inner join location_time l on c.cid = l.cid
where cdate between '2016-01-01' and ' 2021-12-31'
	group by c.confac1, c.confac2, c.confac3, c.confac4, c.confac5
	order by count(c.confac1) desc
;


-- Question 3
-- Who suffered the most number of casualties? Pedestrians, cyclists, or motorists?

select to_char(date_trunc('year', l.cdate), 'YYYY') as year,
		sum(n.pedkilled) as total_pedkilled, 
		sum(n.cyclistkilled) as total_cyclistkilled,
		sum(n.motorkilled) as total_motorkilled
	from number_victims n inner join location_time l on n.cid = l.cid
	where cdate between '2016-01-01' and '2021-12-31'
	group by year
;


-- Question 4
-- Which group had the most number of injured people? Pedestrians, cyclists, or motorists?

select to_char(date_trunc('year', l.cdate), 'YYYY') as year,
		sum(n.pedinj) as total_pedinj,
		sum(n.cyclistinj) as total_cyclistinj,
		sum(n.motorinj) as total_motorinj 
	from number_victims n
	inner join location_time l on n.cid = l.cid
	where cdate between '2016-01-01' and '2021-12-31'
	group by year
;


-- Question 5
-- During what months of the year do most accident occur?
-- We reapeated this query for every year to compare them. No need for a more complex query as the number of years is small

select to_char(date_trunc('month', cdate), 'YYYY Mon') as cmonth, count(cid)
	from location_time
	where cdate between '2016-01-01' and '2016-12-31'
	group by date_trunc('month', cdate)
	order by count(cid) desc
;


-- Question 6
-- What is the number one combination of vehicle types involved in motor vehicle collisions?

select count(*), l.borough, v.vtype1, v.vtype2, v.vtype3, v.vtype4, v.vtype5
    from location_time l
    inner join vehicle_type v on l.cid = v.cid
    group by l.borough, v.vtype1, v.vtype2, v.vtype3, v.vtype4, v.vtype5
    order by count(l.borough) desc
;


-- Question 7
-- Which borough has the highest number of car accidents?

select to_char(date_trunc('year', cdate), 'YYYY') as cyear, borough, count(cid)
	from location_time
	where cdate between '2016-01-01' and '2021-12-31'
	group by cyear, borough
	order by count(cid) desc
;