DROP TABLE IF EXISTS template_avion;

CREATE TABLE template_avion(
	templateAvionId int(11) PRIMARY KEY,
	templateAvionModele varchar(20),
	nbPlaces smallint(6)
);

INSERT INTO template_avion VALUES (1,'A320-200',200),(2,'A320-200',200),(3,'A320-250',250);
