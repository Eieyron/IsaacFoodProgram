/* Ifpms database */

drop database if exists ifpms;
create database ifpms;

create table Ingredient(
    ingredient_id int not null AUTO_INCREMENT,
    ingredient_type varchar(45),
    quantity int not null,
    cost int not null,
    unit varchar(45)
);

