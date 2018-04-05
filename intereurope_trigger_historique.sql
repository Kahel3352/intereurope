DELIMITER $$

DROP TRIGGER IF EXISTS intereurope.historique$$

CREATE TRIGGER intereurope.historique
BEFORE DELETE ON vol
FOR EACH ROW
BEGIN
	-- On insert une copie du vol qui vas être supprimé dans historique_vol
	INSERT INTO histoVol
	VALUES (OLD.volId, OLD.volAeroDepart, OLD.volAeroDestination, OLD.volDateHeureDepart, OLD.volDateHeureArrivee, OLD.volNbPlaces, OLD.volAvion);

	-- On supprime les réservations qui correspondent à ce vol
	DELETE FROM reservation
	WHERE resaVol = OLD.volId;

END$$

DELIMITER ;