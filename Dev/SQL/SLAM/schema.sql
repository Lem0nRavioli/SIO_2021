
USE GEFOR;

CREATE OR REPLACE TABLE USER (
    ID INT NOT NULL AUTO_INCREMENT , 
    EMAIL VARCHAR (255) NOT NULL,
    PSW VARCHAR (255) NOT NULL,
    TARIF INT NOT NULL,
    -- 2 methods for primary key
    -- CONSTRAINT pk_user PRIMARY KEY (ID)
    PRIMARY KEY (ID)
);

INSERT INTO USER VALUES (null, 'test', 'testpsw', 50);
INSERT INTO USER VALUES (null, 'test', 'testpsw3', 40);
-- autre syntaxe avec column name
INSERT INTO USER (EMAIL, PSW, TARIF) VALUES ('test2', 'testpsw1', 70);
INSERT INTO USER (EMAIL, PSW, TARIF) VALUES ('test5', 'testpsw2', 30);
INSERT INTO USER (EMAIL, PSW, TARIF) VALUES ('test_', 'testpsw3', 180);
INSERT INTO USER (EMAIL, PSW, TARIF) VALUES ('test_3', 'testpsw4', 10);
INSERT INTO USER (EMAIL, PSW, TARIF) VALUES ('test0', 'testpsw65', 42);
-- insert multiples avec column name
INSERT INTO USER (EMAIL, PSW, TARIF)
    VALUES
    ('test5', 'passwood', 89),
    ('test12', 'passwood3', 829),
    ('test3', 'passwood2', 189),
    ('test44', 'wordprass', 839),
    ('test12', 'passwall', 389),
    ('test1', 'passwoody', 1289);
