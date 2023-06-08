/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
select name from animals where date_of_birth between '2016-01-01' and '2019-12-10';
select name from animals where neutered = true and escape_attempts < 3;
select date_of_birth from animals where name in ('Agumon', 'Pikachu');
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered = true;
select * from animals where name != 'Gabumon';
select * from animals where weight_kg between 10.4 and 17.3;

begin;
update animals
set species = 'unspecified';
select * from animals;
rollback;
select * from animals;

update animals
set species = 'unspecified'
where ;

begin;
update animals
set species = 'digimon'
where name like '%mon';

update animals
set species = 'pokemon'
where species is null;
select * from animals
commit;

begin;
delete from animals;
select * from animals
rollback;
select * from animals

begin;
delete from animals where date_of_birth > '2022-01-01';
select * from animals;
savepoint save_point;
update animals
set weight_kg = -1 * weight_kg;
select * from animals;
rollback to save_point;
select * from animals;
update animals
set weight_kg = -1 * weight_kg where weight_kg < 0;
select * from animals;
commit;


--Queries for questions answered--

select count(*) from animals;
select count(*) from animals where escape_attempts = 0;
select avg(weight_kg) from animals;
SELECT name FROM animals WHERE neutered = true ORDER BY escape_attempts DESC LIMIT 1;
SELECT name FROM animals WHERE neutered = false ORDER BY escape_attempts DESC LIMIT 1;
SELECT max(weight_kg) FROM animals WHERE species = 'pokemon';
SELECT min(weight_kg) FROM animals WHERE species = 'pokemon';
SELECT max(weight_kg) FROM animals WHERE species = 'digimon';
SELECT min(weight_kg) FROM animals WHERE species = 'digimon';
SELECT max(weight_kg) FROM animals WHERE neutered = true;
SELECT min(weight_kg) FROM animals WHERE neutered = true;
SELECT max(weight_kg) FROM animals WHERE neutered = false;
SELECT min(weight_kg) FROM animals WHERE neutered = false;
select avg(escape_attempts) from animals where species = 'pokemon' and date_of_birth between '1990-01-01' and '2000-12-31';
select avg(escape_attempts) from animals where species = 'digimpn' and date_of_birth between '1990-01-01' and '2000-12-31';



select name from animals join owners on animals.owner_id = owners.id where full_name = 'Melody Pond';
select animals.name from animals join species on animals.species_id = species.id where species.name = 'Pokemon';
select animals.name, owners.full_name from animals right join owners on animals.owner_id = owners.id;
select species.name, count(animals.species_id) from animals join species on species.id = animals.species_id group by species.name;
select animals.name from animals join species on species.id = animals.species_id join 
owners on owners.id = animals.owner_id where owners.full_name = 'Jennifer Orwell' and species.name = 'Digimon';
select animals.name from animals join owners on animals.owner_id = owners.id where owners.full_name = 'Dean Winchester' and animals.escape_attempts = 0;
select owners.full_name name from animals join owners on animals.owner_id = owners.id group by owners.full_name order by count(*) desc limit 1;




select animals.name
from animals join visits
on animals.id = visits.animal_id
join vets on visits.vet_id = vets.id
where vets.name = 'William Tatcher'
order by visits.date desc limit 1;

select count(*) 
from animals join visits
on animals.id = visits.animal_id
join vets on visits.vet_id = vets.id
where vets.name = 'Stephanie Mendez';

select vets.name, species.name
from vets left join specializations
on vets.id = specializations.vet_id 
left join species 
on species.id = specializations.species_id;

select animals.name 
from animals join visits 
on animals.id = visits.animal_id 
join vets on vets.id = visits.vet_id 
where vets.name = 'Stephanie Mendez' 
and visits.date between '2020-04-01' and '2020-08-30';


select animals.name
from animals join visits
on animals.id = visits.animal_id
join vets on vets.id = visits.vet_id
group by animals.name
order by count(*) desc limit 1;


select animals.name, visits.date
from animals join visits 
on animals.id = visits.animal_id
join vets on vets.id = visits.vet_id
where vets.name = 'Maisy Smith' 
group by animals.name, visits.date 
order by count(*) desc limit 1;

select * from vets
select animals.name, animals.date_of_birth, animals.weight_kg, 
species.name, owners.full_name, vets.name, vets.age, 
vets.date_of_graduation, visits.date 
from animals join species 
on animals.species_id = species.id 
join owners on animals.owner_id = owners.id 
join visits on animals.id = visits.animal_id 
join vets on vets.id = visits.vet_id 
group by animals.name, animals.date_of_birth, 
animals.weight_kg, species.name, owners.full_name, 
vets.name, vets.age, vets.date_of_graduation, 
visits.date order by visits.date desc limit 1;


select count(*) from 
visits join vets on vets.id = visits.vet_id 
join animals on animals.id = visits.animal_id 
left join specializations 
on specializations.species_id = animals.species_id 
and specializations.vet_id = vets.id 
where specializations.species_id IS NULL;

select max(species.name) from 
animals join visits on animals.id = visits.animal_id
join species on animals.species_id = species.id
where visits.vet_id = (select id from vets where name = 'Maisy Smith')
order by count(*) desc limit 1;
