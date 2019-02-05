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

CREATE TABLE meals (
    meal_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    meal_name varchar(256) NOT NULL,
    meal_type varchar(45) NOT NULL,
    meal_time varchar(45) NOT NULL,
    recipe TEXT NOT NULL
);
