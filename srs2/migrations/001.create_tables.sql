DROP SCHEMA IF EXISTS mineral_water_catalog CASCADE;
CREATE SCHEMA IF NOT EXISTS mineral_water_catalog;

SET search_path TO mineral_water_catalog;

CREATE TABLE IF NOT EXISTS manufacturer (
    manufacturer_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    CONSTRAINT unique_manufacturer_name_country UNIQUE (name, country),
    CONSTRAINT check_manufacturer_name_not_empty CHECK (
        LENGTH(TRIM(name)) > 0
    ),
    CONSTRAINT check_manufacturer_name_uppercase CHECK (
        name = UPPER(name)
    ),
    CONSTRAINT check_country_not_empty CHECK (
        LENGTH(TRIM(country)) > 0
    ),
    CONSTRAINT check_country_uppercase CHECK (
        country = UPPER(country)
    )
);

CREATE TABLE IF NOT EXISTS water (
    water_id SERIAL PRIMARY KEY,
    water_name VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL,
    manufacturer_id INT NOT NULL,
    CONSTRAINT fk_water_manufacturer
        FOREIGN KEY (manufacturer_id)
        REFERENCES manufacturer(manufacturer_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT check_water_name_not_empty CHECK (
        LENGTH(TRIM(water_name)) > 0
    ),
    CONSTRAINT check_water_name_uppercase CHECK (
        water_name = UPPER(water_name)
    ),
    CONSTRAINT check_type_not_empty CHECK (
        LENGTH(TRIM(type)) > 0
    ),
    CONSTRAINT check_type_uppercase CHECK (
        type = UPPER(type)
    )
);

CREATE TABLE IF NOT EXISTS indication (
    indication_id SERIAL PRIMARY KEY,
    indication_name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    CONSTRAINT unique_indication_name UNIQUE (indication_name),
    CONSTRAINT check_indication_name_not_empty CHECK (
        LENGTH(TRIM(indication_name)) > 0
    ),
    CONSTRAINT check_indication_name_uppercase CHECK (
        indication_name = UPPER(indication_name)
    ),
    CONSTRAINT check_description_not_empty CHECK (
        LENGTH(TRIM(description)) > 0
    ),
    CONSTRAINT check_description_uppercase CHECK (
        description = UPPER(description)
    )
);

CREATE TABLE IF NOT EXISTS water_indication (
    water_id INT NOT NULL,
    indication_id INT NOT NULL,
    PRIMARY KEY (water_id, indication_id),
    CONSTRAINT fk_wi_water
        FOREIGN KEY (water_id)
        REFERENCES water(water_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_wi_indication
        FOREIGN KEY (indication_id)
        REFERENCES indication(indication_id)
        ON DELETE RESTRICT
);
