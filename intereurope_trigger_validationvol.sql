DELIMITER $$

DROP TRIGGER IF EXISTS intereurope.validationVol$$

CREATE TRIGGER intereurope.validationVol
BEFORE INSERT ON vol
FOR EACH ROW
BEGIN
	-- Nombre de vol avec cette avion dans cette tranche d'horaires
	DECLARE VnbVolMemeAvion tinyint;
	-- On vérifie si le vol ne décolle et n'attérrit pas dans le meêm aéroport
	IF(NEW.volAeroDepart = NEW.volAeroDestination) THEN
		signal sqlstate "45000" set message_text = "Même aéroport pour le départ et l'arrivée", MYSQL_ERRNO = 2001;
	END IF;

	-- On vérifie si la date/heure de départ est inférieure à la date/heure d'arrivée
	IF(NEW.volDateHeureDepart >= NEW.volDateHeureArrivee) THEN
		signal sqlstate "45000" set message_text = "L'heure de départ doit être inférieure à l'heure d'arrivée", MYSQL_ERRNO=2002;
	END IF;

	-- On vérifie que l'avion n'es pas déjà dans un autre vol à ce moment là
	SELECT COUNT(volId)
	INTO VnbVolMemeAvion
	FROM vol
	WHERE volAvion = NEW.volAvion
	AND volDateHeureDepart <= NEW.volDateHeureDepart
	AND volDateHeureArrivee >= NEW.volDateHeureArrivee;

	IF(VnbVolMemeAvion > 1) THEN
		signal sqlstate "45000" set message_text = "Cet est déjà en vol à la même heure", MYSQL_ERRNO=2003;
	END IF;
END$$

DELIMITER ;

