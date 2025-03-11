CREATE DATABASE kdramas_nuevo_db;

USE kdramas_nuevo_db;

CREATE TABLE kdramas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    anio INT NOT NULL,
    genero VARCHAR(100) NOT NULL,
    episodios INT NOT NULL,
    transmision VARCHAR(255) NOT NULL,
    protagonistas TEXT NOT NULL,
    sinopsis TEXT NOT NULL,
    calificacion DECIMAL(3, 1) NOT NULL
    );

SELECT * FROM KDRAMAS;