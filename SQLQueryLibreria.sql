CREATE DATABASE LIBRERIA 

USE LIBRERIA

CREATE SCHEMA Catalogo

CREATE SCHEMA Ventas 


CREATE TABLE Catalogo.Autores (
	AutorID INT IDENTITY (1,1),
	Nombre VARCHAR(150),
	Apellido VARCHAR(150)
)

DROP TABLE Catalogo.Autores
SELECT * FROM Catalogo.Autores

--- Restriccion añadida fuera de la tabla Catalogo.Autores

ALTER TABLE Catalogo.Autores
ADD CONSTRAINT PK_AUT_ID PRIMARY KEY(AutorID)

---- Campos añadidos a la tabla Catalogo.Autores

ALTER TABLE Catalogo.Autores
ADD Nacionalidad NVARCHAR(100)

ALTER TABLE Catalogo.Autores
ADD Email NVARCHAR(100)

INSERT INTO Catalogo.Autores (Nombre, Apellido, Nacionalidad, Email)
VALUES 

( 'Gabriel', 'Garcia Marquez', 'Colombiano', 'gabriel.garcia@gmail.com'),
( 'Isabel', 'Allende', 'Chilena', 'isabel.allende@gmail.com'),
( 'Julio', 'Cortazar', 'Argentino', 'julio.cortazar@gmail.com'),
( 'Mario', 'Vargas Llosa', 'Peruano', 'mario.vargas@gmail.com'),
( 'Laura', 'Esquivel', 'Mexicana', 'laura.esquivel@hotmail.com'),
( 'Jorge', 'Luis Borges', 'Argentino', 'jorge.borges@outlook.com'),
( 'Pablo', 'Neruda', 'Chileno', 'pablo.neruda@gmail.com'),
( 'Carlos', 'Fuentes', 'Mexicano', 'carlos.fuentes@gmail.com'),
( 'Gabriela', 'Mistral', 'Chilena', 'gabriela.mistral@gmail.com'),
( 'Octavio', 'Paz', 'Mexicano', 'octavio.paz@gmail.com')


CREATE TABLE Catalogo.Categorias(
	CategoriaID INT IDENTITY (1,1),
	Nombre VARCHAR (150) UNIQUE
)

--- Añadir restricion fuera de la creación de la tabla Catalogo.Categorias

ALTER TABLE Catalogo.Categorias
ADD CONSTRAINT PK_CATEGORIA_ID PRIMARY KEY(CategoriaID) 

INSERT INTO Catalogo.Categorias (Nombre)
VALUES 

('Realismo Magico'),
('Romantica'),
('Fantasia'),
('Terror'),
('Juvenil'),
('Infantil'),
('Novela historica'),
('Ciencia ficcion'),
('Contemporaneo'),
('Distopia')

SELECT * FROM Catalogo.Categorias

CREATE TABLE Catalogo.Libros (
	LibroID INT PRIMARY KEY IDENTITY (1,1),
	Titulo NVARCHAR(150),
	AutorID INT,
	CategoriaID INT, 
	Precio INT
)



--- Añadir restricion fuera de la creación de la tabla Catalogo.Libros

ALTER TABLE Catalogo.Libros
ADD CONSTRAINT FK_ID_AUTORID_CON_AUTOURID_CATALOGO_LIBROS FOREIGN KEY(AutorID)
REFERENCES Catalogo.Autores(AutorID)

--- Añadir restricion fuera de la creación de la tabla Catalogo.Libros

ALTER TABLE Catalogo.Libros
ADD CONSTRAINT FK_ID_CATEGORIAID_CON_CATEGORIAID_CATALOGO_LIBROS FOREIGN KEY(CategoriaID)
REFERENCES Catalogo.Categorias(CategoriaID)


SELECT * FROM Catalogo.Libros

INSERT INTO Catalogo.Libros (Titulo, AutorID, CategoriaID, Precio)
VALUES 

('Cien años de soledad', 1, 5, 200.000),
('La casa de los espíritus', 8, 2, 180.000),
('La ciudad y los perros', 3, 2, 150.000),
('Ficciones', 4, 1, 170.000),
('Rayuela', 5, 7, 160.000),
('El laberinto de la soledad', 6, 7, 140.000),
('Veinte poemas de amor y una canción desesperada', 7, 7, 130.000),
('La región más transparente', 8, 3, 190.000),
('Como agua para chocolate', 9, 9, 180.000),
('Desolación', 10, 4, 160.000);

