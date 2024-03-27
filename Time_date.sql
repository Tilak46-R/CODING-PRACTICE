select age(current_date,'1997-05-21')

select extract(year from age(current_date,'1997-05-21'))


select current_date;

select current_time;

select current_timestamp;

select extract(month from timestamp '2022-05-18')

select extract(day from timestamp '2022-05-21')

select extract(year from timestamp '2024-05-21')

select localtime;

SELECT AGE('2022-10-19 16:24:31', '2022-10-18 12:00:00');

SELECT EXTRACT(YEAR FROM TIMESTAMP '2022-10-19 16:24:31');

SELECT DATE_PART('YEAR', TIMESTAMP '2022-10-19 16:24:31');


SELECT TO_CHAR(timestamp, 'YYYY-MM-DD"T"HH24:MI:SS"Z"') AS iso_date
FROM orders;


select UPPER('hello,world') as uppercase_TEXT

select upper('hello i am tilak r')

select lower('HI I AM TILAK R') AS LOWERCASE

select left('HI I AM TILAK R',5) as left

select right('HI I AM TILAK R',5) as right


select concat('hello','I','AM','Tilak','R') as concatenated_string;


SELECT REGEXP_LIKE('hello', 'h.*o') AS match_result;

SELECT REGEXP_REPLACE('Anas Kumar', '(.*) (.*)', '\2, \1');

select regexp_replace('Anas Kumar', '(.*)(.*)','\2,\1');


--concat with separator

select concat_ws('-','2022','03','29') as date_string;

SELECT CONCAT_WS('-', '2022', NULL, '29') AS date_string;

SELECT CONCAT_WS(' ', 'Tilak', 'R') AS full_name 


CREATE TABLE movies (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255),
  release_date DATE
);

INSERT INTO movies (id, title, release_date)
VALUES
  (1, 'The Shawshank Redemption', '1994-10-14'),
  (2, 'The Godfather', '1972-03-24'),
  (3, 'The Godfather: Part II', '1974-12-20'),
  (4, 'The Dark Knight', '2008-07-18'),
  (5, '12 Angry Men', '1957-04-10'),
	(6, 'The Godfather: Part III', '1990-12-25'),
  (7, 'Pulp Fiction', '1994-10-14'),
  (8, 'The Lord of the Rings: The Fellowship of the Ring', '2001-12-19'),
  (9, 'The Dark Knight Rises', '2012-07-20'),
  (10, 'The Lion King', '1994-06-15'),
	(11, 'Forrest Gump', '1994-07-06'),
  (12, 'The Silence of the Lambs', '1991-02-14'),
  (13, 'Jurassic Park', '1993-06-11'),
  (14, 'Titanic', '1997-12-19'),
  (15, 'The Matrix', '1999-03-31'),
  (16, 'The Avengers', '2012-05-04'),
  (17, 'La La Land', '2016-12-09'),
  (18, 'Joker', '2019-10-04'),
  (19, 'Inception', '2010-07-16'),
  (20, 'The Social Network', '2010-10-01');


--Write a query to find all movies that were released in the year 1972.

select title,release_date
from movies
where extract(year from release_date) = 1972;

--Write a query to find all movies that were released in the month April.

select title,release_date
from movies
where extract(month from release_date) = 04;



--Write a query to find the title and release date of the oldest movie in the database.

select title,release_date
from movies
order by release_date asc
limit 1;


--Write a query to find the title and release date of the newest movie in the database.

select title,release_date
from movies
order by release_date desc
limit 1;


select title, release_date
from movies
where extract(year from release_date) >=2000;


SELECT title, release_date
FROM movies
WHERE release_date >= '2000-01-01' AND release_date < '2100-01-01';

select title,release_date
from movies
where extract(dow from release_date) = 5;

--dow means day of week function where sunday = 1, monday=2 and so on 

select title,release_date
from movies
where title like '%King%';

--.4. Write a query to find the title and release date of all movies that have a title consisting of only 3 words.

SELECT title, release_date
FROM movies
WHERE length(regexp_replace(title, E'\\S+', '', 'g')) = 2;