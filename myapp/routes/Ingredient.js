// Ingredient.js

var express = require('express');
var router = express.Router();
var ingredient = require('../models/Ingredient');

router.get('/:id?', (req, res, next)=>{
    if(req.params.id) {
        ingredient.getIngredientByID(req.params.id, (err, rows)=>{
            if(err){
                res.json(err);
            }else{
                res.json(rows);
            }
        });
    }else{
        ingredient.getAllIngredients((err, rows)=>{
            if(err){
                res.json(err);
            }else{
                res.json(rows);
            }
        });
    }
});
