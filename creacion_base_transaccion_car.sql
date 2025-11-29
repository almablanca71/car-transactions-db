CREATE DATABASE transaccion_car; 
USE transaccion_car; 

CREATE TABLE modelo(
    id_modelo INT PRIMARY KEY, 
    nombre_modelo VARCHAR(50)
); 

CREATE TABLE marca (
    id_marca INT PRIMARY KEY, 
    marca VARCHAR(50)
); 

CREATE TABLE combustible (
    id_combustible INT,
    tipo_combustible VARCHAR(50)
);

ALTER TABLE combustible
ADD CONSTRAINT unique_id_combustible UNIQUE (id_combustible);

CREATE TABLE transaccion(
    Id_transaccion INT PRIMARY KEY, 
    Id_modelo INT,
    Id_marca INT, 
    tamanio_motor INT, 
    Id_combustible INT, 
    anio_manufacturacion YEAR, 
    kilometraje INT, 
    precio INT,
    CONSTRAINT FK_modelo FOREIGN KEY (Id_modelo) REFERENCES modelo(id_modelo),
    CONSTRAINT FK_marca FOREIGN KEY (id_marca) REFERENCES marca(id_marca),
    CONSTRAINT FK_combustible FOREIGN KEY (id_combustible) REFERENCES combustible(id_combustible)
);  
