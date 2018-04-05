#Jeu d'essai
INSERT INTO pays VALUES (1,'France'),(2,'Angleterre'),(3,'Portugal'),(4,'Espagne');

INSERT INTO company VALUES (1,'Air France',1),(2,'RyanAir',2);

INSERT INTO avion VALUES (1,'A320-200',1,200),(2,'A320-200',2,200),(3,'A320-250',2,250);

INSERT INTO aeroport VALUES ('BCL','Barcelone',4),('CDG','Paris Charles de Gaule',1),('MRS','Marseille Marignane',1),('OPO','Porto',3),('STX','Lyon Saint Exupéry',1);


INSERT INTO vol VALUES 	('MRS1600001','MRS','OPO','2017-03-01 17:50:08','2018-03-01 19:12:01',200,1),
			('MRS16AAAAA','MRS','OPO','2018-03-21 10:00:00','2018-03-21 11:21:00',200,1),
			('MRS16BBBBB','MRS','OPO','2018-03-10 23:00:00','2018-03-11 00:21:00',200,1);


INSERT INTO client VALUES 	(1,'TOTO','Robert','102 missile fixe','05000','Gap',1),
							(2,'MACRON','Emmanuel','1 rue Elysée','750000','Paris',1),
							(3,'CRUZ','Penelope','Plaça Sant Jaume','08002','Barcelone',4);

INSERT INTO reservation VALUES 	(0, '2018-02-23', 'MRS16AAAAA', 13, 'Emmanuel Macron', 2),
								(1, '2018-02-23', 'MRS16AAAAA', 14, 'Brigitte Macron', 2),
								(2, '2017-01-01', 'MRS1600001', 123, 'Robert TOTO', 1),
								(3, '2018-02-20', 'MRS16BBBBB', 51, 'Penelope CRUZ', 3);							