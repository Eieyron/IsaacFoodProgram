DROP DATABASE IF EXISTS foodprogram;
CREATE DATABASE foodprogram;

USE foodprogram;

CREATE TABLE ingredients (
  ingredient_id int AUTO_INCREMENT PRIMARY KEY,
  ingredient_name varchar(256),
  ingredient_type varchar(45),
  cost float NOT NULL,
  unit varchar(45)
);

CREATE TABLE meals (
    meal_id int AUTO_INCREMENT PRIMARY KEY,
    meal_name varchar(45),
    meal_type varchar(45),
    meal_time varchar(45),
    recipe varchar(256),
);
