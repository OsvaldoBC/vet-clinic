/*Queries that provide answers to the questions from all projects.*/

SELECT *
FROM animals
WHERE name LIKE '%mon';
SELECT name
FROM animals
WHERE date_of_birth BETWEEN 'Jan 01,2016' AND 'Dec 31, 2019';
SELECT name
FROM animals
WHERE neutered = true
    AND escape_attempts < 3;
SELECT date_of_birth
FROM animals
WHERE name in ('Agumon', 'Pikachu');
SELECT name,
    escape_attempts
FROM animals
WHERE weight_kg > 10.5;
SELECT *
FROM animals
WHERE neutered = true;
SELECT *
FROM animals
WHERE name != 'Gabumon';
SELECT *
FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;

/*Query and update animals table*/
BEGIN;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > 'Jan 1, 2022';
SAVEPOINT savepoint1;
UPDATE animals
SET weight_kg = (weight_kg * -1);
ROLLBACK TO SAVEPOINT savepoint1;
UPDATE animals
SET weight_kg = (weight_kg * -1)
WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*)
FROM animals;

SELECT COUNT(*)
FROM animals
WHERE escape_attempts = 0;
