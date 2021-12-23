use todo_dev;

CREATE OR REPLACE TABLE todo (
    id INT NOT NULL AUTO_INCREMENT,
    texte VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO todo (texte)
VALUES 
    ('Tache n 1'),
    ('Tache n 2'),
    ('Tache n 3'),
    ('Tache n 4'),
    ('Tache n 5'),
    ('Tache n 6');