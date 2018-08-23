/* Ifpms database */

drop database if exists ifpms;
create database ifpms;

use ifpms;

/*** START OF INGREDIENT RELATED CODE ***/

create table Ingredient(
    ingredient_id int AUTO_INCREMENT,
    ingredient_name varchar(45),
    ingredient_type varchar(45),
    cost int not null,
    unit varchar(45),
    PRIMARY KEY(ingredient_id)
);

-- procedures for Ingredient

drop procedure if exists viewAllIngredients;
drop procedure if exists viewIngredientByID;
drop procedure if exists addIngredient;
drop procedure if exists deleteIngredientByID;

delimiter //

    create procedure viewAllIngredients()
        begin
            select * from Ingredient;
        end;
    //

    create procedure viewIngredientByID( ing_id int )
        BEGIN
            select * from Ingredient where ingredient_id = ing_id;
        end;
    //

    create procedure addIngredient( name varchar(45), 
                                    type varchar(45), 
                                    cost int,
                                    unit varchar(45))
        BEGIN  
            insert into Ingredient values(null, name, type, cost, unit);
        end;
    //

    create PROCEDURE deleteIngredientByID( ing_id int )
        BEGIN
            DELETE from Ingredient where ingredient_id = ing_id;
        end;
    //
        
delimiter ;

-- create default instances of Ingredient

call addIngredient( 'bawang', 'vegetables', 2, 'piece');
call addIngredient( 'sibuyas', 'vegetables', 2, 'piece');

/*** END OF INGREDIENT RELATED CODE ***/

/*** Start of MEAL Related Code ***/

create table MEAL (
    meal_id int AUTO_INCREMENT,
    meal_name varchar(45),
    meal_type varchar(45),
    meal_time varchar(45),
    recipe varchar(256),
    PRIMARY KEY(meal_id)
);

-- procedures for Ingredient

drop procedure if exists viewAllMeals;
drop procedure if exists viewMealByID;
drop procedure if exists addMeal;
drop procedure if exists deleteMealByID;

delimiter //

    create PROCEDURE viewAllMeals()
        BEGIN
            select * from Meal;
        end;
    //

    create PROCEDURE viewMealByID( meal_id_view int )
        begin  
            select * from Meal where meal_id = meal_id_view;
        end;
    //

    create procedure addMeal (name varchar(45),
                              type varchar(45),
                              time VARCHAR(45),
                              recipe VARCHAR(255))
        BEGIN
            insert into MEAL values(null, name, type, time, recipe);
        end;
    //

    create procedure deleteMealByID( meal_id_delete int )
        BEGIN  
            delete from meal where meal_id = meal_id_delete;
        end;
    //

delimiter ;

-- create default instances of Meal

call addMeal( 'adobo', 'meat', 'dinner', 'do everything');
call addMeal( 'tuna cabbage', 'vegetable', 'breakfast', 'do everything');
call addMeal( 'pininyahang manok', 'meat', 'dinner', 'do everything');
call addMeal( 'hotdog + egg', 'meat', 'breakfast', 'do this');

/*** End of MEAL RELATED CODE ***/