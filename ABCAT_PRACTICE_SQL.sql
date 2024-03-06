select * from film

select film,rating,rental_duration
from film

select TITLE,rating,rental_duration,rental_rate
from film
where rating in ('R','NC-17');

select TITLE,rating,rental_duration,rental_rate
from film
where rating in ('R','NC-17') AND rental_rate >=2.99;

select TITLE,rating,rental_duration,rental_rate
from film
where rating in ('R','NC-17') AND rental_rate >=2.99 AND rental_duration = 4
order by rating desc,rental_rate asc;


--Built in functions


select count(*) from film


select max(length) from film

select min(length) from film

select avg(length) from film

select sum(length) from film

select rating , count(*)
from film
group by rating
having rating ='R'

select rating , count(*)
from film
group by rating
having rating in ('R','NC-17')
ORDER BY RATING DESC

selct film.film_id, actor_id, length,rating
from film
inner join film_actor 
on film.film_id = film_actor.film_id
where rating in ('R','NC-17') AND length >= 180


select film.film_id, actor_id, length,rating
from film
inner join film_actor
on film.film_id = film_actor.film_id
where rating in ('R','NC-17') AND length>=100

select rating, round(avg(length),2) from film
group by rating


--ALIAS