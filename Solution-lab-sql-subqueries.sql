/* 1. Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system. */
select title, count(*) as count
from (
		select title
		from film
		join inventory
		on film.film_id = inventory.film_id) as subquery
where title = "Hunchback Impossible";

/* 2. List all films whose length is longer than the average length of all the films in the Sakila database. */
select title, length
from film
where length > (select avg(length) from film)
order by length desc;

/* 3. Use a subquery to display all actors who appear in the film "Alone Trip". */
select title, concat(first_name, " ", last_name) as full_name   
from sakila.actor
inner join (
			select film_actor.actor_id, film.title, film.film_id  
			from sakila.film_actor
			join sakila.film  
			on film_actor.film_id = film.film_id) as film_names
on actor.actor_id = film_names.actor_id
having title = "Alone Trip"
order by full_name asc;