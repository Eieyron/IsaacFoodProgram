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
