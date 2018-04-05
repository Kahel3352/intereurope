DELIMITER $$

drop function if exists newNumVol$$

create function newNumVol(PvolAeroDepart char(3), PvolDateHeureDepart DATETIME)
RETURNS varchar(10)
begin
	-- Création de l'id du vol
	DECLARE VvolIdDebut varchar(5);
	DECLARE VmaxId varchar(5);
	DECLARE VnewId varchar(10);
	DECLARE VnumCar smallint;
	DECLARE compteur tinyint;
	DECLARE fini tinyint;

	SET VvolIdDebut= CONCAT(PvolAeroDepart, SUBSTRING(PvolDateHeureDepart,3,2));

	-- Récupération de la clé la plus grande
	SELECT max(substring(volId, 6))
	INTO VmaxId
	FROM vol
	WHERE volId LIKE CONCAT(VvolIdDebut,'%');


	-- on parcours les 5 caractèrse du numéro 
	SET compteur=0;
	SET fini=0;
	SET VnewId='';

	WHILE compteur<5 DO
		-- on récupère le caractère à taiter

		SET VnumCar=ASCII(SUBSTRING(VMaxId,5-compteur,1));

		IF fini=0 THEN
			IF VnumCar=90 THEN -- caractere Z
				SET VnumCar = 48; -- caractère 0
			ELSEIF VnumCar=57 THEN -- caractere 9
				SET VnumCar = 65; -- caractère A
				SET fini=1;
			ELSE
				-- on incrémente el caractère de 1	
				SET VnumCar=VnumCar+1;
				SET fini=1;
			END IF;
		END IF;


		SET VnewId=CONCAT(CHAR(VnumCar),VnewId);

		SET compteur=compteur+1;

	END WHILE;

	SET VnewId=CONCAT(VvolIdDebut,VnewId);

	RETURN VnewId;
end$$

DELIMITER ;