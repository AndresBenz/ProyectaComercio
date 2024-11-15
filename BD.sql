USE [master]
GO
/****** Object:  Database [PROYECTACOMERCIO]    Script Date: 11/11/2024 20:07:15 ******/
CREATE DATABASE [PROYECTACOMERCIO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PLANTANOBLE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PLANTANOBLE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PLANTANOBLE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PLANTANOBLE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PROYECTACOMERCIO] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PROYECTACOMERCIO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PROYECTACOMERCIO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET ARITHABORT OFF 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET  MULTI_USER 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PROYECTACOMERCIO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PROYECTACOMERCIO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PROYECTACOMERCIO] SET QUERY_STORE = ON
GO
ALTER DATABASE [PROYECTACOMERCIO] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PROYECTACOMERCIO]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Direccion] [varchar](255) NULL,
	[CorreoElectronico] [varchar](100) NOT NULL,
	[Telefono] [varchar](15) NULL,
	[DNI] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[IdCompra] [int] IDENTITY(1,1) NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[FechaCompra] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesCompra]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesCompra](
	[IdDetalleCompra] [int] IDENTITY(1,1) NOT NULL,
	[IdCompra] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioCompra] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesVenta]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesVenta](
	[IdDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdVenta] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](10, 2) NOT NULL,
	[Subtotal] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcas](
	[IdMarca] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductoProveedor]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductoProveedor](
	[IdProducto] [int] NOT NULL,
	[IdProveedor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC,
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[IdTipo] [int] NULL,
	[IdMarca] [int] NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[StockActual] [int] NOT NULL,
	[StockMinimo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Direccion] [varchar](255) NULL,
	[CorreoElectronico] [varchar](100) NULL,
	[Telefono] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipos]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos](
	[IdTipo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[CorreoElectronico] [nvarchar](255) NOT NULL,
	[DNI] [int] NOT NULL,
	[Telefono] [nvarchar](15) NULL,
	[TipoUsuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[IdVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NULL,
	[Fecha] [datetime] NOT NULL,
	[Total] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Direccion], [CorreoElectronico], [Telefono], [DNI]) VALUES (1, N'Cliente A', N'Dirección A', N'clienteA@correo.com', N'111222333', N'39517187')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Direccion], [CorreoElectronico], [Telefono], [DNI]) VALUES (2, N'Cliente B', N'Dirección B', N'clienteB@correo.com', N'444555666', N'39477188')
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Direccion], [CorreoElectronico], [Telefono], [DNI]) VALUES (5, N'Andres', N'Combate De San Lorenzo', N'andresben18@gmail.com', N'01133277216', N'39517168')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Compras] ON 

INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra]) VALUES (1, 1, CAST(N'2024-11-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra]) VALUES (2, 2, CAST(N'2024-11-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra]) VALUES (3, 1, CAST(N'2024-11-03T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Compras] OFF
GO
SET IDENTITY_INSERT [dbo].[DetallesCompra] ON 

INSERT [dbo].[DetallesCompra] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioCompra]) VALUES (1, 1, 1, 10, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesCompra] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioCompra]) VALUES (2, 1, 2, 5, CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesCompra] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioCompra]) VALUES (3, 2, 1, 15, CAST(1500.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DetallesCompra] OFF
GO
SET IDENTITY_INSERT [dbo].[DetallesVenta] ON 

INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (1, 1, 1, 2, CAST(2500.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (2, 1, 2, 1, CAST(1500.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DetallesVenta] OFF
GO
SET IDENTITY_INSERT [dbo].[Marcas] ON 

INSERT [dbo].[Marcas] ([IdMarca], [Nombre]) VALUES (1, N'MarcaA')
INSERT [dbo].[Marcas] ([IdMarca], [Nombre]) VALUES (2, N'MarcaB')
INSERT [dbo].[Marcas] ([IdMarca], [Nombre]) VALUES (3, N'MarcaC')
SET IDENTITY_INSERT [dbo].[Marcas] OFF
GO
INSERT [dbo].[ProductoProveedor] ([IdProducto], [IdProveedor]) VALUES (1, 1)
INSERT [dbo].[ProductoProveedor] ([IdProducto], [IdProveedor]) VALUES (2, 2)
INSERT [dbo].[ProductoProveedor] ([IdProducto], [IdProveedor]) VALUES (3, 1)
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([IdProducto], [Nombre], [IdTipo], [IdMarca], [Precio], [StockActual], [StockMinimo]) VALUES (1, N'Fertilizante X', 1, 1, CAST(2000.00 AS Decimal(10, 2)), 100, 10)
INSERT [dbo].[Productos] ([IdProducto], [Nombre], [IdTipo], [IdMarca], [Precio], [StockActual], [StockMinimo]) VALUES (2, N'Pesticida Y', 2, 2, CAST(7777.00 AS Decimal(10, 2)), 50, 5)
INSERT [dbo].[Productos] ([IdProducto], [Nombre], [IdTipo], [IdMarca], [Precio], [StockActual], [StockMinimo]) VALUES (3, N'Sustrato Z', 3, 3, CAST(4000.00 AS Decimal(10, 2)), 200, 20)
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedores] ON 

INSERT [dbo].[Proveedores] ([IdProveedor], [Nombre], [Direccion], [CorreoElectronico], [Telefono]) VALUES (1, N'Proveedor 1', N'Dirección 1', N'contacto@proveedor1.com', N'123456789')
INSERT [dbo].[Proveedores] ([IdProveedor], [Nombre], [Direccion], [CorreoElectronico], [Telefono]) VALUES (2, N'Proveedor 2', N'Dirección 282', N'contacto@proveedor2.com', N'987654321')
SET IDENTITY_INSERT [dbo].[Proveedores] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipos] ON 

INSERT [dbo].[Tipos] ([IdTipo], [Nombre]) VALUES (1, N'Fertilizante')
INSERT [dbo].[Tipos] ([IdTipo], [Nombre]) VALUES (2, N'Pesticida')
INSERT [dbo].[Tipos] ([IdTipo], [Nombre]) VALUES (3, N'Sustrato')
SET IDENTITY_INSERT [dbo].[Tipos] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario]) VALUES (1, N'Andres', N'andresben18@gmail.com', 39517168, N'', 1)
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario]) VALUES (2, N'Brenda', N'brenda@hotmail.com', 384447171, N'', 1)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Ventas] ON 

INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (1, 1, CAST(N'2024-08-17T02:33:40.330' AS DateTime), CAST(65.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Ventas] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Clientes__531402F33375632E]    Script Date: 11/11/2024 20:07:16 ******/
ALTER TABLE [dbo].[Clientes] ADD UNIQUE NONCLUSTERED 
(
	[CorreoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__USUARIOS__C035B8DD50CED3B1]    Script Date: 11/11/2024 20:07:16 ******/
ALTER TABLE [dbo].[Usuarios] ADD UNIQUE NONCLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_CorreoElectronico]    Script Date: 11/11/2024 20:07:16 ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [UQ_CorreoElectronico] UNIQUE NONCLUSTERED 
(
	[CorreoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedores] ([IdProveedor])
GO
ALTER TABLE [dbo].[DetallesCompra]  WITH CHECK ADD FOREIGN KEY([IdCompra])
REFERENCES [dbo].[Compras] ([IdCompra])
GO
ALTER TABLE [dbo].[DetallesCompra]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[DetallesVenta]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[DetallesVenta]  WITH CHECK ADD FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Ventas] ([IdVenta])
GO
ALTER TABLE [dbo].[ProductoProveedor]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[ProductoProveedor]  WITH CHECK ADD FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedores] ([IdProveedor])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([IdMarca])
REFERENCES [dbo].[Marcas] ([IdMarca])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([IdTipo])
REFERENCES [dbo].[Tipos] ([IdTipo])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
GO
/****** Object:  StoredProcedure [dbo].[delCliente]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[delCliente]
    @DNI INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Clientes WHERE DNI = @DNI;
END;
GO
/****** Object:  StoredProcedure [dbo].[DelCompra]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DelCompra]
    @IdCompra INT
AS
BEGIN
    DELETE FROM Compras 
    WHERE IdCompra = @IdCompra
END
GO
/****** Object:  StoredProcedure [dbo].[DelProducto]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DelProducto]
    @IdProducto INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Productos WHERE IdProducto = @IdProducto;
END;
GO
/****** Object:  StoredProcedure [dbo].[delProveedor]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[delProveedor]
    @IdProveedor INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Proveedores
    WHERE IdProveedor = @IdProveedor;
END
GO
/****** Object:  StoredProcedure [dbo].[insCliente]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insCliente]
    @Nombre NVARCHAR(100),
    @Direccion NVARCHAR(200),
    @CorreoElectronico NVARCHAR(100),
    @Telefono NVARCHAR(20),
	@DNI NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Clientes (Nombre, Direccion, CorreoElectronico, Telefono, DNI)
    VALUES (@Nombre, @Direccion, @CorreoElectronico, @Telefono, @DNI);
END;
GO
/****** Object:  StoredProcedure [dbo].[insCompra]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insCompra]
    @IdProveedor INT,
    @FechaCompra DATETIME
AS
BEGIN
    INSERT INTO Compras (IdProveedor, FechaCompra)
    VALUES (@IdProveedor, @FechaCompra)
END
GO
/****** Object:  StoredProcedure [dbo].[insProducto]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insProducto]
    @Nombre NVARCHAR(100),
    @IdTipo INT,
    @IdMarca INT,
    @Precio DECIMAL(18, 2),
    @StockActual INT,
    @StockMinimo INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Productos (Nombre, IdTipo, IdMarca, Precio, StockActual, StockMinimo)
    VALUES (@Nombre, @IdTipo, @IdMarca, @Precio, @StockActual, @StockMinimo);
    
    SELECT SCOPE_IDENTITY() AS IdProducto; 
END;
GO
/****** Object:  StoredProcedure [dbo].[insProveedor]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insProveedor]
@Nombre NVARCHAR(100),
@Direccion NVARCHAR(200),
@CorreoElectronico NVARCHAR(100),
@Telefono NVARCHAR(20)
AS
BEGIN
    INSERT INTO Proveedores (Nombre, Direccion, CorreoElectronico, Telefono)
    VALUES (@Nombre, @Direccion, @CorreoElectronico, @Telefono);
END
GO
/****** Object:  StoredProcedure [dbo].[InsUsuario]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsUsuario]
    @Nombre NVARCHAR(100),
    @CorreoElectronico NVARCHAR(255),
    @DNI INT,
    @Telefono NVARCHAR(15),
    @TipoUsuario INT
AS
BEGIN
    INSERT INTO USUARIOS (Nombre, CorreoElectronico, DNI, Telefono, TipoUsuario)
    VALUES (@Nombre, @CorreoElectronico, @DNI, @Telefono, @TipoUsuario)
END
GO
/****** Object:  StoredProcedure [dbo].[Loguear]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Loguear]
    @CorreoElectronico NVARCHAR(255),
    @DNI INT
AS
BEGIN
    SELECT IdUsuario, Nombre, TipoUsuario
    FROM USUARIOS
    WHERE CorreoElectronico = @CorreoElectronico AND DNI = @DNI
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerUsuarioPorId]
    @IdUsuario INT
AS
BEGIN
    SELECT IdUsuario, Nombre, CorreoElectronico, DNI, Telefono
    FROM USUARIOS
    WHERE IdUsuario = @IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[SelClientePorId]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelClientePorId]
    @DNI INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        IdCliente, 
        Nombre, 
        Direccion, 
        CorreoElectronico, 
        Telefono,
		DNI
    FROM 
        Clientes 
    WHERE 
        DNI = @DNI;
END

GO
/****** Object:  StoredProcedure [dbo].[SelClientes]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelClientes]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        IdCliente, 
        Nombre, 
        Direccion, 
        CorreoElectronico, 
        Telefono, 
		DNI
    FROM 
        Clientes;
END

GO
/****** Object:  StoredProcedure [dbo].[SelCompraPorId]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelCompraPorId]
    @IdCompra INT
AS
BEGIN
    SELECT IdCompra, IdProveedor, FechaCompra 
    FROM Compras 
    WHERE IdCompra = @IdCompra
END
GO
/****** Object:  StoredProcedure [dbo].[SelCompras]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelCompras]
AS
BEGIN
    SELECT IdCompra, IdProveedor, FechaCompra FROM Compras
END
GO
/****** Object:  StoredProcedure [dbo].[SelDetallesCompra]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelDetallesCompra]
    @IdCompra INT
AS
BEGIN
    SELECT IdDetalleCompra, IdProducto, Cantidad, PrecioCompra 
    FROM DetallesCompra 
    WHERE IdCompra = @IdCompra
END
GO
/****** Object:  StoredProcedure [dbo].[SelDetallesVenta]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelDetallesVenta]
AS
BEGIN
    SET NOCOUNT ON;  

    SELECT TOP (1000) 
        [IdDetalleVenta], 
        [IdVenta], 
        [IdProducto], 
        [Cantidad], 
        [PrecioUnitario], 
        ([Cantidad] * [PrecioUnitario]) AS Subtotal  
    FROM [PLANTANOBLE].[dbo].[DetallesVenta]
END
GO
/****** Object:  StoredProcedure [dbo].[SelProductoPorId]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelProductoPorId]
    @IdProducto INT
AS
BEGIN
    SELECT IdProducto, Nombre, IdTipo, IdMarca, Precio, StockActual, StockMinimo
    FROM Productos
    WHERE IdProducto = @IdProducto
END
GO
/****** Object:  StoredProcedure [dbo].[SelProductoPorNombre]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SelProductoPorNombre]
    @Nombre NVARCHAR(100)
AS
BEGIN
    SELECT IdProducto, Nombre, IdTipo, IdMarca, Precio, StockActual, StockMinimo
    FROM Productos
    WHERE Nombre LIKE '%' + @Nombre + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[SelProductos]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelProductos]
AS
BEGIN
    -- Selecciona todos los productos
    SELECT 
        IdProducto,
        Nombre,
        IdTipo,
        IdMarca,
        Precio,
        StockActual,
        StockMinimo
    FROM 
        dbo.Productos;
END
GO
/****** Object:  StoredProcedure [dbo].[SelProveedores]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelProveedores]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT IdProveedor, Nombre, Direccion, CorreoElectronico, Telefono
    FROM Proveedores;
END;
GO
/****** Object:  StoredProcedure [dbo].[selProveedorPorId]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[selProveedorPorId]
    @IdProveedor INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT IdProveedor, Nombre, Direccion, CorreoElectronico, Telefono
    FROM Proveedores
    WHERE IdProveedor = @IdProveedor;
END;
GO
/****** Object:  StoredProcedure [dbo].[SelUsuariosCompleto]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelUsuariosCompleto]
AS
BEGIN
    SELECT IdUsuario, Nombre, CorreoElectronico, DNI, Telefono
    FROM USUARIOS
END
GO
/****** Object:  StoredProcedure [dbo].[updCliente]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updCliente]
    @IdCliente INT,
    @Nombre NVARCHAR(100),
    @Direccion NVARCHAR(200),
    @CorreoElectronico NVARCHAR(100),
    @Telefono NVARCHAR(20),
	@DNI NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Clientes
    SET Nombre = @Nombre,
        Direccion = @Direccion,
        CorreoElectronico = @CorreoElectronico,
        Telefono = @Telefono,
		DNI= @DNI
    WHERE DNI = @DNI;
END;
GO
/****** Object:  StoredProcedure [dbo].[updCompra]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updCompra]
    @IdCompra INT,
    @IdProveedor INT,
    @FechaCompra DATETIME
AS
BEGIN
    UPDATE Compras
    SET IdProveedor = @IdProveedor, FechaCompra = @FechaCompra
    WHERE IdCompra = @IdCompra
END
GO
/****** Object:  StoredProcedure [dbo].[updProducto]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updProducto]
    @IdProducto INT,
    @Nombre NVARCHAR(100),
    @IdTipo INT,
    @IdMarca INT,
    @Precio DECIMAL(18, 2),
    @StockActual INT,
    @StockMinimo INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Productos
    SET Nombre = @Nombre,
        IdTipo = @IdTipo,
        IdMarca = @IdMarca,
        Precio = @Precio,
        StockActual = @StockActual,
        StockMinimo = @StockMinimo
    WHERE IdProducto = @IdProducto;
END;
GO
/****** Object:  StoredProcedure [dbo].[updProveedor]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updProveedor]
    @IdProveedor INT,
    @Nombre NVARCHAR(100),
    @Direccion NVARCHAR(200),
    @CorreoElectronico NVARCHAR(100),
    @Telefono NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Proveedores
    SET Nombre = @Nombre,
        Direccion = @Direccion,
        CorreoElectronico = @CorreoElectronico,
        Telefono = @Telefono
    WHERE IdProveedor = @IdProveedor;
END
GO
/****** Object:  StoredProcedure [dbo].[verificarUsuarioExistente]    Script Date: 11/11/2024 20:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[verificarUsuarioExistente]
    @DNI INT,
    @CorreoElectronico NVARCHAR(255)
AS
BEGIN
    DECLARE @Existe INT;
    SELECT @Existe = COUNT(*)
    FROM USUARIOS
    WHERE DNI = @DNI OR CorreoElectronico = @CorreoElectronico;
    
    SELECT @Existe AS Existe;
END
GO
USE [master]
GO
ALTER DATABASE [PROYECTACOMERCIO] SET  READ_WRITE 
GO
