DELIMITER $$

drop procedure if exists vol2template$$

create procedure vol2template( IN PvolId varchar(10))
begin
	-- déclaration des variables
	DECLARE VvolAeroDepart char(3);
	DECLARE VvolAeroDestination char(3);
	DECLARE VvolAvion int(11);
	
	-- les données sur le modèle recherché
	SELECT volAeroDepart, volAeroDestination, volAvion
	INTO VvolAeroDepart, VvolAeroDestination, VvolAvion
	FROM vol
	WHERE volId = PvolId;

	-- création du nouvel avion
	INSERT INTO template_vol VALUES (PvolId, VvolAeroDepart, VvolAeroDestination, VvolAvion);

end$$

DELIMITER ;