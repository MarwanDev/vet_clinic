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