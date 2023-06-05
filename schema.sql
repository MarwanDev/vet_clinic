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