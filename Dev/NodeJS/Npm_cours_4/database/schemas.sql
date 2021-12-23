use todo_dev;

CREATE OR REPLACE TABLE todo (
    id INT NOT NULL AUTO_INCREMENT,
    texte VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO todo (texte)
VALUES ('loremipsium');