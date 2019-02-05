module.exports = {
  viewMeal (req, res) {
    res.status(200).send({
      message: 'View a meal'
    })
  },

  viewAllMeals (req, res) {
    res.status(200).send({
      message: 'Viewing all meals'
    })
  },

  addMeal (req, res) {
    res.status(200).send({
      message: 'Add a meal'
    })
  },

  updateMeal (req, res) {
    res.status(200).send({
      message: 'Update a meal'
    })
  },

  deleteMeal (req, res) {
    res.status(200).send({
      message: 'Delete a meal'
    })
  },

  viewIngredientsOfMeal (req, res) {
    res.status(200).send({
      message: 'View all ingredients of a meal'
    })
  },

  addIngredientOfMeal (req, res) {
    res.status(200).send({
      message: 'Add an ingredient of a meal'
    })
  },

  updateIngredientOfMeal (req, res) {
    res.status(200).send({
      message: 'Update an ingredient of a meal'
    })
  },

  deleteIngredientOfMeal (req, res) {
    res.status(200).send({
      message: 'Delete an ingredient of a meal'
    })
  },
}