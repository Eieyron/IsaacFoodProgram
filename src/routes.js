const IndexController = require('./controllers/IndexController')

module.exports = (app) => {

  // Home Page
  app.get('/',
    IndexController.home)
}