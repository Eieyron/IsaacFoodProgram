// Ingredient.js

var express = require('express');
var router = express.Router();
var ingredient = require('../models/Ingredient');

router.get('/:id', (req, res, next)=>{

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

router.post('/addingredient/:name/:type/:cost/:unit', (req, res, next)=>{

    ingredient.addIngredient(req.params, (err, rows)=>{
        if(err)res.json(err);
        else res.json(rows);
    });

});

router.delete('/delete/:id', (req,res,next)=>{

    ingredient.deleteIngredientByID(req.params.id, (err, rows)=>{
        if(err)res.json(err);
        else res.json(rows);
    });

});

module.exports = router;