
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
INSERT INTO USER (EMAIL, PSW, TARIF) VALUES ('test2', 'testpsw', 70);