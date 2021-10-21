CREATE TABLE PROMO (
  id_promo INT NOT NULL,
  nom VARCHAR(255) NOT NULL,
  annee DATE NOT NULL,
  option VARCHAR(255),
  PRIMARY KEY (id_promo)
);

CREATE TABLE MATERIEL (
  id_mat INT NOT NULL,
  type VARCHAR(255) NOT NULL,
  serial VARCHAR(255) NOT NULL,
  etat BOOL NOT NULL,
  dispo BOOL NOT NULL,
  date_achat DATE NOT NULL,
  fin_garantie DATE,
  PRIMARY KEY (id_mat)
);

CREATE TABLE ETUDIANT (
  id_etudiant INT NOT NULL,
  nom VARCHAR(255) NOT NULL,
  prenom VARCHAR(255) NOT NULL,
  ddn DATE NOT NULL,
  contact VARCHAR(255) NOT NULL,
  id_promo INT NOT NULL,
  PRIMARY KEY (id_etudiant),
  FOREIGN KEY (id_promo) REFERENCES PROMO(id_promo)
);

CREATE TABLE EMPRUNTER (
  id_emprunt INT NOT NULL,
  date_pret DATE NOT NULL,
  date_retour DATE NOT NULL,
  en_cours BOOL NOT NULL,
  id_etudiant INT NOT NULL,
  id_mat INT NOT NULL,
  PRIMARY KEY (id_emprunt),
  FOREIGN KEY (id_etudiant) REFERENCES ETUDIANT(id_etudiant),
  FOREIGN KEY (id_mat) REFERENCES MATERIEL(id_mat)
);