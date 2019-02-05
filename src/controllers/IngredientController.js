const IngredientModel = require('../models/IngredientModel')

module.exports = {
  viewAllIngredients (req, res) {
    IngredientModel.viewAllIngredients((err, rows, fields) => {
      if (!err)
        res.send(rows)
      else
        console.log('Error viewing all ingredients')
    })
  },

  viewIngredient (req, res) {
    IngredientModel.viewIngredient([req.params.ingredient_name], (err, rows, fields) => {
      if (!err)
        res.send(rows)
      else
        console.log('Error viewing an ingredient')
    })
  },

  addIngredient (req, res) {
    const ingredient = {
      ingredient_name : req.body.name,
      ingredient_type : req.body.type,
      cost : req.body.cost,
      unit : req.body.unit,
    }

    IngredientModel.addIngredient(ingredient, (err, rows, fields) => {
      if (!err) {
        ingredient.ingredient_id = rows.ingredient_id
        res.send(rows)
      } 
      else
        console.log('Erorr in adding an ingredient')
    })
  },

  updateIngredient (req, res) {
    const ingredient = {
      ingredient_id : req.params.ingredient_id,
      ingredient_name : req.body.name,
      ingredient_type : req.body.type,
      cost : req.body.cost,
      unit : req.body.unit
    }

    IngredientModel.updateIngredient(ingredient, (err, rows, fields) => {
      if (!err)
        res.send(rows)
      else
        console.log('Error in updating an ingredient')
    })
  },

  deleteIngredient (req, res) {
    IngredientModel.deleteIngredient([req.params.ingredient_id], (err, rows, fields) => {
      if (!err) {
        res.send(null)
        console.log('Delete success')
      }
      else
        console.log('Failed to delete an ingredient')
    })  
  }
}