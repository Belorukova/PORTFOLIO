----
-- phpLiteAdmin database dump (http://www.phpliteadmin.org/)
-- phpLiteAdmin version: 1.9.7.1
-- Exported: 1:02pm on March 2, 2019 (CET)
-- database file: ./BelorukovaEI
----
BEGIN TRANSACTION;

----
-- Table structure for users
----
CREATE TABLE 'users' ('id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 'Name' TEXT DEFAULT 'user', 'progress' REAL, 'visiting' BOOLEAN NOT NULL DEFAULT 0 , 'time_create' DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP);

----
-- Data dump for users, a total of 3 rows
----
INSERT INTO "users" ("id","Name","progress","visiting","time_create") VALUES ('1','Linda','4,76','1','2019-03-02 11:39:29');
INSERT INTO "users" ("id","Name","progress","visiting","time_create") VALUES ('2','Katya','3,78','0','2019-03-02 11:42:31');
INSERT INTO "users" ("id","Name","progress","visiting","time_create") VALUES ('3','Peter','5,00','1','2019-03-02 11:42:52');
COMMIT;
