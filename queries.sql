/*Queries that provide answers to the questions from all projects.*/

SELECT *
FROM animals
WHERE name LIKE '%mon';
SELECT name
FROM animals
WHERE date_of_birth BETWEEN 'Jan 01,2016' AND 'Dec 31, 2019';

