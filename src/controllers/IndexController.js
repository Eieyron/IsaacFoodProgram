module.exports = {
  home (req, res) {
    res.status(200).send({
      message: 'Home Page'
    })
  }
}