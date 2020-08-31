-- creation de la base de donnee covoiturage
CREATE DATABASE covoiturage;

-- selection de la base de donnee
use covoiturage;

-- table conducteur
CREATE TABLE conducteur(
  id_conducteur INTEGER auto_increment,
  nom VARCHAR(100) NOT NULL,
  prenom VARCHAR(100) NOT NULL,
  nombre_place INTEGER NOT NULL,
  CONSTRAINT pk_id_conducteur PRIMARY KEY(id_conducteur)
);


-- table passager
CREATE TABLE passager(
  id_passager INTEGER auto_increment,
  nom VARCHAR(100) NOT NULL,
  prenom VARCHAR(100) NOT NULL,
  CONSTRAINT pk_id_passager PRIMARY KEY(id_passager)
);


-- table trajet
CREATE TABLE trajet(
  id_trajet INTEGER auto_increment,
  depart VARCHAR(100) NOT NULL,
  arrivee VARCHAR(100) NOT NUll,
  prix FLOAT NOT NULL,
  id_conducteur INTEGER NOT NULL,
  CONSTRAINT pk_id_trajet PRIMARY KEY(id_trajet),
  CONSTRAINT fk_id_conducteur FOREIGN KEY(id_conducteur) REFERENCES conducteur(id_conducteur) ON DELETE CASCADE
);

-- table derivee constituer
CREATE TABLE constituer(
  id_passager INTEGER NOT NULL,
  id_trajet INTEGER NOT NULL,
  date VARCHAR(100) NOT NULL,
  CONSTRAINT pk_id_passager_id_trajet PRIMARY KEY(id_passager,id_trajet)
);


-- __________________________________ les insertion __________________________________

-- insert dans la table consducteur
INSERT INTO conducteur SET prenom = 'Ablaye', nom='Faye', nombre_place=12;
INSERT INTO conducteur SET prenom = 'Ass', nom='Faye', nombre_place=13;
INSERT INTO conducteur SET prenom = 'Cheikh', nom='Faye', nombre_place=14;


-- insert dans la table trajet
INSERT INTO trajet SET depart = 'Samedi 12 Aout 2020 a 12h', arrivee='Samdi 12 Aout 2020 a 20h', prix=1200.4, id_conducteur=1;
INSERT INTO trajet SET depart = 'Dimanche 12 Aout 2020 a 12h', arrivee='Lundi 12 Aout 2020 a 20h', prix=1400.4, id_conducteur=1;
INSERT INTO trajet SET depart = 'Vendredi 12 Aout 2020 a 12h', arrivee='Jeudi 12 Aout 2020 a 20h', prix=1200.4, id_conducteur=2;


-- insert dans la table passager
INSERT INTO passager SET prenom = 'Samba', nom='Faye';
INSERT INTO passager SET prenom = 'Ass', nom='Faye';
INSERT INTO passager SET prenom = 'Coumba', nom='Faye';


-- insert dans la table constituer
INSERT INTO constituer SET id_passager=1, id_trajet=1, date=CURRENT_DATE;
INSERT INTO constituer SET id_passager=1, id_trajet=2, date=CURRENT_DATE-1;
INSERT INTO constituer SET id_passager=2, id_trajet=2, date=CURRENT_DATE-2;
