create database project;
use project;
create table dataset(
user_id int,
item_id int,
rating int,
time_stamp int, foreign key(item_id) references movie(item_id));
create table movie(
item_id int,
title varchar(100),primary key(item_id));
SET GLOBAL local_infile=1;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Dataset.csv' INTO TABLE dataset
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Movie_Id_Titles.csv' INTO TABLE movie
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
select * from movie;
select * from dataset;
# create a view from the dataset whose rating is 5
create view best_movie as select user_id, item_id, rating from dataset where rating = 5;
select * from best_movie;
# create a view of average rating for each movie
create view avg_rating as select item_id, avg(rating) as avg_rat from dataset group by item_id;
select * from avg_rating;

