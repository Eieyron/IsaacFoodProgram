DROP DATABASE IF EXISTS foodprogram;
CREATE DATABASE foodprogram;

USE foodprogram;

CREATE TABLE ingredients (
  ingredient_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ingredient_name varchar(256) NOT NULL,
  ingredient_type varchar(45) NOT NULL, 
  cost float NOT NULL,
  unit varchar(45) NOT NULL
);

INSERT INTO ingredients (ingredient_name, ingredient_type, cost, unit)
VALUES
('Pepper', 'misc', 1.00, '1 pack'),
('Tomato', 'fruit', 5.00, '1 pc'),
('Ginger', 'misc', 5.00, '1 pc'),
('Giniling', 'meat', 145.00, '1 kilo'),
('Bread', 'misc', 60.00, '1 pack');



CREATE TABLE meals (
    meal_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    meal_name varchar(256) NOT NULL,
    meal_type varchar(45) NOT NULL,
    meal_time varchar(45) NOT NULL,
    recipe TEXT NOT NULL
);
