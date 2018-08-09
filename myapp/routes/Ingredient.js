// Ingredient.js

var express = require('express');
var router = express.Router();
var ingredient = require('../models/Ingredient');

router.get('/:id?', (req, res, next)=>{
    if(req.params.id) {
        ingredient.viewIngredientByID(req.params.id, (err, rows)=>{
            if(err){
                res.json(err);
            }else{
                res.json(rows);
            }
        });
    }else{
        ingredient.viewAllIngredients((err, rows)=>{
            if(err){
                res.json(err);
            }else{
                res.json(rows);
            }
        });
    }
});

module.exports = router;