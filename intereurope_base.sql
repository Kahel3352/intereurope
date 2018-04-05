#Suppression des tables si elles existent
DROP TABLE IF EXISTS histoVol;

DROP TABLE IF EXISTS template_avion;
DROP TABLE IF EXISTS template_vol;

DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS vol;
DROP TABLE IF EXISTS aeroport;
DROP TABLE IF EXISTS avion;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS pays;

#Création des tables
CREATE TABLE pays(
	paysId tinyint(4) PRIMARY KEY,
	paysNom varchar(30)
)ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE company(
	compId smallint(16) PRIMARY KEY,
	compNom varchar(50),
	compPays tinyint(4),
	FOREIGN KEY(compPays) REFERENCES pays(paysId)
)ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE avion(
	avionId int(11) PRIMARY KEY,
	avionModele varchar(20),
	avionCompany smallint(6),
	nbPlaces smallint(6),
	FOREIGN KEY(avionCompany) REFERENCES company(compId)
)ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE aeroport(
	aeroId char(3) PRIMARY KEY,
	aeroNom varchar(30),
	aeroPays tinyint(4)
)ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE vol(
	volId varchar(10) PRIMARY KEY,
	volAeroDepart char(3),
	volAeroDestination char(3),
	volDateHeureDepart datetime,
	volDateHeureArrivee datetime,
	volNbPlaces smallint(6),
	volAvion int(11),
	FOREIGN KEY(volAeroDepart) REFERENCES aeroport(aeroId),
	FOREIGN KEY(volAeroDestination) REFERENCES aeroport(aeroId),
	FOREIGN KEY(volAvion) REFERENCES avion(avionId)
)ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE client(
	clientId int(11) PRIMARY KEY,
	clientNom varchar(30),
	clientPrenom varchar(30),
	clientRue varchar(100),
	clientCP varchar(6),
	clientVille varchar(30),
	clientPays tinyint(4),
	FOREIGN KEY(clientPays) REFERENCES pays(paysId)
)ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE reservation(
	resaId bigint(20) PRIMARY KEY,
	resaDate date,
	resaVol varchar(10),
	resPlace varchar(5),
	resNomPassager varchar(60),
	resClient int(11),
	FOREIGN KEY(resaVol) REFERENCES vol(volId),
	FOREIGN KEY(resClient) REFERENCES client(clientId)
)ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE histoVol(
	histoVolId varchar(10) PRIMARY KEY,
	histoVolAeroDepart char(3),
	histoVolAeroDestination char(3),
	histoVolDateHeureDepart datetime,
	histoVolDateHeureArrivee datetime,
	histoVolNbPlaces smallint(6),
	histoVolAvion int(11),
	FOREIGN KEY(histoVolAeroDepart) REFERENCES aeroport(aeroId),
	FOREIGN KEY(histoVolAeroDestination) REFERENCES aeroport(aeroId),
	FOREIGN KEY(histoVolAvion) REFERENCES avion(avionId)
)ENGINE=InnoDB CHARSET=utf8;

source intereurope_data.sql
source intereurope_template_avion.sql;
source intereurope_template_vol.sql;
source intereurope_function_newnumvol.sql
source intereurope_procedure_getidvol.sql;
source intereurope_procedure_template2vol.sql;
source intereurope_procedure_vol2template.sql;
source intereurope_template_avion.sql;
source intereurope_template_vol.sql;
source intereurope_trigger_decrementenbplaces.sql;
source intereurope_trigger_historique.sql;
source intereurope_trigger_validationvol.sql;