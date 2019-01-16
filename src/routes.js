const IndexController = require('./controllers/IndexController')
const IngredientController = require('./controllers/IngredientController')

module.exports = (app) => {

  // Home Page
  app.get('/',
    IndexController.home)

  // INGREDIENT-RELATED
  app.get('/view-ingredient/:id',
    IngredientController.viewIngredient)
  app.get('/view-ingredients',
    IngredientController.viewAllIngredients)
  app.post('/add-ingredient',
    IngredientController.addIngredient)
  app.put('/update-ingredient/:id',
    IngredientController.updateIngredient)
  app.delete('/delete-ingredient/:id',
    IngredientController.deleteIngredient)

}