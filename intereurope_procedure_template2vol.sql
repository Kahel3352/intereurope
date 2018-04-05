DELIMITER $$

drop procedure if exists template2vol$$

create procedure template2vol( IN PtemplateVolId varchar(10), IN PvolDateHeureDepart datetime, IN PvolDateHeureArrive datetime)
begin
	-- déclaration des variables
	DECLARE VvolId varchar(10);
	DECLARE VvolAeroDepart char(3);
	DECLARE VvolAeroDestination char(3);
	DECLARE VvolAvion int(11);
	DECLARE VnbPlaces smallint(6);
	
	-- les données sur le modèle recherché
	SELECT templateVolAeroDepart, templateVolAeroDestination, templateVolAvion
	INTO VvolAeroDepart, VvolAeroDestination, VvolAvion
	FROM template_vol
	WHERE templateVolId = PtemplateVolId;

	-- Création de l'id du vol
		-- Partie code aeroport + année 
		SELECT concat(VvolAeroDepart, substr(year(PvolDateHeureDepart), 3))
		INTO VvolId;

	-- le nombre de place
	SELECT nbPlaces
	INTO VnbPlaces
	FROM avion
	WHERE avionId = VvolAvion;

	-- création du nouvel avion
	INSERT INTO vol VALUES (VvolId, VvolAeroDepart, VvolAeroDestination, PvolDateHeureDepart, PvolDateHeureArrive, VnbPlaces, VvolAvion);

end$$

DELIMITER ;

/*CREATE TABLE vol(
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

CREATE TABLE template_vol(
	templateVolId varchar(10) PRIMARY KEY,
	templateVolAeroDepart char(3),
	templateVolAeroDestination char(3),
	templateVolAvion int(11),
	FOREIGN KEY(templateVolAeroDepart) REFERENCES aeroport(aeroId),
	FOREIGN KEY(templateVolAeroDestination) REFERENCES aeroport(aeroId),
	FOREIGN KEY(templateVolAvion) REFERENCES avion(avionId)
)ENGINE=InnoDB CHARSET=utf8;*/