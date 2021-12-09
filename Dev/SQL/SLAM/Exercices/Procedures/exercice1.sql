use exercice2;

DELIMITER //

-- 1. Créer une procédure stockée qui permet de retrouver un utilisateur en fonction 
-- de son prenom et son mot de passe sachant que l’encodage du mot de passe 
-- est effectué avec l’algorithme Sha1.

CREATE OR REPLACE PROCEDURE getUser(IN p_nom VARCHAR(255), IN pwd VARCHAR(255))
BEGIN
    SELECT
        *
    FROM
        client
    WHERE
        p_nom = prenom
        AND SHA1(pwd) = password;
END //

-- 2. Créer une procédure stockée qui permet de mettre à jour le nom et prénom d'un utilisateur 
-- en fonction de  son id.

CREATE OR REPLACE PROCEDURE updateUser(IN u_id INT, IN n_nom VARCHAR(255), IN n_prenom VARCHAR(255))
BEGIN
    UPDATE
        client
    SET
        nom = n_nom,
        prenom = n_prenom
    WHERE
        id = u_id;
END //


-- 3. Créer une procédure stocké qui permet de récupérer les commandes en fonction de la date_achat. 
-- Une colonne supplémentaire avec la liste de toutes les commandes_ligne associées doit apparaitre dans le résultat.

CREATE OR REPLACE PROCEDURE getCommandeDate(IN select_date DATE)
BEGIN
    SELECT
        commande.id,
        commande.date_achat,
        GROUP_CONCAT(commande_ligne.id)
    FROM
        commande
    INNER JOIN commande_ligne ON commande_ligne.commande_id = commande.id
    WHERE 
        commande.date_achat = select_date
    GROUP BY 
        commande.id;

END //


-- 4. Créer une procédure permettant de supprimmer toutes les commandes et leur commandes  lignes associées 
-- en fonction d'une date de début et date de fin.

CREATE OR REPLACE PROCEDURE delRowStartEnd(IN s_date DATE, IN e_date DATE)
BEGIN
    DELETE commande, commande_ligne
    FROM commande
    INNER JOIN commande_ligne ON commande_ligne.commande_id = commande.id
    WHERE
        commande.date_achat > s_date
        AND commande.date_achat < e_date;

END //

-- 5. Créer une procédure stockée permettant d'insérer un nouveau client dans la base de données.*

CREATE OR REPLACE PROCEDURE createUser(IN n_prenom VARCHAR(255), IN n_nom VARCHAR(255), IN n_email VARCHAR(255), n_ville VARCHAR(255), IN n_psw VARCHAR(255))
BEGIN
    INSERT INTO
        client (prenom, nom, email, ville, password)
    VALUES
        (n_prenom, n_nom, n_email, n_ville, SHA1(n_psw));

END //


-- 6. Créer une procédure stockée permettant d'insérer une nouvelle commande, ainsi 
-- que les commandes lignes associées, cette requete doit être transactionnelle.

CREATE OR REPLACE PROCEDURE createCommandeLigne(IN n_commande_id INT, IN n_nom VARCHAR(255), IN n_quantite INT, IN n_prix_unitaire FLOAT)
BEGIN
    INSERT INTO
        commande_ligne (commande_id, nom, quantite, prix_unitaire, prix_total)
    VALUES
        (n_commande_id, n_nom, n_quantite, n_prix_unitaire, prix_unitaire * quantite);
END //

CREATE OR REPLACE PROCEDURE createCommande(IN n_client_id INT, IN n_date_achat DATE, IN n_reference VARCHAR(255))
BEGIN
    INSERT INTO
        commande (client_id, date_achat, reference, cache_prix_total)
    VALUES
        (n_client_id, n_date_achat, n_reference, 0);
END //