DROP TABLE IF EXISTS template_vol;

CREATE TABLE template_vol(
	templateVolId varchar(10) PRIMARY KEY,
	templateVolAeroDepart char(3),
	templateVolAeroDestination char(3),
	templateVolAvion int(11),
	FOREIGN KEY(templateVolAeroDepart) REFERENCES aeroport(aeroId),
	FOREIGN KEY(templateVolAeroDestination) REFERENCES aeroport(aeroId),
	FOREIGN KEY(templateVolAvion) REFERENCES avion(avionId)
)ENGINE=InnoDB CHARSET=utf8;

INSERT INTO template_vol VALUES (1,'BCL','CDG', 2), (2,'CDG','BCL', 2), (3,'MRS','OPO', 1);