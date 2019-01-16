/* Ifpms database */

drop database if exists ifpms;
create database ifpms;

use ifpms;

/*** START OF INGREDIENT RELATED CODE ***/

create table Ingredient(
    ingredient_id int AUTO_INCREMENT,
    ingredient_name varchar(45),
    ingredient_type varchar(45),
    cost float not null,
    unit varchar(45),
    PRIMARY KEY(ingredient_id)
);

-- procedures for Ingredient

drop procedure if exists viewAllIngredients;
drop procedure if exists viewIngredientByID;
drop procedure if exists addIngredient;
drop procedure if exists deleteIngredientByID;
drop procedure if exists updateIngredientByID;

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
                                    cost float,
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

    create procedure updateIngredientByID( ing_id int,
                                           name varchar(45),
                                           type varchar(45),
                                           cost_u float,
                                           unit_u varchar(45))
        BEGIN
            update Ingredient
                set ingredient_name = name,
                    ingredient_type = type,
                    cost = cost_u,
                    unit = unit_u
            where ingredient_id = ing_id;
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
drop procedure if exists updateMealByID;

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

    create procedure updateMealByID( meal_id_u int,
                                     name_u varchar(45),
                                     type_u varchar(45),
                                     time_u varchar(45),
                                     recipe_u varchar(255))
        BEGIN  
            update Meal
                set meal_name = name_u,
                    meal_type = type_u,
                    meal_time = time_u,
                    recipe = recipe_u
            where meal_id = meal_id_u;
        end;
    //

delimiter ;

-- create default instances of Meal

call addMeal( 'adobo', 'meat', 'dinner', 'do everything');
call addMeal( 'tuna cabbage', 'vegetable', 'breakfast', 'do everything');
call addMeal( 'pininyahang manok', 'meat', 'dinner', 'do everything');
call addMeal( 'hotdog + egg', 'meat', 'breakfast', 'do this');

/*** End of MEAL RELATED CODE ***/

/*** Start of MealIngredient Connector Table ***/

create table MEALINGREDIENT (
    meal_id int, -- the meal where this ingredient belongs to
    ingredient_id int, -- the ingredient id of this connector
    ingredient_amount int,
    ingredient_total_cost float,
    FOREIGN key(meal_id) references meal(meal_id) on delete cascade,
    FOREIGN key(ingredient_id) references Ingredient(ingredient_id) on delete cascade
);

-- procedures for MealIngredient

drop procedure if exists viewAllMealIngredients;
drop procedure if exists addMealIngredient;
drop procedure if exists deleteMealIngredient;

delimiter //

    create procedure viewAllMealIngredients( meal_id_view int )
        BEGIN 
            select /* ingredient.ingredient_id, ingredient_name, ingredient_type, ingredient_amount, ingredient_total_cost, unit */* from Ingredient inner join mealingredient on ingredient.ingredient_id = mealingredient.ingredient_id where mealingredient.meal_id = meal_id_view;
        end;
    //

    create procedure addMealIngredient( meal_id int,
                                        ingredient_id_insert int,
                                        ingredient_amount int )
        BEGIN
            insert into mealingredient values (meal_id, ingredient_id_insert, ingredient_amount, (select cost from ingredient where ingredient_id = ingredient_id_insert) * ingredient_amount);
        end;
    //

    create procedure deleteMealIngredient(meal_id_del int,
                                          ingredient_id_del int)
        BEGIN   
            delete from MealIngredient where meal_id = meal_id_del  and ingredient_id = ingredient_id_del;
        end;
    //

    create procedure updateIngredientAmount( meal_id_u int,
                                             ingredient_id_u int,
                                             ingredient_amount_u int)
        BEGIN
            update MealIngredient
                set ingredient_amount = ingredient_amount_u,
                    ingredient_total_cost = ingredient_amount_u * (select cost from Ingredient where ingredient_id = ingredient_id_u)
            where meal_id = meal_id_u and ingredient_id = ingredient_id_u;
        end;
    //

delimiter ;

-- create default mealingredient instances

call addMealIngredient(1,1,1);
call addMealIngredient(1,2,1);
call addMealIngredient(2,2,3);
call addMealIngredient(3,1,1);
call addMealIngredient(2,1,2);

/*** End of MealIngredient Connector Table ***/

/*** Start of Menu Code ***/

CREATE TABLE MENU(
    menu_id int auto_increment,
    week_no int,
    PRIMARY KEY (menu_id)
);


--  menu procedures

delimiter //

drop procedure if exists viewAllMenu;
drop procedure if exists viewMenuByID;
drop procedure if exists addMenu;

    create procedure viewAllMenu()
        BEGIN
            select * from Menu;
        end;
    //

    create procedure viewMenuByID(menu_id_v int)
        BEGIN
            select * from Menu where menu_id = menu_id_v;
        end;
    //

    create procedure addMenu(week_no int)
        BEGIN
            insert into Menu values (null, week_no);
        end;
    //

delimiter ;

-- create instances of menu
call addMenu(WEEK(CURDATE()));

/*** End of Menu Code ***/

/*** Start of Menu_Avoid code ***/
create table MenuAvoid(
    menu_id int,
    menu_index int,
    foreign key (menu_id) references menu(menu_id) on delete cascade
);

-- procedures for menu_avoid
drop procedure if exists viewMenuAvoids;
drop procedure if exists addMenuAvoid;
drop procedure if exists deleteMenuAvoid;

delimiter //

    create procedure viewAllMenuAvoids(menu_id_v int)
        begin
            select * from menuavoid inner join menu on menuavoid.menu_id = menu.menu_id;
        end;
    //

    create procedure addMenuAvoid(menu_id int,
                                  menu_index int)
        begin
            insert into menuavoid values(menu_id, menu_index);
        end;
    //

    create procedure deleteMenuAvoid( menu_id_delete int)
        begin
            delete from menuavoid where menu_id = menu_id_delete;
        end;
    //


delimiter ;

-- create default instances of menuavoid
call addMenuAvoid(1,2);

/*** End of Menu_avoid code ***/

/*** Start of MenuMeal Connector code ***/

create table MENUMEAL (
    menu_id int, -- the menu where this meal belongs to
    meal_id int, -- the meal id of this connector
    persons int, -- number of people that will eat
    FOREIGN key(menu_id) references menu(menu_id) on delete cascade,
    FOREIGN key(meal_id) references meal(meal_id) on delete cascade
);

-- procedures for menumeal
drop procedure if exists viewMenuMeals;
drop procedure if exists addMenuMeal;
drop procedure if exists deleteMenuMeal;
drop procedure if exists updateMenuMeal;

delimiter //

    create procedure viewMenuMeals(menu_id_v int)
        BEGIN
            select * from menumeal inner join meal on menumeal.meal_id = meal.meal_id where menu_id = menu_id_v;
        end;
    //

    create procedure addMenuMeal(menu_id int,
                                 meal_id int,
                                 persons int)
        BEGIN
            insert into Menumeal values (menu_id, meal_id, persons);
        end;
    // 

    create procedure deleteMenuMeal( menu_id_d int)
        begin
            delete from menumeal where menu_id = menu_id_d;
        end;
    //

    create procedure updateMenuMeal(menu_id_u int,
                                    meal_id_u int,
                                    persons_u int)
        begin  
            update MenuMeal
                set meal_id = meal_id_u,
                    persons = persons_u
            where menu_id = menu_id_u and meal_id = meal_id_u;
        end;
    //

delimiter ;

-- create instances of menumeal

call addMenuMeal(1,1,4);

/*** End of MenuMeal Connector code ***/
