-- M2L SQL DB CREATE SCRIPT --
DROP DATABASE IF EXISTS M2L_DB;
CREATE DATABASE M2L_DB;

USE M2L_DB;


CREATE TABLE USERS(
   id INT NOT NULL AUTO_INCREMENT,
   nom VARCHAR(255)  NOT NULL,
   prenom VARCHAR(255)  NOT NULL,
   email VARCHAR(255)  NOT NULL,
   tel VARCHAR(50),
   password TEXT NOT NULL,
   ddn DATE NOT NULL,
   adresse VARCHAR(255) ,
   PRIMARY KEY(id)
);

CREATE TABLE SALLES(
   id INT NOT NULL AUTO_INCREMENT,
   nom VARCHAR(255)  NOT NULL,
   description VARCHAR(255),
   capacite INT NOT NULL,
   prix FLOAT NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE PRODUITS(
   id INT NOT NULL AUTO_INCREMENT,
   nom_produit VARCHAR(255)  NOT NULL,
   description VARCHAR(255),
   qte_dispo INT NOT NULL,
   prix FLOAT NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE TICKETS(
   id INT NOT NULL AUTO_INCREMENT,
   date_ticket DATE NOT NULL,
   description TEXT NOT NULL,
   id_user INT NOT NULL,
   id_salle INT,
   id_produit INT,
   PRIMARY KEY(id),
   FOREIGN KEY(id_salle) REFERENCES SALLES(id),
   FOREIGN KEY(id_produit) REFERENCES PRODUITS(id),
   FOREIGN KEY(id_user) REFERENCES USERS(id)
);

CREATE TABLE RESERVATION(
   id INT NOT NULL AUTO_INCREMENT,
   date_resa DATE NOT NULL,
   is_paid BOOLEAN NOT NULL,
   id_user INT NOT NULL,
   id_salle INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_salle) REFERENCES SALLES(id),
   FOREIGN KEY(id_user) REFERENCES USERS(id)
);

CREATE TABLE PAIEMENT(
   id INT NOT NULL AUTO_INCREMENT,
   qte INT NOT NULL,
   total FLOAT NOT NULL,
   id_user INT NOT NULL,
   id_reservation INT NOT NULL,
   id_produit INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_user) REFERENCES USERS(id),
   FOREIGN KEY(id_produit) REFERENCES PRODUITS(id),
   FOREIGN KEY(id_reservation) REFERENCES RESERVATION(id)
);


CREATE TABLE PARTICIPANTS(
   id INT NOT NULL AUTO_INCREMENT,
   covid_positive BOOLEAN NOT NULL,
   id_user INT NOT NULL,
   id_reservation INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_user) REFERENCES USERS(id),
   FOREIGN KEY(id_reservation) REFERENCES RESERVATION(id)
);
