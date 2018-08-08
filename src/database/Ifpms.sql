/* Ifpms database */

drop database if exists ifpms;
create database ifpms;

use ifpms;

create table Ingredient(
    ingredient_id int AUTO_INCREMENT,
    ingredient_name varchar(45),
    ingredient_type varchar(45),
    cost int not null,
    unit varchar(45),
    PRIMARY KEY(ingredient_id)
);

-- create default instances of Ingredient
insert into Ingredient values(null, 'bawang', 'gulay', 2, 'piece');
insert into Ingredient values(null, 'sibuyas', 'gulay', 2, 'piece');

