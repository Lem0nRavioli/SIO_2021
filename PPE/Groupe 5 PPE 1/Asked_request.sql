-- Donnez la liste du matériel en état :  disponible

SELECT * FROM MATERIEL WHERE DISPO = 1;

-- Donnez la liste de tous le matériel

SELECT * FROM MATERIEL;

-- Donnez le nom de la personne qui a le matériel numero 003

SELECT ETUDIANT.nom FROM ETUDIANT,EMPRUNTER WHERE 
	EMPRUNTER.en_cours = 1 
    AND EMPRUNTER.id_mat = 3 
    AND EMPRUNTER.id_etudiant = ETUDIANT.id_etudiant;