BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Car" (
	"id"	INTEGER,
	"brand"	CHAR(20),
	"model"	CHAR(20),
	PRIMARY KEY("id")
);
INSERT INTO "Car" VALUES (21,'Toyota','Supra');
INSERT INTO "Car" VALUES (77,'Lamborghini','Aventador');
INSERT INTO "Car" VALUES (108,'Lamborghini','Huracan');
INSERT INTO "Car" VALUES (199,'Mazada','Rx7');
INSERT INTO "Car" VALUES (886,'Mitsubishi','EVO');
INSERT INTO "Car" VALUES (954,'Nissan','GTR R34');
INSERT INTO "Car" VALUES (984,'Nissan','GTR R35');
COMMIT;
