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

BEGIN;

DElETE FROM
	animals
WHERE
	date_of_birth > '2022-01-01';

SAVEPOINT my_savepoint;

UPDATE
	animals
SET
	weight_kg = weight_kg * -1;

ROLLBACK TO SAVEPOINT my_savepoint;

UPDATE
	animals
SET
	weight_kg = weight_kg * -1
WHERE
	weight_kg < 0;

COMMIT;

--Queries questions
SELECT
	count(id) as Count
FROM
	animals;

SELECT
	COUNT(*)
FROM
	animals
WHERE
	escape_attempts = 0;

SELECT
	AVG(weight_kg) as average_Weight
FROM
	animals;

SELECT
	name,
	neutered
FROM
	animals
WHERE
	escape_attempts = (
		SELECT
			MAX(escape_attempts)
		FROM
			animals
	)
GROUP BY
	name,
	neutered;

SELECT
	species,
	MIN(weight_kg) AS min,
	MAX(weight_kg) AS max
FROM
	animals
GROUP BY
	species;

SELECT
	species,
	AVG(escape_attempts)
FROM
	animals
WHERE
	date_of_birth BETWEEN '1990-01-01'
	AND '2000-01-01'
GROUP BY
	species;

-- Create owners table
CREATE TABLE owners(
	id serial PRIMARY KEY,
	full_name varchar(255),
	age INT,
);

-- Create species table
CREATE TABLE species(id serial PRIMARY KEY, name varchar(255));

-- Drop/delete species column from animals table
ALTER TABLE
	animals DROP COLUMN species;

-- Connect species table into animals table
ALTER TABLE
	animals
ADD
	species_id INT,
ADD
	CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id) ON DElETE CASCADE;
-- Connect owners table into animals table
ALTER TABLE
	animals
ADD
	owners_id INT,
ADD
	CONSTRAINT fk_owners FOREIGN KEY (owners_id) REFERENCES owners(id) ON DElETE CASCADE;