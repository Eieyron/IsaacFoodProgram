// Meal.js

var express = require('express');
var router = express.Router();
var meal = require('../models/Meal');

router.get('/view/:id?', (req, res, next)=>{

    if(req.params.id) {
        meal.viewMealByID(req.params.id, (err, rows)=>{
            if(err){
                res.json(err);
            }else{
                res.json(rows);
            }
        });
    }else{
        meal.viewAllMeals((err, rows)=>{
            if(err){
                res.json(err);
            }else{
                res.json(rows);
            }
        });
    }
});

router.get('/mealingredient/view/:id?', (req, res, next)=>{
    meal.viewAllMealIngredients(req.params.id, (err, rows)=>{
        if(err) res.json(err);
        else res.json(rows);
    });
});

router.post('/add/:name/:type/:time/:recipe', (req, res, next)=>{

    meal.addMeal(req.params, (err, rows)=>{
        if(err)res.json(err);
        else res.json(rows);
    });

});

router.post('/update/:id/:name/:type/:time/:recipe', (req, res, next)=>{

    meal.updateMealByID(req.params.id, req.params, (err, rows)=>{
        if(err)res.json(err);
        else res.json(rows);
    });
});

router.post('/mealingredient/add/:meal_id/:id/:amount', (req,res,next)=>{
    meal.addMealIngredient(req.params.meal_id, req.params, (err,rows)=>{
        if(err)res.json(err);
        else res.json(rows);
    })
})

router.delete('/delete/:id', (req,res,next)=>{

    meal.deleteMealByID(req.params.id, (err, rows)=>{
        if(err)res.json(err);
        else res.json(rows);
    });

});

module.exports = router;