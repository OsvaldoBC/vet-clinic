/* Database schema to keep the structure of entire database. */
CREATE TABLE animals(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    PRIMARY KEY(id)
);

ALTER TABLE animals
ADD species VARCHAR(30);

CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(50),
    age INT,
    PRIMARY KEY(id)
);

CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    PRIMARY KEY(id)
);

/* alter table animals */

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals
ADD COLUMN species_id INT CONSTRAINT species_fk REFERENCES species (id);
ALTER TABLE animals
ADD COLUMN owner_id INT CONSTRAINT owner_fk REFERENCES owners (id);

CREATE TABLE vets(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

CREATE TABLE specializations(
    species_id INT,
    vet_id INT,
    PRIMARY KEY(species_id, vet_id)
);
