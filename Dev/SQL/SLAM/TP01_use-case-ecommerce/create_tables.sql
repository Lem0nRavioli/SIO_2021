CREATE DATABASE tp1_db;
USE tp1_db;

CREATE TABLE vendeur(
   id INT NOT NULL AUTO_INCREMENT,
   entreprise_vendeur TEXT NOT NULL,
   adresse_vendeur TEXT,
   siret_vendeur INT NOT NULL,
   telephone_vendeur INT,
   site_web_vendeur VARCHAR(255),
   PRIMARY KEY(id)
);

CREATE TABLE livreur(
   id INT NOT NULL AUTO_INCREMENT,
   entreprise_livraison TEXT NOT NULL,
   adresse_livraison TEXT,
   siret_livraison INT NOT NULL,
   telephone_livraison INT,
   site_web_livraison VARCHAR(255),
   delais_api_livraison VARCHAR(255) NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE promotion(
   id INT NOT NULL AUTO_INCREMENT,
   code_promo VARCHAR(255) NOT NULL,
   reduction_promo FLOAT NOT NULL,
   debut_promo DATE NOT NULL,
   fin_promo DATE,
   PRIMARY KEY(id)
);

CREATE TABLE client(
   id INT NOT NULL AUTO_INCREMENT,
   nom VARCHAR(255) NOT NULL,
   prenom VARCHAR(255) NOT NULL,
   ddn DATE NOT NULL,
   email VARCHAR(255) NOT NULL,
   pwd VARCHAR(255) NOT NULL,
   telephone VARCHAR(255),
   adresse VARCHAR(255) NOT NULL,
   paypal VARCHAR(255),
   btc VARCHAR(255),
   ewallet FLOAT,
   cgu BOOLEAN NOT NULL,
   cgv BOOLEAN NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE produit(
   id INT NOT NULL AUTO_INCREMENT,
   id_vendeur INT NOT NULL,
   nom_produit VARCHAR(255),
   description_produit TEXT,
   prix_produit FLOAT,
   stocks_produit INT,
   PRIMARY KEY(id),
   FOREIGN KEY(id_vendeur) REFERENCES vendeur(id)
);

CREATE TABLE avis_produit(
   id INT NOT NULL AUTO_INCREMENT,
   id_client INT NOT NULL,
   id_produit INT NOT NULL,
   id_vendeur INT NOT NULL,
   rating_produit INT NOT NULL,
   avis_produit TEXT,
   PRIMARY KEY(id),
   FOREIGN KEY(id_vendeur) REFERENCES vendeur(id),
   FOREIGN KEY(id_client) REFERENCES client(id),
   FOREIGN KEY(id_produit) REFERENCES produit(id)
);

CREATE TABLE avis_vendeur(
   id INT NOT NULL AUTO_INCREMENT,
   id_client INT NOT NULL,
   id_vendeur INT NOT NULL,
   rating_vendeur INT NOT NULL,
   avis_vendeur TEXT,
   PRIMARY KEY(id),
   FOREIGN KEY(id_vendeur) REFERENCES vendeur(id),
   FOREIGN KEY(id_client) REFERENCES client(id)
);

CREATE TABLE commande(
   id INT NOT NULL AUTO_INCREMENT,
   id_client INT NOT NULL,
   id_livreur INT NOT NULL,
   id_promo INT NOT NULL,
   code_promo VARCHAR(255),
   date_achat DATE,
   date_livraison_prevu DATE,
   date_livraison_effective DATE,
   adresse_facturation TEXT,
   adresse_livraison TEXT,
   PRIMARY KEY(id),
   FOREIGN KEY(id_livreur) REFERENCES livreur(id),
   FOREIGN KEY(id_promo) REFERENCES promotion(id),
   FOREIGN KEY(id_client) REFERENCES client(id)
);

	
CREATE TABLE moyen_paiement(
	id INT NOT NULL AUTO_INCREMENT,
	id_commande INT NOT NULL,
	amount_btc FLOAT,
	amount_cb FLOAT,
	amount_paypal FLOAT,
	amount_virement FLOAT,
	amount_ewallet FLOAT,
	PRIMARY KEY(id),
	FOREIGN KEY(id_commande) REFERENCES commande(id)
);


CREATE TABLE carte_bancaire(
   id INT NOT NULL AUTO_INCREMENT,
   id_client INT NOT NULL,
   nom_cb VARCHAR(255) NOT NULL,
   prenom_cb VARCHAR(255) NOT NULL,
   numero_cb INT NOT NULL,
   date_validite_cb DATE NOT NULL,
   num_ccv INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_client) REFERENCES client(id)
);

CREATE TABLE produit_panier(
   id INT NOT NULL AUTO_INCREMENT,
   id_client INT NOT NULL,
   id_produit INT NOT NULL,
   id_commande INT NOT NULL,
   quantite_produit INT,
   date_ajout DATE,
   is_active BOOLEAN,
   PRIMARY KEY(id),
   FOREIGN KEY(id_commande) REFERENCES commande(id),
   FOREIGN KEY(id_produit) REFERENCES produit(id),
   FOREIGN KEY(id_client) REFERENCES client(id)
);
