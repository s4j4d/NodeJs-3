var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function (req, res, next) {
  res.send('respond with a resource');
});

router.post('/createUser', (req, res, next) => {
  /// Add Create User 
  res.send('not implemented')
});

router.get('/createUser', (req, res, next) => {
  /// Add Create User 
  res.send('not implemented cause its Unnecessary ')
});

router.get('/getUsersDoneWork', (req, res, next) => {
  /// Add Get User's doneWork
  res.send('not implanted')
});

module.exports = router;
