const express = require('express');
const router = express.Router();

const indexController = require('../controllers/indexController');
const productsController = require('../controllers/productsController');
const userController = require('../controllers/userController');

/* GET home page. */
router.get('/', indexController.index);

router.get('/produits', productsController.product_list);

router.get('/produits/:idproduct', productsController.product_infos);

router.get('/inscription', userController.sign_up);

module.exports = router;
