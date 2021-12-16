exports.product_list = function(req, res) {
    res.send('Liste des produits');
  };

exports.product_infos = function(req, res) {
    const idproduct = req.params.idproduct;
    res.send('Fiche produit :' + idproduct);
};