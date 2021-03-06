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
    GROUP_CONCAT(commande_id)
FROM
    commande_ligne
GROUP BY
    nom
HAVING
    count(commande_id) > 1
ORDER BY
    count(commande_id) DESC;

-- Enregistrer le prix total à l’intérieur de chaque ligne des commandes, en fonction du prix unitaire et de la quantité
UPDATE
    commande_ligne
SET
    prix_total = (prix_unitaire * quantite);

-- Obtenir le montant total pour chaque commande et y voir facilement la date associée à 
-- cette commande ainsi que le prénom et nom du client associé
SELECT
    sum(prix_total),
    commande.date_achat,
    client.prenom,
    client.nom
FROM
    commande
    INNER JOIN client ON commande.client_id = client.id
    INNER JOIN commande_ligne ON commande.id = commande_ligne.commande_id
GROUP BY
    client_id;

-- Enregistrer le montant total de chaque commande dans le champ intitulé “cache_prix_total”
UPDATE
    commande AS P
    INNER JOIN (
        SELECT
            commande_id,
            sum(prix_total) TotalPrice
        FROM
            commande_ligne
        GROUP BY
            commande_id
    ) T ON T.commande_id = P.id
SET
    P.cache_prix_total = T.TotalPrice;

SELECT
    id,
    cache_prix_total
FROM
    commande;

-- Obtenir le montant global de toutes les commandes, pour chaque mois
SELECT
    EXTRACT(
        MONTH
        FROM
            date_achat
    ) mois,
    SUM(cache_prix_total) prix_total
FROM
    commande
GROUP BY
    mois;

-- Obtenir la liste des 10 clients qui ont effectué le plus grand montant de commandes, 
-- et obtenir ce montant total pour chaque client.
SELECT
    nom,
    max(commande.cache_prix_total) TopAchat
FROM
    client
    INNER JOIN commande ON client.id = commande.client_id
GROUP BY
    client.id
ORDER BY
    TopAchat DESC
LIMIT
    10;

-- Obtenir le montant total des commandes pour chaque date
SELECT
    date_achat,
    SUM(cache_prix_total) prix_total
FROM
    commande
GROUP BY
    date_achat;

-- Ajouter une colonne intitulée “category” à la table contenant les commandes. 
-- Cette colonne contiendra une valeur numérique
-- Enregistrer la valeur de la catégorie, en suivant les règles suivantes :
-- “1” pour les commandes de moins de 200€
-- “2” pour les commandes entre 200€ et 500€
-- “3” pour les commandes entre 500€ et 1.000€
-- “4” pour les commandes supérieures à 1.000€
ALTER TABLE
    commande
ADD
    category INT;

UPDATE
    commande
SET
    category = IF(
        cache_prix_total > 1000,
        4,
        IF(
            cache_prix_total > 500,
            3,
            IF(cache_prix_total > 200, 2, 1)
        )
    );

SELECT
    cache_prix_total,
    category
FROM
    commande;

-- Créer une table intitulée “commande_category” qui contiendra le descriptif de ces catégories
-- Insérer les 4 descriptifs de chaque catégorie au sein de la table précédemment créée
ALTER TABLE
    commande
ADD
    commande_category VARCHAR(255) CHARACTER SET utf8mb4;

UPDATE
    commande
SET
    commande_category = IF(
        category = 4,
        'Commandes supérieures à 1.000 euros',
        IF(
            category = 3,
            'Commandes entre 500 euros et 1.000 euros',
            IF(category = 2, 'Commandes entre 200 euros et 500 euros', 'Commandes de moins de 200 euros')
        )
    );

-- UPDATE
--     commande
-- SET 
--     commande_category = REPLACE(commande_category, '+ CHAR(128) +', '€');

SELECT
    category,
    commande_category
FROM
    commande;

alter table commande drop column commande_category;



-- Créer une table intitulée “commande_category” qui contiendra le descriptif de ces catégories
-- Insérer les 4 descriptifs de chaque catégorie au sein de la table précédemment créée

CREATE TABLE commande_category (
    id INT NOT NULL AUTO_INCREMENT,
    description_category VARCHAR(255),
    PRIMARY KEY (id)
) CHARACTER SET=utf8;

INSERT INTO commande_category (description_category) 
VALUES
    ('Commandes de moins de 200 euros'),
    ('Commandes entre 200 euros et 500 euros'),
    ('Commandes entre 500 euros et 1.000 euros'),
    ('Commandes supérieures à 1.000 euros');

ALTER TABLE
    commande
ADD
    category_desc VARCHAR(255);

UPDATE
    commande AS P
INNER JOIN (
    SELECT
        id,
        description_category
    FROM
        commande_category
) T ON T.id = P.category
SET
    category_desc = T.description_category;

-- Supprimer toutes les commandes (et les lignes des commandes) 
-- inférieur au 1er février 2019. Cela doit être effectué en 2 requêtes maximum

DELETE FROM 
    commande
WHERE
    date_achat < '20190201';