Create database Inventario;
go

Use Inventario;
go

/* Tabla roles, almacenara los roles de usuarios 
para el login (administrador,usuario normal)*/
Create table Roles(
	RolId int identity primary key NOT NULL,
	Nombre varchar(50) NOT NULL
);
go
/* Tabla Usuarios, almacenara los usuarios */
Create table Usuarios(
	UsuarioId int identity(1,1) primary key NOT NULL,
	Nombre varchar(50) NOT NULL,
	Contrasenia varchar(50) NOT NULL,
	RolId int default(2) NOT NULL,
	/* Foreign key crea relaciones entre tablas*/
	Foreign key (RolId) references Roles(RolId)
);
go
/* Tabla Productos, almacenara los productos en stock */
Create table Productos(
	ProductoId int identity(1,1) primary key NOT NULL,
	Nombre varchar(50) NOT NULL,
	Descripcion varchar(50) NOT NULL,
	Precio Decimal(16,2) NOT NULL,
	Cantidad int NOT NULL,
);
go
/* Tabla Venta, almacenara las ventas realizadas de productos en stock */
Create table Ventas(
	VentaId int identity(1,1) primary key NOT NULL,
	Titulo varchar(50) NOT NULL,
	Cliente varchar(50) NOT NULL,
	Fecha Date NOT NULL,
	ProductoId int NOT NULL,
	Cantidad int NOT NULL,
	Total Decimal(16,2) NOT NULL
	Foreign key (ProductoId) references Productos(ProductoId)
);
go
/* Tabla Proveedores, almacenara los proveedores */
Create table Proveedores(
	ProveedorId int identity(1,1) primary key NOT NULL,
	Nombre varchar(50) NOT NULL,
	Telefono varchar(50) NOT NULL,
	Pais varchar(50) NOT NULL
);
go
/* Tabla Compras, almacenara las compras realizadas a los proveedores */
Create table Compras(
	CompraId int identity(1,1) primary key NOT NULL,
	Titulo varchar(50) NOT NULL,
	Fecha Date NOT NULL,
	ProductoId int NOT NULL,
	Cantidad int NOT NULL, 
	ProveedorId int NOT NULL,
	Total Decimal(16,2) NOT NULL,
	Foreign key (ProductoId) references Productos(ProductoId),
	Foreign key (ProveedorId) references Proveedores(ProveedorId)
);
go


INSERT INTO Roles(Nombre) VALUES('Administrador');
go
INSERT INTO Roles(Nombre) VALUES('Cliente');
go

INSERT INTO Usuarios(Nombre,Contrasenia,RolId) VALUES('Jhonatan','1234',1);
go

INSERT INTO Productos(Nombre,Descripcion,Precio,Cantidad)VALUES('Monitor LCD 22','Excelente monitor marca LG, 144Hz', 200, 10)
go

