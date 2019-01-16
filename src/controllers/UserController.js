module.exports = {
  usersListing (req, res) {
    res.status(200).send({
      message: 'Get users listing'
    })
  }
}