---- TABLAS DE VENTAS

CREATE TABLE Ventas.Clientes (
	ClienteID INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR(150),
	Apellido VARCHAR(150),
	Correo NVARCHAR(200) UNIQUE
)
	


INSERT INTO Ventas.Clientes (Nombre, Apellido, Correo, Genero_Literario_Favorito, Telefono_Cliente)
VALUES 

('Ana', 'Gomez', 'ana.gomez@example.com', 'Realismo magico', 5436875),
('Carlos', 'Lopez', 'carlos.lopez@example.com', 'Novela historica', 6398210),
('Maria', 'Perez', 'maria.perez@example.com', 'Narrativa contemporanea', 1054723),
('Luis', 'Martinez', 'luis.martinez@example.com', 'Cuento', 9541780),
('Elena', 'Rodriguez', 'elena.rodriguez@example.com', 'Novela', 6320540),
('Jorge', 'Fernandez', 'jorge.fernandez@example.com', 'Poesia', 8457910),
('Lucia', 'Garcia', 'lucia.garcia@example.com', 'Ensayo', 3149057),
('Pedro', 'Sanchez', 'pedro.sanchez@example.com', 'Ficcion', 7531059),
('Claudia', 'Ramirez', 'claudia.ramirez@example.com', 'Romance', 9624104),
('Miguel', 'Torres', 'miguel.torres@example.com', 'Literatura latinoamericana', 5104876)




CREATE TABLE Ventas.Ventas_Local(
	VentaID INT PRIMARY KEY IDENTITY (1,1),
	ClienteID INT,
	FechaVenta DATE,
	CONSTRAINT FK_CLIENTE_ID_CON_CLIENTEID_CLIENTES FOREIGN KEY(ClienteID)
	REFERENCES Ventas.Clientes(ClienteID)
)

DROP TABLE Ventas.Ventas_Local

ALTER TABLE Ventas.Clientes
ADD Genero_Literario_Favorito NVARCHAR (150)

ALTER TABLE Ventas.Clientes
ADD Telefono_Cliente INT

SELECT * FROM Ventas.Ventas_Local

INSERT INTO Ventas.Ventas_Local (ClienteID, FechaVenta)
VALUES 

(9, '2023-01-15'),
(5, '2023-02-20'),
(3, '2023-03-05'),
(4, '2023-04-12'),
(6, '2023-05-25'),
(1, '2023-06-18'),
(8, '2023-07-23'),
(2, '2023-08-30'),
(7, '2023-09-14'),
(10, '2023-10-21')


CREATE TABLE Ventas.Detalle_Venta (
	DetalleID INT PRIMARY KEY IDENTITY (1,1),
	VentaID INT,
	LibroID INT,
	Cantidad INT,
	Precio_Venta INT
	CONSTRAINT FK_VENTAID_CON_VENTAID_VENTALOCALES FOREIGN KEY(VentaID)
	REFERENCES Ventas.Ventas_Local(VentaID),
	CONSTRAINT FK_LIBROID_CON_LIBROID_LIBROS FOREIGN KEY(LibroID)
	REFERENCES Catalogo.Libros(LibroID)
)

INSERT INTO Ventas.Detalle_Venta (VentaID, LibroID, Cantidad, Precio_Venta)
VALUES 

( 1, 2, 2, 340.000),
( 3, 10, 1, 190.000),
( 5, 7, 3, 480.000),
( 7, 6, 1, 140.000),
( 9, 1, 4, 720.000),
( 2, 5, 2, 300.000),
( 6, 8, 5, 900.000),
( 10, 3, 1, 200.000),
( 8, 9, 2, 320.000),
( 4, 4, 3, 390.000);

SELECT * FROM Ventas.Detalle_Venta

EXEC sp_rename 'Ventas.Detalle_Venta.Precio_Venta', 'Precio', 'COLUMN';
EXEC sp_rename 'Catalogo.Autores.Nombre', 'Primer_Nombre', 'COLUMN';
EXEC sp_rename 'Ventas.Clientes.Correos', 'Correo_electronico', 'COLUMN';