use todo_dev;

DELIMITER //

CREATE OR REPLACE PROCEDURE getAllTasks()
BEGIN
    SELECT * FROM todo;
END //


CREATE OR REPLACE PROCEDURE addTask(IN p_id INT, IN p_texte VARCHAR(255))
BEGIN
    INSERT INTO todo (id, texte) VALUES (p_id, p_texte);
END //


CREATE OR REPLACE PROCEDURE getTask(IN p_id INT)
BEGIN
    SELECT * 
    FROM todo
    WHERE id = p_id;
END //

CREATE OR REPLACE PROCEDURE editTask(IN p_id INT, IN p_texte VARCHAR(255))
BEGIN
    UPDATE todo
    SET texte = p_texte
    WHERE id = p_id;
END //


CREATE OR REPLACE PROCEDURE deleteTask(IN p_ID INT)
BEGIN
    DELETE FROM todo 
    WHERE id = p_id;
END //

CREATE OR REPLACE PROCEDURE deleteAllTask()
BEGIN
    TRUNCATE TABLE todo;
END //