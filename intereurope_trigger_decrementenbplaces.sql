DELIMITER $$

DROP TRIGGER IF EXISTS intereurope.decrementeNbPlaces$$

CREATE TRIGGER intereurope.decrementeNbPlaces
AFTER INSERT ON reservation
FOR EACH ROW
BEGIN
	-- Nombre de place du vol
	DECLARE VnbPlaces smallint(6);
	SELECT volNbPlaces 
	FROM vol
	WHERE volId = NEW.resaVol
	INTO VnbPlaces;
	-- On vérifie qu'on peut décrémenter (qu'il y'a assez de place dans le vol)
	IF(VnbPlaces>=NEW.resPlace) THEN
		UPDATE vol
		SET volNbPlaces = volNbPlaces - 1
		WHERE volId = NEW.resaVol; 
	ELSE
		signal sqlstate "45000" set message_text = "Il ne reste pas assez de place dans ce vol", MYSQL_ERRNO = 2004;
	END IF;
END$$

DELIMITER ;