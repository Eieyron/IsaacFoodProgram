const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const morgan = require('morgan')

const config = require('./config/config')
const app = express()

// manage routes
/* const indexRouter = require('./routes/index')
const usersRouter = require('./routes/users')
const ingredientRouter = require('./routes/Ingredient')
const mealRouter = require('./routes/Meal') */

// view engine setup
/* app.set('views', path.join(__dirname, 'views'))
app.set('view engine', 'pug') */

app.use(morgan('combined'))
app.use(bodyParser.json())
app.use(cors())

//app.use(express.static(path.join(__dirname, 'public')))

// manage route use
/* app.use('/', indexRouter)
app.use('/users', usersRouter)
app.use('/ingredient', ingredientRouter)
app.use('/meal', mealRouter) */

// catch 404 and forward to error handler
/* app.use(function(req, res, next) {
  next(createError(404))
})

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message
  res.locals.error = req.app.get('env') === 'development' ? err : {}

  // render the error page
  res.status(err.status || 500)
  res.render('error')
}) */

app.listen(config.port)
console.log(`Server started on port ${ config.port }`)
