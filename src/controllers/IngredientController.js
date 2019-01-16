module.exports = {
  viewIngredient (req, res) {
    res.status(200).send({
      message: 'View an ingredient'
    })
  },

  viewAllIngredients (req, res) {
    res.status(200).send({
      message: 'View all ingredients'
    })
  },

  addIngredient (req, res) {
    res.status(200).send({
      message: 'Add an ingredient'
    })
  },

  updateIngredient (req, res) {
    res.status(200).send({
      message: 'Update ingredient'
    })
  },

  deleteIngredient (req, res) {
    res.status(200).send({
      message: 'Delete ingredient'
    })
  }
}