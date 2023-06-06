/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
select name from animals where date_of_birth between '2016-01-01' and '2019-12-10';
select name from animals where neutered = true and escape_attempts < 3;
select date_of_birth from animals where name in ('Agumon', 'Pikachu');
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered = true;
select * from animals where name != 'Gabumon';
select * from animals where weight_kg between 10.4 and 17.3;

update animals
set species = 'unspecified';

update animals
set species = null;


update animals
set species = 'unspecified'
where ;

update animals
set species = 'digimon'
where name like '%mon';

update animals
set species = 'pokemon'
where species is null;