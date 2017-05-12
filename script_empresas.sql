CREATE TABLE dbo.Businesss (
	id int NOT NULL IDENTITY(1,1),
	rut varchar(20) NOT NULL,
	direccion varchar(100) NULL,
	nombre varchar(100) NOT NULL
) go

CREATE TABLE dbo.user_businesss (
	userid int NOT NULL,
	id int NOT NULL
) go
