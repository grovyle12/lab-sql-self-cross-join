-- Get all pairs of actors that worked together.
use sakila;
select c1.actor_id, actor.first_name, actor.last_name,c2.actor_id, actor.first_name, actor.last_name, c1.film_id
from film_actor as c1
join film_actor as c2
on c1.actor_id <> c2.actor_id
and c1.film_id = c1.film_id
join actor
on actor.actor_id = c1.actor_id;

-- Finalish Answer.
select c1.film_id,c1.actor_id, c2.actor_id
from film_actor c1
join film_actor c2
on c1.actor_id < c2.actor_id
and c1.film_id = c2.film_id;

-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
select c1.film_id,c1.actor_id, c3.first_name, c2.actor_id, c4.first_name
from film_actor c1
join film_actor c2
on c1.actor_id < c2.actor_id
and c1.film_id = c2.film_id
join actor c3
on c1.actor_id = c3.actor_id
join actor c4
on c2.actor_id = c4.actor_id;

-- NOW!!!!.....
select c1.film_id,c1.actor_id, concat(c3.first_name," ",c3.last_name) as Actor_1, c2.actor_id, concat(c4.first_name," ",c4.last_name) as Actor_2
from film_actor c1
join film_actor c2
on c1.actor_id < c2.actor_id
and c1.film_id = c2.film_id
join actor c3
on c1.actor_id = c3.actor_id
join actor c4
on c2.actor_id = c4.actor_id
order by c1.film_id


-- Get all pairs of customers that have rented the same film more than 3 times.
-- before
SELECT c1.inventory_id, c1.customer_id, c2.customer_id
FROM rental AS c1
JOIN rental AS c2 
ON c1.customer_id <> c2.customer_id
AND c1.inventory_id = c2.inventory_id 
order by c1.inventory_id; 

-- After

SELECT c1.inventory_id, c1.customer_id, c2.customer_id
FROM rental AS c1
JOIN rental AS c2 
ON c1.customer_id < c2.customer_id
AND c1.inventory_id = c2.inventory_id 
order by c1.inventory_id; 
-- Now to add the +3 Filter

SELECT c1.inventory_id,concat(c1.customer_id,',',c2.customer_id) as Pairs
FROM rental AS c1
JOIN rental AS c2 
ON c1.customer_id < c2.customer_id
AND c1.inventory_id = c2.inventory_id 
order by c1.inventory_id; 

-- Get all possible pairs of actors and films.

select film.title,film.film_id,actor.actor_id, concat(actor.first_name,' ',actor.last_name) as Actor_Name
from actor
cross join film
order by actor_id -- may take this out later.





