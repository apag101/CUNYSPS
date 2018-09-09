Drop schema if exists `movies`;
CREATE SCHEMA `movies`;

use movies;

DROP TABLE IF EXISTS movies;
CREATE TABLE movies
(
movie varchar(100) NOT NULL,
id MEDIUMINT NOT NULL AUTO_INCREMENT,
PRIMARY KEY (id)
);

DROP TABLE IF EXISTS firsnames;
CREATE TABLE firstnames
(
firstname varchar(30) NOT NULL,
id MEDIUMINT NOT NULL AUTO_INCREMENT,
PRIMARY KEY (id)
);

DROP TABLE IF EXISTS ratings;
CREATE TABLE ratings
(
name SMALLINT UNSIGNED NOT NULL REFERENCES firstnames(id),
moviename SMALLINT UNSIGNED NOT NULL REFERENCES movies(id),
rating int NOT NULL
);

INSERT INTO firstnames (firstname) VALUES
    ('Nancy'),('Anthony'),('Mark'),
    ('Isabel'),('Andy');

select * from firstnames;

INSERT INTO movies (movie) VALUES
    ('Avatar'),('Saving Private Ryan'),('Coming To America'),
    ('Elf'),('Black Panther'),('Independence Day');

select * from movies;

INSERT INTO ratings (name, moviename, rating) VALUES
    (1,1,5),(1,2,3),(1,3,3),(1,4,5),(1,5,4),(1,6,5),
    (2,1,5),(2,2,5),(2,3,4),(2,4,4),(2,5,5),(2,6,4),
    (3,1,4),(3,2,3),(3,3,3),(3,4,5),(3,5,3),(3,6,3),
    (4,1,4),(4,2,2),(4,3,3),(4,4,5),(4,5,3),(4,6,3),
    (5,1,3),(5,2,4),(5,3,4),(5,4,3),(5,5,5),(5,6,2);

select * from ratings;

select movie, firstname, rating INTO OUTFILE 'c:/temp/movies.csv'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n'
from movies m
inner join ratings r on r.moviename = m.id
inner join firstnames f on r.name = f.id;

