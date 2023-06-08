/* Database schema to keep the structure of entire database. */
create database vet_clinic;

create table animals (
    id int primary key GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER table animals
add column species VARCHAR(250);

create table owners	 (
    id int primary key GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(250),
    age INTEGER
);

create table species	 (
    id int primary key GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
);

alter table animals
drop column species
select * from animals

alter table animals
add column species_id int,
add column owner_id int;
select * from animals


alter table animals
add foreign key(species_id)
references species(id),

add foreign key(owner_id)
references owners(id);

create table vets (
    id int primary key GENERATED ALWAYS AS IDENTITY,
    name varchar(250),
    age int,
	date_of_graduation date
);

create table specializations (
    id int primary key GENERATED ALWAYS AS IDENTITY,
    species_id int references species(id),
    vet_id int references vets(id)
);

create table visits (
    id int primary key GENERATED ALWAYS AS IDENTITY,
    animal_id int references animals(id),
    vet_id int references vets(id),
	date date
);

