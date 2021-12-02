-- Obtenir l’utilisateur ayant le prénom “Muriel” et le mot de passe “test11”, 
-- sachant que l’encodage du mot de passe est effectué avec l’algorithme Sha1.
SELECT
    prenom
FROM
    client
WHERE
    SHA1('test11') = password;

-- Obtenir la liste de tous les produits qui sont présent sur plusieurs commandes.

SELECT
    nom,
    count(commande_id)
FROM
    commande_ligne
GROUP BY 
    nom
HAVING
    count(commande_id) > 1
ORDER BY
    count(commande_id) DESC;

-- Obtenir la liste de tous les produits qui sont présent sur plusieurs commandes
-- et y ajouter une colonne qui liste les identifiants des commandes associées.

SELECT
    nom,
    count(commande_id),
    commande_id
FROM
    commande_ligne
GROUP BY 
    nom
HAVING
    count(commande_id) > 1
ORDER BY
    count(commande_id) DESC;

-- Enregistrer le prix total à l’intérieur de chaque ligne des commandes, en fonction du prix unitaire et de la quantité

UPDATE commande_ligne
SET prix_total = (prix_unitaire * quantite);

-- Obtenir le montant total pour chaque commande et y voir facilement la date associée à 
-- cette commande ainsi que le prénom et nom du client associé

SELECT
    commande.cache_prix_total,
    commande.date_achat,
    client.prenom,
    client.nom
FROM 
    commande
INNER JOIN client ON commande.client_id = client.id
INNER JOIN commande_ligne ON commande.id = commande_ligne.commande_id;

WHERE

-- from departement
-- inner join villes
-- ON departement_code = ville_departement