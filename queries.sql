/*Queries that provide answers to the questions from all projects.*/
SELECT
	*
FROM
	animals
WHERE
	name LIKE '%mon';

SELECT
	name
FROM
	animals
WHERE
	date_of_birth BETWEEN '2016-01-01'
	AND '2019-01-01';

SELECT
	name
FROM
	animals
WHERE
	(neutered = true)
	AND (escape_attempts < '3');

SELECT
	date_of_birth
FROM
	animals
WHERE
	(name = 'Agumon')
	OR (name = 'Pikachu');

SELECT
	escape_attempts
FROM
	animals
WHERE
	weight_kg > '10.5';

SELECT
	name
FROM
	animals
WHERE
	neutered = true;

SELECT
	*
FROM
	animals
WHERE
	name <> 'Gabumon';

SELECT
	name
FROM
	animals
WHERE
	(weight_kg >= '10.4')
	AND (weight_kg <= '17.3');

BEGIN TRANSACTION;

UPDATE
	animals
SET
	species = 'unspecified';

SELECT
	*
FROM
	animals;

ROLLBACK;

SELECT
	*
FROM
	animals;

BEGIN;

UPDATE
	animals
SET
	species = 'digimon'
WHERE
	species LIKE '%mon';

UPDATE
	animals
SET
	species = 'pokemon'
WHERE
	species IS NULL;

SELECT
	*
FROM
	animals;

COMMIT;

SELECT
	*
FROM
	animals;

BEGIN;

DElETE FROM
	animals;

ROLLBACK;

SELECT
	*
FROM
	animals;