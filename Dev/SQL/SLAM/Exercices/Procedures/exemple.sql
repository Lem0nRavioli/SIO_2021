use exercice2;

DELIMITER //

CREATE OR REPLACE PROCEDURE getAllCommandes ()
BEGIN
    SELECT * FROM commande;
END  //

CREATE OR REPLACE PROCEDURE getCommandByID (IN p_id INT)
BEGIN
    SELECT * FROM commande
    WHERE id = p_id;

END //

CREATE OR REPLACE PROCEDURE multipleSelects (IN p_nom VARCHAR(255))
BEGIN
    -- try
    START TRANSACTION;
        UPDATE client SET nom = p_nom WHERE id = 1;

        UPDATE clients SET prenom = 'prenomTEST' WHERE nom = 'Da costa';
    COMMIT;
    ROLLBACK TRANSACTION;

END //