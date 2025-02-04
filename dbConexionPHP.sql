CREATE DATABASE  dbConexionDB;
USE dbConexionDB

-- Crear tabla INVESTIGADOR
CREATE TABLE INVESTIGADOR (
    nombre VARCHAR(255) NOT NULL,
    centro VARCHAR(255),
    correo_elec VARCHAR(255) NOT NULL PRIMARY KEY,
    tema VARCHAR(255)
);

-- Crear tabla ARTICULO
CREATE TABLE ARTICULO (
    titulo VARCHAR(255) NOT NULL PRIMARY KEY,
    palabra_clave VARCHAR(255),
    correo_elec VARCHAR(255),
    localiz VARCHAR(255),
    FOREIGN KEY (correo_elec) REFERENCES INVESTIGADOR(correo_elec)
);

-- Crear tabla INFORME_TECNICO
CREATE TABLE INFORME_TECNICO (
    numero INT PRIMARY KEY,
    centro VARCHAR(255),
    mes INT,
    año INT
);

-- Crear tabla EN_ACTAS_DE_CONGRESO
CREATE TABLE EN_ACTAS_DE_CONGRESO (
    congreso VARCHAR(255),
    tipo VARCHAR(255),
    freq VARCHAR(255),
    ciudad VARCHAR(255),
    pais VARCHAR(255),
    año_ini INT,
    inicio DATE,
    fin DATE,
    PRIMARY KEY (congreso)
);

-- Crear tabla EN_REVISTA_CIENTIFICA
CREATE TABLE EN_REVISTA_CIENTIFICA (
    revista VARCHAR(255),
    editor VARCHAR(255),
    freq VARCHAR(255),
    año_ini INT,
    tema VARCHAR(255),
    año INT,
    numero INT,
    primera INT,
    ultima INT,
    PRIMARY KEY (revista)
);

-- Crear tabla COLABORA (Relación entre INVESTIGADOR y ARTICULO)
CREATE TABLE COLABORA (
    correo_elec VARCHAR(255),
    titulo VARCHAR(255),
    PRIMARY KEY (correo_elec, titulo),
    FOREIGN KEY (correo_elec) REFERENCES INVESTIGADOR(correo_elec),
    FOREIGN KEY (titulo) REFERENCES ARTICULO(titulo)
);

-- Insertar datos en la tabla INVESTIGADOR
INSERT INTO INVESTIGADOR (nombre, centro, correo_elec, tema)
VALUES 
('Juan Pérez', 'Centro de Investigaciones Científicas', 'juan.perez@example.com', 'Inteligencia Artificial'),
('María López', 'Centro de Estudios Avanzados', 'maria.lopez@example.com', 'Aprendizaje Automático'),
('Carlos Ramírez', 'Instituto de Ciencias Aplicadas', 'carlos.ramirez@example.com', 'Big Data');
select * from INVESTIGADOR