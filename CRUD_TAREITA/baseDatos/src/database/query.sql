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

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

SELECT * FROM kdramas;
SELECT * FROM users;
