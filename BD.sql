USE [master]
GO
/****** Object:  Database [PROYECTACOMERCIO]    Script Date: 13/12/2024 17:24:09 ******/
CREATE DATABASE [PROYECTACOMERCIO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PLANTANOBLE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PLANTANOBLE.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Categoria]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 13/12/2024 17:24:09 ******/
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
	[Activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[IdCompra] [int] IDENTITY(1,1) NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[FechaCompra] [datetime] NOT NULL,
	[TipoPago] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleCompra]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCompra](
	[IdDetalleCompra] [int] IDENTITY(1,1) NOT NULL,
	[IdCompra] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[PrecioCompra] [decimal](18, 2) NULL,
	[Subtotal] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesVenta]    Script Date: 13/12/2024 17:24:09 ******/
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
/****** Object:  Table [dbo].[Marcas]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcas](
	[IdMarca] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductoProveedor]    Script Date: 13/12/2024 17:24:09 ******/
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
/****** Object:  Table [dbo].[Productos]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[IdCategoria] [int] NULL,
	[IdMarca] [int] NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[StockActual] [int] NOT NULL,
	[StockMinimo] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[PorcentajeGanancia] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Detalle] [varchar](255) NULL,
	[CorreoElectronico] [varchar](100) NULL,
	[Telefono] [varchar](15) NULL,
	[Activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 13/12/2024 17:24:09 ******/
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
	[Activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 13/12/2024 17:24:09 ******/
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
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Activo]) VALUES (1, N'Fertilizante', 1)
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Activo]) VALUES (2, N'PesticidaX', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Activo]) VALUES (3, N'Sustrato', 1)
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Activo]) VALUES (4, N'Herramientas', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Activo]) VALUES (5, N'Adornos jardin', 1)
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Activo]) VALUES (6, N'Plantas', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Activo]) VALUES (7, N'Control de Plagas', 1)
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Activo]) VALUES (8, N'Tierra', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Activo]) VALUES (9, N'Regadores', 1)
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Activo]) VALUES (10, N'Semillas', 1)
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Activo]) VALUES (11, N'Piedras', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Activo]) VALUES (12, N'Contenedores', 1)
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Activo]) VALUES (13, N'Fertilizante', 1)
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Direccion], [CorreoElectronico], [Telefono], [DNI], [Activo]) VALUES (1, N'Cliente U', N'Rivadivia 141', N'clienteA@correo.com', N'111222333', N'39517187', 1)
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Direccion], [CorreoElectronico], [Telefono], [DNI], [Activo]) VALUES (2, N'Cliente B', N'Dirección 522', N'clienteB@correo.com', N'4445556661', N'39477188', 1)
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Direccion], [CorreoElectronico], [Telefono], [DNI], [Activo]) VALUES (5, N'Andres', N'Combate De San Lorenzo 273', N'andresben18@gmail.com', N'01133277216', N'39517168', 0)
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Direccion], [CorreoElectronico], [Telefono], [DNI], [Activo]) VALUES (6, N'Juan', N'La pampa 444', N'Juan@hotmail.com', N'1235344', N'4733633', 0)
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Direccion], [CorreoElectronico], [Telefono], [DNI], [Activo]) VALUES (7, N'Agustin', N'Malvinas Argentinas 674', N'agus@gmail.com', N'123341', N'1234422', 1)
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Direccion], [CorreoElectronico], [Telefono], [DNI], [Activo]) VALUES (8, N'Julian', N'Alberti 243', N'Julian@hotmail.com', N'245223', N'39517189', 1)
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Direccion], [CorreoElectronico], [Telefono], [DNI], [Activo]) VALUES (9, N'Miguel', N'Guido 282', N'Migue@hotmail.com', N'1145223', N'3556522', 1)
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Direccion], [CorreoElectronico], [Telefono], [DNI], [Activo]) VALUES (10, N'Mirta', N'Guido 176', N'Mirta@hotmail.com', N'123342422', N'72834764', 1)
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Compras] ON 

INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra], [TipoPago]) VALUES (1, 1, CAST(N'2024-11-01T00:00:00.000' AS DateTime), N'Efectivo')
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra], [TipoPago]) VALUES (2, 2, CAST(N'2024-11-02T00:00:00.000' AS DateTime), N'Transferencia')
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra], [TipoPago]) VALUES (3, 1, CAST(N'2024-11-03T00:00:00.000' AS DateTime), N'Efectivo')
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra], [TipoPago]) VALUES (4, 6, CAST(N'2024-12-11T02:42:18.060' AS DateTime), N'Efectivo')
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra], [TipoPago]) VALUES (5, 6, CAST(N'2024-12-11T03:02:33.893' AS DateTime), N'Efectivo')
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra], [TipoPago]) VALUES (6, 6, CAST(N'2024-12-11T03:17:07.183' AS DateTime), N'Efectivo')
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra], [TipoPago]) VALUES (7, 6, CAST(N'2024-12-11T03:21:56.740' AS DateTime), N'Efectivo')
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra], [TipoPago]) VALUES (8, 2, CAST(N'2024-12-11T03:28:09.500' AS DateTime), N'Transferencia')
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra], [TipoPago]) VALUES (9, 2, CAST(N'2024-12-11T03:52:18.227' AS DateTime), N'Transferencia')
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra], [TipoPago]) VALUES (10, 2, CAST(N'2024-12-11T03:54:50.077' AS DateTime), N'Efectivo')
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra], [TipoPago]) VALUES (11, 2, CAST(N'2024-12-11T03:57:58.613' AS DateTime), N'Efectivo')
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra], [TipoPago]) VALUES (12, 2, CAST(N'2024-12-11T03:59:36.870' AS DateTime), N'Efectivo')
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra], [TipoPago]) VALUES (13, 2, CAST(N'2024-12-13T03:42:28.827' AS DateTime), N'Efectivo')
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra], [TipoPago]) VALUES (14, 2, CAST(N'2024-12-13T03:48:25.563' AS DateTime), N'Transferencia')
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra], [TipoPago]) VALUES (15, 6, CAST(N'2024-12-13T03:50:19.677' AS DateTime), N'Efectivo')
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra], [TipoPago]) VALUES (16, 6, CAST(N'2024-12-13T03:52:44.090' AS DateTime), N'Efectivo')
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra], [TipoPago]) VALUES (17, 2, CAST(N'2024-12-13T03:55:11.077' AS DateTime), N'Transferencia')
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra], [TipoPago]) VALUES (18, 2, CAST(N'2024-12-13T03:59:24.877' AS DateTime), N'Efectivo')
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra], [TipoPago]) VALUES (19, 2, CAST(N'2024-12-13T04:00:37.637' AS DateTime), N'Transferencia')
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [FechaCompra], [TipoPago]) VALUES (20, 7, CAST(N'2024-12-13T13:46:06.377' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[Compras] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleCompra] ON 

INSERT [dbo].[DetalleCompra] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioCompra], [Subtotal]) VALUES (1, 1, 1, 5, CAST(200.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompra] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioCompra], [Subtotal]) VALUES (2, 1, 2, 3, CAST(150.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompra] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioCompra], [Subtotal]) VALUES (3, 2, 1, 10, CAST(50.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompra] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioCompra], [Subtotal]) VALUES (4, 3, 2, 2, CAST(200.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompra] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioCompra], [Subtotal]) VALUES (5, 0, 1, 2, CAST(3000.00 AS Decimal(18, 2)), CAST(6000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompra] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioCompra], [Subtotal]) VALUES (6, 5, 1, 5, CAST(5000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompra] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioCompra], [Subtotal]) VALUES (7, 6, 1, 2, CAST(5000.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompra] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioCompra], [Subtotal]) VALUES (8, 7, 3, 3, CAST(2000.00 AS Decimal(18, 2)), CAST(6000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompra] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioCompra], [Subtotal]) VALUES (9, 7, 1, 4, CAST(1000.00 AS Decimal(18, 2)), CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompra] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioCompra], [Subtotal]) VALUES (10, 8, 2, 12, CAST(1000.00 AS Decimal(18, 2)), CAST(12000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompra] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioCompra], [Subtotal]) VALUES (11, 12, 2, 3, CAST(1000.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompra] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioCompra], [Subtotal]) VALUES (12, 13, 5, 3, CAST(1200.00 AS Decimal(18, 2)), CAST(3600.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompra] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioCompra], [Subtotal]) VALUES (13, 14, 5, 2, CAST(3700.00 AS Decimal(18, 2)), CAST(7400.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompra] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioCompra], [Subtotal]) VALUES (14, 15, 3, 2, CAST(3000.00 AS Decimal(18, 2)), CAST(6000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompra] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioCompra], [Subtotal]) VALUES (15, 16, 15, 1, CAST(5000.00 AS Decimal(18, 2)), CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompra] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioCompra], [Subtotal]) VALUES (16, 17, 5, 2, CAST(25000.00 AS Decimal(18, 2)), CAST(50000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompra] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioCompra], [Subtotal]) VALUES (17, 18, 5, 3, CAST(5000.00 AS Decimal(18, 2)), CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleCompra] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioCompra], [Subtotal]) VALUES (18, 19, 5, 3, CAST(2000.00 AS Decimal(18, 2)), CAST(6000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[DetalleCompra] OFF
GO
SET IDENTITY_INSERT [dbo].[DetallesVenta] ON 

INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (1, 1, 1, 2, CAST(2500.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (2, 1, 2, 1, CAST(1500.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (3, 12, 1, 2, CAST(2000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (4, 12, 1, 2, CAST(2000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (5, 12, 2, 1, CAST(7777.00 AS Decimal(10, 2)), CAST(7777.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (6, 12, 1, 2, CAST(2000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (7, 12, 1, 1, CAST(2000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (8, 12, 1, 2, CAST(2000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (9, 13, 3, 5, CAST(4000.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (10, 14, 5, 1, CAST(15000.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (11, 15, 2, 1, CAST(7777.00 AS Decimal(10, 2)), CAST(7777.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (12, 16, 1, 2, CAST(2000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (13, 20, 3, 2, CAST(4000.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (14, 20, 2, 1, CAST(7777.00 AS Decimal(10, 2)), CAST(7777.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (15, 21, 3, 2, CAST(4000.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (16, 21, 2, 1, CAST(7777.00 AS Decimal(10, 2)), CAST(7777.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (17, 22, 6, 1, CAST(14000.00 AS Decimal(10, 2)), CAST(14000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (18, 22, 5, 1, CAST(15000.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (19, 22, 3, 1, CAST(4000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (20, 23, 3, 2, CAST(4000.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (21, 24, 5, 2, CAST(15000.00 AS Decimal(10, 2)), CAST(30000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (22, 25, 1, 2, CAST(2000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (23, 25, 2, 1, CAST(7777.00 AS Decimal(10, 2)), CAST(7777.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (24, 26, 3, 2, CAST(4000.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (25, 27, 3, 2, CAST(4000.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (26, 28, 3, 1, CAST(4000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (27, 29, 2, 2, CAST(7777.00 AS Decimal(10, 2)), CAST(15554.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (28, 30, 5, 2, CAST(15000.00 AS Decimal(10, 2)), CAST(30000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (29, 30, 3, 1, CAST(4000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (30, 31, 1, 2, CAST(2000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (31, 32, 1, 3, CAST(2000.00 AS Decimal(10, 2)), CAST(6000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (32, 33, 5, 1, CAST(15000.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (33, 34, 1, 1, CAST(2000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (34, 34, 3, 1, CAST(4000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (35, 37, 1, 2, CAST(2000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (36, 37, 2, 1, CAST(7777.00 AS Decimal(10, 2)), CAST(7777.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (37, 37, 6, 2, CAST(14000.00 AS Decimal(10, 2)), CAST(28000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (38, 38, 1, 2, CAST(2000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (39, 38, 2, 1, CAST(7777.00 AS Decimal(10, 2)), CAST(7777.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (40, 39, 2, 3, CAST(7777.00 AS Decimal(10, 2)), CAST(23331.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (41, 39, 3, 2, CAST(4000.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (42, 40, 5, 3, CAST(15000.00 AS Decimal(10, 2)), CAST(45000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (43, 40, 3, 2, CAST(4000.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (44, 41, 2, 2, CAST(7777.00 AS Decimal(10, 2)), CAST(15554.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (45, 41, 1, 1, CAST(2000.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (46, 42, 1, 2, CAST(2000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (47, 43, 3, 2, CAST(4000.00 AS Decimal(10, 2)), CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (48, 43, 2, 1, CAST(7777.00 AS Decimal(10, 2)), CAST(7777.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (49, 44, 1, 2, CAST(1200.00 AS Decimal(10, 2)), CAST(2400.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (50, 44, 2, 1, CAST(1200.00 AS Decimal(10, 2)), CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (51, 44, 3, 1, CAST(2400.00 AS Decimal(10, 2)), CAST(2400.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (52, 45, 1, 2, CAST(1200.00 AS Decimal(10, 2)), CAST(2400.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (53, 45, 3, 2, CAST(2400.00 AS Decimal(10, 2)), CAST(4800.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (54, 46, 3, 2, CAST(2400.00 AS Decimal(10, 2)), CAST(4800.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (55, 47, 2, 5, CAST(1190.00 AS Decimal(10, 2)), CAST(5950.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (56, 48, 3, 6, CAST(2400.00 AS Decimal(10, 2)), CAST(14400.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (57, 49, 3, 2, CAST(2400.00 AS Decimal(10, 2)), CAST(4800.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (58, 49, 2, 5, CAST(1190.00 AS Decimal(10, 2)), CAST(5950.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (59, 50, 3, 7, CAST(2400.00 AS Decimal(10, 2)), CAST(16800.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (60, 51, 3, 10, CAST(2400.00 AS Decimal(10, 2)), CAST(24000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (61, 52, 3, 5, CAST(2400.00 AS Decimal(10, 2)), CAST(12000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (62, 53, 3, 4, CAST(2400.00 AS Decimal(10, 2)), CAST(9600.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (63, 54, 8, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnitario], [Subtotal]) VALUES (64, 54, 5, 1, CAST(2400.00 AS Decimal(10, 2)), CAST(2400.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DetallesVenta] OFF
GO
SET IDENTITY_INSERT [dbo].[Marcas] ON 

INSERT [dbo].[Marcas] ([IdMarca], [Nombre], [Activo]) VALUES (1, N'Marcayh', 1)
INSERT [dbo].[Marcas] ([IdMarca], [Nombre], [Activo]) VALUES (2, N'Limbo', 1)
INSERT [dbo].[Marcas] ([IdMarca], [Nombre], [Activo]) VALUES (3, N'MarcaC', 1)
INSERT [dbo].[Marcas] ([IdMarca], [Nombre], [Activo]) VALUES (4, N'Matarazzo', 0)
INSERT [dbo].[Marcas] ([IdMarca], [Nombre], [Activo]) VALUES (5, N'SantaDs', 0)
INSERT [dbo].[Marcas] ([IdMarca], [Nombre], [Activo]) VALUES (6, N'Marin', 1)
INSERT [dbo].[Marcas] ([IdMarca], [Nombre], [Activo]) VALUES (7, N'Bosch', 1)
INSERT [dbo].[Marcas] ([IdMarca], [Nombre], [Activo]) VALUES (8, N'Missisipi', 0)
INSERT [dbo].[Marcas] ([IdMarca], [Nombre], [Activo]) VALUES (9, N'ibon', 0)
SET IDENTITY_INSERT [dbo].[Marcas] OFF
GO
INSERT [dbo].[ProductoProveedor] ([IdProducto], [IdProveedor]) VALUES (3, 2)
INSERT [dbo].[ProductoProveedor] ([IdProducto], [IdProveedor]) VALUES (3, 6)
INSERT [dbo].[ProductoProveedor] ([IdProducto], [IdProveedor]) VALUES (5, 2)
INSERT [dbo].[ProductoProveedor] ([IdProducto], [IdProveedor]) VALUES (15, 6)
INSERT [dbo].[ProductoProveedor] ([IdProducto], [IdProveedor]) VALUES (17, 7)
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([IdProducto], [Nombre], [IdCategoria], [IdMarca], [Precio], [StockActual], [StockMinimo], [Activo], [PorcentajeGanancia]) VALUES (1, N'Fertilizante X', 10, 6, CAST(0.00 AS Decimal(10, 2)), 10, 10, 1, CAST(15.00 AS Decimal(5, 2)))
INSERT [dbo].[Productos] ([IdProducto], [Nombre], [IdCategoria], [IdMarca], [Precio], [StockActual], [StockMinimo], [Activo], [PorcentajeGanancia]) VALUES (2, N'Pesticida Y', 5, 3, CAST(0.00 AS Decimal(10, 2)), 41, 5, 1, CAST(19.00 AS Decimal(5, 2)))
INSERT [dbo].[Productos] ([IdProducto], [Nombre], [IdCategoria], [IdMarca], [Precio], [StockActual], [StockMinimo], [Activo], [PorcentajeGanancia]) VALUES (3, N'Sustrato Z', 3, 3, CAST(4000.00 AS Decimal(10, 2)), 161, 20, 1, CAST(20.00 AS Decimal(5, 2)))
INSERT [dbo].[Productos] ([IdProducto], [Nombre], [IdCategoria], [IdMarca], [Precio], [StockActual], [StockMinimo], [Activo], [PorcentajeGanancia]) VALUES (5, N'MacetaZ', 5, 1, CAST(15000.00 AS Decimal(10, 2)), 12, 2, 1, CAST(20.00 AS Decimal(5, 2)))
INSERT [dbo].[Productos] ([IdProducto], [Nombre], [IdCategoria], [IdMarca], [Precio], [StockActual], [StockMinimo], [Activo], [PorcentajeGanancia]) VALUES (6, N'Rastrillo', 4, 1, CAST(14000.00 AS Decimal(10, 2)), 5, 2, 0, CAST(20.00 AS Decimal(5, 2)))
INSERT [dbo].[Productos] ([IdProducto], [Nombre], [IdCategoria], [IdMarca], [Precio], [StockActual], [StockMinimo], [Activo], [PorcentajeGanancia]) VALUES (7, N'Macetas', 5, 1, CAST(15000.00 AS Decimal(10, 2)), 5, 2, 0, CAST(20.00 AS Decimal(5, 2)))
INSERT [dbo].[Productos] ([IdProducto], [Nombre], [IdCategoria], [IdMarca], [Precio], [StockActual], [StockMinimo], [Activo], [PorcentajeGanancia]) VALUES (8, N'Pala', 4, 1, CAST(15000.00 AS Decimal(10, 2)), 2, 2, 1, CAST(20.00 AS Decimal(5, 2)))
INSERT [dbo].[Productos] ([IdProducto], [Nombre], [IdCategoria], [IdMarca], [Precio], [StockActual], [StockMinimo], [Activo], [PorcentajeGanancia]) VALUES (9, N'Pala Ancha', 12, 3, CAST(0.00 AS Decimal(10, 2)), 4, 5, 1, CAST(20.00 AS Decimal(5, 2)))
INSERT [dbo].[Productos] ([IdProducto], [Nombre], [IdCategoria], [IdMarca], [Precio], [StockActual], [StockMinimo], [Activo], [PorcentajeGanancia]) VALUES (10, N'Pala', 4, 1, CAST(15000.00 AS Decimal(10, 2)), 3, 2, 0, CAST(20.00 AS Decimal(5, 2)))
INSERT [dbo].[Productos] ([IdProducto], [Nombre], [IdCategoria], [IdMarca], [Precio], [StockActual], [StockMinimo], [Activo], [PorcentajeGanancia]) VALUES (11, N'Pala', 4, 3, CAST(15000.00 AS Decimal(10, 2)), 3, 2, 0, CAST(20.00 AS Decimal(5, 2)))
INSERT [dbo].[Productos] ([IdProducto], [Nombre], [IdCategoria], [IdMarca], [Precio], [StockActual], [StockMinimo], [Activo], [PorcentajeGanancia]) VALUES (12, N'Pala', 5, 3, CAST(15000.00 AS Decimal(10, 2)), 3, 2, 0, CAST(20.00 AS Decimal(5, 2)))
INSERT [dbo].[Productos] ([IdProducto], [Nombre], [IdCategoria], [IdMarca], [Precio], [StockActual], [StockMinimo], [Activo], [PorcentajeGanancia]) VALUES (13, N'Pala fina', 4, 1, CAST(15000.00 AS Decimal(10, 2)), 3, 2, 1, CAST(20.00 AS Decimal(5, 2)))
INSERT [dbo].[Productos] ([IdProducto], [Nombre], [IdCategoria], [IdMarca], [Precio], [StockActual], [StockMinimo], [Activo], [PorcentajeGanancia]) VALUES (14, N'Palita', 2, 3, CAST(15000.00 AS Decimal(10, 2)), 2, 2, 0, CAST(20.00 AS Decimal(5, 2)))
INSERT [dbo].[Productos] ([IdProducto], [Nombre], [IdCategoria], [IdMarca], [Precio], [StockActual], [StockMinimo], [Activo], [PorcentajeGanancia]) VALUES (15, N'Roca azulada', 5, 3, CAST(11000.00 AS Decimal(10, 2)), 4, 1, 1, CAST(20.00 AS Decimal(5, 2)))
INSERT [dbo].[Productos] ([IdProducto], [Nombre], [IdCategoria], [IdMarca], [Precio], [StockActual], [StockMinimo], [Activo], [PorcentajeGanancia]) VALUES (16, N'Desherbantes', 10, 7, CAST(0.00 AS Decimal(10, 2)), 5, 2, 1, CAST(17.00 AS Decimal(5, 2)))
INSERT [dbo].[Productos] ([IdProducto], [Nombre], [IdCategoria], [IdMarca], [Precio], [StockActual], [StockMinimo], [Activo], [PorcentajeGanancia]) VALUES (17, N'Pasto bahiano', 10, 1, CAST(0.00 AS Decimal(10, 2)), 4, 2, 1, CAST(20.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedores] ON 

INSERT [dbo].[Proveedores] ([IdProveedor], [Nombre], [Detalle], [CorreoElectronico], [Telefono], [Activo]) VALUES (1, N'Proveedor 1', N'Viene los jueves', N'contacto@proveedor1.com', N'123456789', 0)
INSERT [dbo].[Proveedores] ([IdProveedor], [Nombre], [Detalle], [CorreoElectronico], [Telefono], [Activo]) VALUES (2, N'Proveedor 2', N'Trae macetas', N'contacto@proveedor2.com', N'987654321', 1)
INSERT [dbo].[Proveedores] ([IdProveedor], [Nombre], [Detalle], [CorreoElectronico], [Telefono], [Activo]) VALUES (5, N'Proveedor 3', N'Pagar en el momento', N'Carlos@gmail.com', N'155377416', 1)
INSERT [dbo].[Proveedores] ([IdProveedor], [Nombre], [Detalle], [CorreoElectronico], [Telefono], [Activo]) VALUES (6, N'Marce', N'viene en la mañana', N'marce@hotmail.com', N'152133124', 1)
INSERT [dbo].[Proveedores] ([IdProveedor], [Nombre], [Detalle], [CorreoElectronico], [Telefono], [Activo]) VALUES (7, N'Martin', N'Camioneta blanca', N'Martin@hotmail.com', N'1133223423', 1)
SET IDENTITY_INSERT [dbo].[Proveedores] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario], [Activo]) VALUES (2, N'Brenda', N'brenda@hotmail.com', 384447171, N'1133277216', 1, 1)
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario], [Activo]) VALUES (4, N'Juancito', N'Juan@hotmail.com', 1313122, N'12333', 1, 0)
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario], [Activo]) VALUES (5, N'Agustin', N'Agustin@gmail.com', 381773223, N'7777724232', 1, 1)
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario], [Activo]) VALUES (7, N'Isma', N'ismael@gmail.com', 367323245, N'1233451231', 1, 1)
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario], [Activo]) VALUES (8, N'Franco', N'franco@hotmail.com', 2332133, N'12331234', 1, 0)
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario], [Activo]) VALUES (9, N'Ismael', N'Isma@gmail.com', 72826738, N'123124124', 0, 1)
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario], [Activo]) VALUES (10, N'Manuel', N'Manuel@gmail.com', 214124, N'123123', 1, 0)
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario], [Activo]) VALUES (11, N'Lucas', N'lucas@hotmail.com', 12313233, N'123124144', 0, 1)
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario], [Activo]) VALUES (12, N'Milton', N'Milton@hotmail.com', 5123123, N'451223123', 1, 1)
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario], [Activo]) VALUES (13, N'Raul', N'Raul@hotmail.com', 1241255, N'1233322', 0, 1)
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario], [Activo]) VALUES (14, N'Maxi', N'maxi@hotmail.com', 52132323, N'2151255', 1, 1)
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario], [Activo]) VALUES (15, N'Matias', N'andresben18@gmail.com', 39517187, N'1133277216', 0, 0)
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario], [Activo]) VALUES (16, N'Matias', N'Matu@hotmail.com', 131312222, N'1231231223', 0, 1)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Ventas] ON 

INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (1, 1, CAST(N'2024-08-17T02:33:40.330' AS DateTime), CAST(65.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (2, 1, CAST(N'2024-11-18T00:00:00.000' AS DateTime), CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (3, 2, CAST(N'2024-11-18T00:00:00.000' AS DateTime), CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (5, 1, CAST(N'2024-12-10T02:46:43.747' AS DateTime), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (6, 2, CAST(N'2024-12-10T02:49:27.160' AS DateTime), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (7, 2, CAST(N'2024-12-10T02:51:22.983' AS DateTime), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (8, 1, CAST(N'2024-12-10T02:54:15.313' AS DateTime), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (9, 1, CAST(N'2024-12-10T03:00:55.197' AS DateTime), CAST(15777.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (10, 1, CAST(N'2024-12-10T03:14:29.350' AS DateTime), CAST(71777.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (11, 1, CAST(N'2024-12-10T03:17:07.000' AS DateTime), CAST(34554.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (12, 1, CAST(N'2024-12-10T03:19:25.167' AS DateTime), CAST(15777.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (13, 2, CAST(N'2024-12-10T03:43:46.933' AS DateTime), CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (14, 2, CAST(N'2024-12-10T03:45:16.770' AS DateTime), CAST(26777.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (15, 2, CAST(N'2024-12-10T03:47:56.260' AS DateTime), CAST(43777.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (16, 1, CAST(N'2024-12-10T10:26:38.983' AS DateTime), CAST(27331.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (17, 1, CAST(N'2024-12-10T10:32:31.303' AS DateTime), CAST(6000.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (18, 1, CAST(N'2024-12-10T10:35:55.093' AS DateTime), CAST(23554.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (19, 1, CAST(N'2024-12-10T10:48:38.497' AS DateTime), CAST(45000.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (20, 1, CAST(N'2024-12-10T10:50:52.070' AS DateTime), CAST(15777.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (21, 1, CAST(N'2024-12-10T13:01:21.030' AS DateTime), CAST(15777.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (22, 1, CAST(N'2024-12-10T13:02:49.597' AS DateTime), CAST(33000.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (23, 2, CAST(N'2024-12-10T13:04:26.843' AS DateTime), CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (24, 1, CAST(N'2024-12-10T13:05:59.763' AS DateTime), CAST(30000.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (25, 1, CAST(N'2024-12-10T13:15:57.953' AS DateTime), CAST(11777.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (26, 1, CAST(N'2024-12-10T13:27:14.083' AS DateTime), CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (27, 1, CAST(N'2024-12-10T13:29:39.323' AS DateTime), CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (28, 1, CAST(N'2024-12-10T13:30:09.813' AS DateTime), CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (29, 1, CAST(N'2024-12-10T13:35:57.037' AS DateTime), CAST(15554.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (30, 1, CAST(N'2024-12-10T14:13:34.917' AS DateTime), CAST(34000.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (31, 2, CAST(N'2024-12-10T14:14:39.513' AS DateTime), CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (32, 1, CAST(N'2024-12-10T14:15:20.330' AS DateTime), CAST(6000.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (33, 1, CAST(N'2024-12-10T14:16:22.183' AS DateTime), CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (34, 1, CAST(N'2024-12-10T14:20:54.600' AS DateTime), CAST(6000.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (35, 1, CAST(N'2024-12-10T15:36:15.483' AS DateTime), CAST(19554.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (36, 1, CAST(N'2024-12-10T15:38:54.157' AS DateTime), CAST(29554.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (37, 1, CAST(N'2024-12-10T15:39:56.940' AS DateTime), CAST(39777.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (38, 1, CAST(N'2024-12-10T15:51:27.890' AS DateTime), CAST(11777.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (39, 1, CAST(N'2024-12-10T17:52:26.653' AS DateTime), CAST(31331.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (40, 1, CAST(N'2024-12-10T17:53:49.227' AS DateTime), CAST(53000.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (41, 1, CAST(N'2024-12-10T17:57:18.083' AS DateTime), CAST(17554.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (42, 1, CAST(N'2024-12-10T22:35:04.703' AS DateTime), CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (43, 2, CAST(N'2024-12-12T02:26:47.220' AS DateTime), CAST(15777.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (44, 2, CAST(N'2024-12-12T03:29:33.183' AS DateTime), CAST(6000.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (45, 2, CAST(N'2024-12-12T03:45:28.733' AS DateTime), CAST(7200.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (46, 10, CAST(N'2024-12-13T02:46:25.280' AS DateTime), CAST(4800.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (47, 10, CAST(N'2024-12-13T02:52:30.060' AS DateTime), CAST(5950.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (48, 10, CAST(N'2024-12-13T02:54:49.383' AS DateTime), CAST(14400.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (49, 1, CAST(N'2024-12-13T02:56:35.917' AS DateTime), CAST(10750.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (50, 2, CAST(N'2024-12-13T02:59:31.037' AS DateTime), CAST(16800.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (51, 1, CAST(N'2024-12-13T03:03:05.363' AS DateTime), CAST(24000.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (52, 1, CAST(N'2024-12-13T03:22:36.043' AS DateTime), CAST(12000.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (53, 1, CAST(N'2024-12-13T03:31:18.030' AS DateTime), CAST(9600.00 AS Decimal(10, 2)))
INSERT [dbo].[Ventas] ([IdVenta], [IdCliente], [Fecha], [Total]) VALUES (54, 1, CAST(N'2024-12-13T13:40:36.900' AS DateTime), CAST(2400.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Ventas] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Clientes__531402F33375632E]    Script Date: 13/12/2024 17:24:09 ******/
ALTER TABLE [dbo].[Clientes] ADD UNIQUE NONCLUSTERED 
(
	[CorreoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__USUARIOS__C035B8DD50CED3B1]    Script Date: 13/12/2024 17:24:09 ******/
ALTER TABLE [dbo].[Usuarios] ADD UNIQUE NONCLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_CorreoElectronico]    Script Date: 13/12/2024 17:24:09 ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [UQ_CorreoElectronico] UNIQUE NONCLUSTERED 
(
	[CorreoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categoria] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Marcas] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Productos] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Productos] ADD  DEFAULT ((0)) FOR [PorcentajeGanancia]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedores] ([IdProveedor])
GO
ALTER TABLE [dbo].[DetallesVenta]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[DetallesVenta]  WITH CHECK ADD FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Ventas] ([IdVenta])
GO
ALTER TABLE [dbo].[ProductoProveedor]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductoProveedor]  WITH CHECK ADD FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedores] ([IdProveedor])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([IdMarca])
REFERENCES [dbo].[Marcas] ([IdMarca])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
GO
/****** Object:  StoredProcedure [dbo].[DelCategoria]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DelCategoria]
    @IdCategoria INT
AS
BEGIN
    UPDATE Categoria SET Activo = 0 WHERE IdCategoria = @IdCategoria
END
GO
/****** Object:  StoredProcedure [dbo].[delCliente]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[delCliente]
    @DNI INT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [dbo].[Clientes]
    SET [Activo] = 0
    WHERE DNI = @DNI;
END;
GO
/****** Object:  StoredProcedure [dbo].[DelCompra]    Script Date: 13/12/2024 17:24:09 ******/
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
/****** Object:  StoredProcedure [dbo].[DelMarca]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DelMarca]
    @IdMarca INT
AS
BEGIN
    UPDATE Marcas
    SET Activo = 0
    WHERE IdMarca = @IdMarca
END

GO
/****** Object:  StoredProcedure [dbo].[DelProducto]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DelProducto]
    @IdProducto INT
AS
BEGIN
    SET NOCOUNT ON;

   UPDATE Productos 
    SET Activo = 0
    WHERE IdProducto = @IdProducto;
END;
GO
/****** Object:  StoredProcedure [dbo].[delProveedor]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[delProveedor]
    @IdProveedor INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Proveedores
    SET Activo = 0
    WHERE IdProveedor = @IdProveedor;
END
GO
/****** Object:  StoredProcedure [dbo].[DelUsuario]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DelUsuario]
    @IdUsuario INT
AS
BEGIN
    -- Actualiza la columna Activo a 0 en lugar de eliminar el usuario
    UPDATE USUARIOS
    SET Activo = 0
    WHERE IdUsuario = @IdUsuario;
END
GO
/****** Object:  StoredProcedure [dbo].[DelVenta]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DelVenta]
    @IdVenta INT
AS
BEGIN
    DELETE FROM Ventas
    WHERE IdVenta = @IdVenta
END
GO
/****** Object:  StoredProcedure [dbo].[insCategoria]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insCategoria]
    @Nombre NVARCHAR(100),
    @Activo BIT
AS
BEGIN
    INSERT INTO Categoria (Nombre, Activo) VALUES (@Nombre, @Activo)
END
GO
/****** Object:  StoredProcedure [dbo].[insCliente]    Script Date: 13/12/2024 17:24:09 ******/
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
    INSERT INTO Clientes (Nombre, Direccion, CorreoElectronico, Telefono, DNI, Activo)
    VALUES (@Nombre, @Direccion, @CorreoElectronico, @Telefono, @DNI, 1);
END;
GO
/****** Object:  StoredProcedure [dbo].[insCompra]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insCompra]
    @IdProveedor INT,
    @FechaCompra DATETIME,
	@TipoPago VARCHAR(50) 
AS
BEGIN
    INSERT INTO Compras (IdProveedor, FechaCompra,TipoPago)
    VALUES (@IdProveedor, @FechaCompra,@TipoPago)
END
GO
/****** Object:  StoredProcedure [dbo].[InsDetalleCompra]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsDetalleCompra]
    @IdCompra INT,
    @IdProducto INT,
    @Cantidad INT,
    @PrecioCompra DECIMAL(18,2),
    @Subtotal DECIMAL(18,2)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[DetalleCompra]
        ([IdCompra], [IdProducto], [Cantidad], [PrecioCompra], [Subtotal])
    VALUES
        (@IdCompra, @IdProducto, @Cantidad, @PrecioCompra, @Subtotal);

END
GO
/****** Object:  StoredProcedure [dbo].[InsDetalleVenta]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsDetalleVenta]
    @IdVenta INT,
    @IdProducto INT,
   
    @Cantidad INT,
    @PrecioUnitario DECIMAL(18, 2),
    @Subtotal DECIMAL(18, 2)
AS
BEGIN
    INSERT INTO DetallesVenta (IdVenta, IdProducto, Cantidad, PrecioUnitario, Subtotal)
    VALUES (@IdVenta, @IdProducto,  @Cantidad, @PrecioUnitario, @Subtotal);
END
GO
/****** Object:  StoredProcedure [dbo].[InsMarca]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsMarca]
    @Nombre NVARCHAR(100),
	@Activo BIT
AS
BEGIN
    INSERT INTO Marcas (Nombre, Activo)
    VALUES (@Nombre, @Activo)
END
GO
/****** Object:  StoredProcedure [dbo].[insProducto]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insProducto]
    @Nombre NVARCHAR(100),
    @IdCategoria INT,
    @IdMarca INT,
    @Precio DECIMAL(18, 2),
    @StockActual INT,
    @StockMinimo INT,
	@PorcentajeGanancia Decimal

AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Productos (Nombre, IdCategoria, IdMarca, Precio, StockActual, StockMinimo, Activo,  PorcentajeGanancia)
    VALUES (@Nombre, @IdCategoria, @IdMarca, @Precio, @StockActual, @StockMinimo, 1 ,  @PorcentajeGanancia);
    
    SELECT SCOPE_IDENTITY() AS IdProducto; 
END;
GO
/****** Object:  StoredProcedure [dbo].[insProveedor]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insProveedor]
@Nombre NVARCHAR(100),
@Detalle NVARCHAR(200),
@CorreoElectronico NVARCHAR(100),
@Telefono NVARCHAR(20),
@Activo BIT = 1
AS
BEGIN
    INSERT INTO Proveedores (Nombre, Detalle, CorreoElectronico, Telefono, Activo)
    VALUES (@Nombre, @Detalle, @CorreoElectronico, @Telefono, @Activo);
END
GO
/****** Object:  StoredProcedure [dbo].[InsUsuario]    Script Date: 13/12/2024 17:24:09 ******/
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
    INSERT INTO USUARIOS (Nombre, CorreoElectronico, DNI, Telefono, TipoUsuario,Activo )
    VALUES (@Nombre, @CorreoElectronico, @DNI, @Telefono, @TipoUsuario, 1)
END
GO
/****** Object:  StoredProcedure [dbo].[InsVenta]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsVenta]
    @IdCliente INT,
    @Fecha DATETIME,
    @Total DECIMAL(18, 2)
AS
BEGIN
    INSERT INTO Ventas (IdCliente, Fecha, Total)
    VALUES (@IdCliente, @Fecha, @Total)
END
GO
/****** Object:  StoredProcedure [dbo].[Loguear]    Script Date: 13/12/2024 17:24:09 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerProductosBajoStock]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerProductosBajoStock]
AS
BEGIN
    SELECT 
        [IdProducto],
        [Nombre],
        [IdCategoria],
        [IdMarca],
        [Precio],
        [StockActual],
        [StockMinimo],
        [Activo]
    FROM [PROYECTACOMERCIO].[dbo].[Productos]
    WHERE [StockActual] <= [StockMinimo]
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerUltimoIdCompra]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerUltimoIdCompra]
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT TOP 1 IdCompra
    FROM [dbo].[Compras]
    ORDER BY IdCompra DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerUsuarioPorId]
    @IdUsuario INT
AS
BEGIN
    SELECT IdUsuario, Nombre, CorreoElectronico, DNI, Telefono, TipoUsuario, Activo
    FROM USUARIOS
    WHERE IdUsuario = @IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[SelCategorias]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelCategorias]
AS
BEGIN
    SELECT IdCategoria, Nombre, Activo 
    FROM Categoria 
 
END
GO
/****** Object:  StoredProcedure [dbo].[SelCategoriasActivas]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelCategoriasActivas]
AS
BEGIN
    SELECT IdCategoria, Nombre, Activo
    FROM Categoria
    WHERE Activo = 1; -- Opcional: Filtrar solo categorías activas.
END
GO
/****** Object:  StoredProcedure [dbo].[SelClientePorId]    Script Date: 13/12/2024 17:24:09 ******/
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
        DNI = @DNI
		AND Activo = 1;
END

GO
/****** Object:  StoredProcedure [dbo].[SelClientes]    Script Date: 13/12/2024 17:24:09 ******/
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
        Clientes
		WHERE
        Activo = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[SelCompraPorId]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelCompraPorId]
    @IdCompra INT
AS
BEGIN
    SELECT 
        c.IdCompra, 
        c.IdProveedor, 
        p.Nombre AS NombreProveedor, 
        c.FechaCompra 
    FROM 
        Compras c
    INNER JOIN 
        Proveedores p ON c.IdProveedor = p.IdProveedor  
    WHERE 
        c.IdCompra = @IdCompra
END
GO
/****** Object:  StoredProcedure [dbo].[SelCompras]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelCompras]
AS
BEGIN
    SELECT 
        c.IdCompra, 
        c.IdProveedor, 
        p.Nombre AS NombreProveedor,  
        c.FechaCompra, 
		c.TipoPago
    FROM 
        Compras c
    INNER JOIN 
        Proveedores p ON c.IdProveedor = p.IdProveedor  
		ORDER BY 
        c.IdCompra DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[SelDetallesCompra]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelDetallesCompra]
    @IdCompra INT
AS
BEGIN
    SELECT 
        dc.IdDetalleCompra, 
        dc.IdProducto, 
        p.Nombre,  
        dc.Cantidad, 
        dc.PrecioCompra, 
		dc.Cantidad * dc.PrecioCompra AS Subtotal
    FROM 
        DetalleCompra dc
    INNER JOIN 
        Productos p ON dc.IdProducto = p.IdProducto  
    WHERE 
        dc.IdCompra = @IdCompra
END
GO
/****** Object:  StoredProcedure [dbo].[SelDetallesPorVenta]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelDetallesPorVenta]
    @IdVenta INT
AS
BEGIN
    SELECT 
        DV.IdDetalleVenta, 
        DV.IdVenta, 
        DV.IdProducto, 
        P.Nombre AS NombreProducto,  
        DV.Cantidad, 
        DV.PrecioUnitario, 
        DV.Subtotal
    FROM DetallesVenta DV
    INNER JOIN Productos P ON DV.IdProducto = P.IdProducto  
    WHERE DV.IdVenta = @IdVenta
END
GO
/****** Object:  StoredProcedure [dbo].[SelDetallesVenta]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelDetallesVenta]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (1000) 
        DV.[IdDetalleVenta], 
        DV.[IdVenta], 
        DV.[IdProducto], 
        P.Nombre AS NombreProducto, 
        DV.[Cantidad], 
        DV.[PrecioUnitario], 
        (DV.[Cantidad] * DV.[PrecioUnitario]) AS Subtotal  
    FROM [PROYECTACOMERCIO].[dbo].[DetallesVenta] DV
    INNER JOIN [PROYECTACOMERCIO].[dbo].[Productos] P ON DV.IdProducto = P.IdProducto
END
GO
/****** Object:  StoredProcedure [dbo].[SelMarcaPorId]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelMarcaPorId]
    @IdMarca INT
AS
BEGIN
    SELECT IdMarca, Nombre, Activo
    FROM Marcas
    WHERE IdMarca = @IdMarca
END
GO
/****** Object:  StoredProcedure [dbo].[SelMarcas]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelMarcas]
AS
BEGIN
    SELECT IdMarca, Nombre, Activo
    FROM Marcas
END
GO
/****** Object:  StoredProcedure [dbo].[SelMarcasActivas]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelMarcasActivas]
AS
BEGIN
    SELECT IdMarca, Nombre, Activo
    FROM Marcas
    WHERE Activo = 1; -- Opcional: Filtrar solo marcas activas.
END
GO
/****** Object:  StoredProcedure [dbo].[SelProductoPorId]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelProductoPorId]
    @IdProducto INT
AS
BEGIN
    SELECT IdProducto, Nombre, IdCategoria, IdMarca, Precio, StockActual, StockMinimo, PorcentajeGanancia
    FROM Productos
    WHERE IdProducto = @IdProducto
	AND Activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[SelProductoPorNombre]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelProductoPorNombre]
    @Nombre NVARCHAR(100)
AS
BEGIN
    SELECT IdProducto, Nombre, IdCategoria, IdMarca, Precio, StockActual, StockMinimo, PorcentajeGanancia
    FROM Productos
    WHERE Nombre LIKE '%' + @Nombre + '%'
	  AND Activo = 1 
END
GO
/****** Object:  StoredProcedure [dbo].[SelProductos]    Script Date: 13/12/2024 17:24:09 ******/
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
        IdCategoria,
        IdMarca,
        Precio,
        StockActual,
        StockMinimo,
		PorcentajeGanancia
    FROM 
        dbo.Productos
	WHERE 
        Activo = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[SelProductosConDetalles]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelProductosConDetalles]
AS
BEGIN
    SELECT 
        p.IdProducto,
        p.Nombre,
        c.IdCategoria,  -- ID de la categoría
        c.Nombre AS NombreCategoria,
        m.IdMarca,      -- ID de la marca
        m.Nombre AS NombreMarca,
        p.Precio,
        p.StockActual,
        p.StockMinimo,
		p.PorcentajeGanancia
    FROM 
        Productos p
    INNER JOIN Categoria c ON p.IdCategoria = c.IdCategoria
    INNER JOIN Marcas m ON p.IdMarca = m.IdMarca
	WHERE 
        p.Activo = 1; 
END
GO
/****** Object:  StoredProcedure [dbo].[SelProductosPorNombre]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelProductosPorNombre]
    @Nombre NVARCHAR(100)
AS
BEGIN
    SELECT IdProducto, Nombre, IdCategoria, IdMarca, Precio, StockActual, StockMinimo, PorcentajeGanancia
    FROM Productos
    WHERE Nombre LIKE @Nombre AND Activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[SelProductosPorProveedor]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SelProductosPorProveedor]
    @IdProveedor INT
AS
BEGIN
    SELECT 
        p.IdProducto, 
        p.Nombre
    FROM 
        [dbo].[ProductoProveedor] pp
    INNER JOIN 
        [dbo].[Productos] p 
        ON pp.IdProducto = p.IdProducto
    WHERE 
        pp.IdProveedor = @IdProveedor;
END
GO
/****** Object:  StoredProcedure [dbo].[SelProveedores]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelProveedores]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT IdProveedor, Nombre, Detalle, CorreoElectronico, Telefono, Activo
    FROM Proveedores
	WHERE Activo = 1;
END;
GO
/****** Object:  StoredProcedure [dbo].[selProveedorPorId]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[selProveedorPorId]
    @IdProveedor INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT IdProveedor, Nombre, Detalle, CorreoElectronico, Telefono, Activo
    FROM Proveedores
    WHERE IdProveedor = @IdProveedor
	AND Activo = 1;
END;
GO
/****** Object:  StoredProcedure [dbo].[SelReportComprasPorProveedor]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SelReportComprasPorProveedor]
    @FechaInicio DATE,
    @FechaFin DATE,
    @IdProveedor INT = NULL -- Parámetro opcional para filtrar por proveedor
AS
BEGIN
    SELECT 
        c.IdCompra,
        c.FechaCompra,
        p.Nombre AS Proveedor,
        c.TipoPago,
        pp.IdProducto,
        pr.Nombre AS Producto,
        dc.Cantidad,
		dc.PrecioCompra,
        dc.Subtotal
    FROM 
        Compras c
		INNER JOIN 
        DetalleCompra dc ON c.IdCompra = dc.IdCompra
    INNER JOIN 
        ProductoProveedor pp ON c.IdProveedor = pp.IdProveedor
    INNER JOIN 
        Proveedores p ON c.IdProveedor = p.IdProveedor
    INNER JOIN 
        Productos pr ON pp.IdProducto = pr.IdProducto
    WHERE
        c.FechaCompra BETWEEN @FechaInicio AND @FechaFin
        AND (@IdProveedor IS NULL OR c.IdProveedor = @IdProveedor) 
    ORDER BY
        c.FechaCompra;
END
GO
/****** Object:  StoredProcedure [dbo].[SelReportVentasPorCliente]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelReportVentasPorCliente]
    @FechaInicio DATE,
    @FechaFin DATE,
    @IdCliente INT = NULL -- Parámetro opcional
AS
BEGIN
    SELECT 
        v.IdVenta,
        v.Fecha,
        c.Nombre AS Cliente,
        v.Total,
        dv.IdProducto,
        p.Nombre AS Producto,
        dv.Cantidad,
        dv.PrecioUnitario,
        dv.Subtotal
    FROM 
        Ventas v
    INNER JOIN 
        DetallesVenta dv ON v.IdVenta = dv.IdVenta
    INNER JOIN 
        Clientes c ON v.IdCliente = c.IdCliente
    INNER JOIN 
        Productos p ON dv.IdProducto = p.IdProducto
    WHERE
        v.Fecha BETWEEN @FechaInicio AND @FechaFin
        AND (@IdCliente IS NULL OR v.IdCliente = @IdCliente) -- Filtro opcional
    ORDER BY
        v.Fecha;
END
GO
/****** Object:  StoredProcedure [dbo].[SelStockProducto]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelStockProducto]
    @IdProducto INT
AS
BEGIN
    SELECT StockActual
    FROM Productos
    WHERE IdProducto = @IdProducto
END
GO
/****** Object:  StoredProcedure [dbo].[SelTotalClientes]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelTotalClientes]
AS
BEGIN
    SELECT COUNT(*) AS TotalClientes
    FROM Clientes;  
END;
GO
/****** Object:  StoredProcedure [dbo].[SelTotalProductos]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelTotalProductos]
AS
BEGIN
    SELECT COUNT(*) AS TotalProductos
    FROM Productos  
    WHERE StockActual > 0;  
END;
GO
/****** Object:  StoredProcedure [dbo].[SelTotalProveedores]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelTotalProveedores]
AS
BEGIN
    SELECT COUNT(*) AS TotalProveedores
    FROM Proveedores 
    WHERE Activo = 1;  
END;
GO
/****** Object:  StoredProcedure [dbo].[SelTotalVentasMes]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelTotalVentasMes]
AS
BEGIN
    SELECT SUM(Total) AS TotalVentas
    FROM Ventas
    WHERE MONTH(Fecha) = MONTH(GETDATE()) AND YEAR(Fecha) = YEAR(GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[SelUltimaVenta]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelUltimaVenta]
AS
BEGIN
    SELECT TOP 1 IdVenta
    FROM Ventas
    ORDER BY IdVenta DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[SelUsuariosCompleto]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelUsuariosCompleto]
AS
BEGIN
    SELECT IdUsuario, Nombre, CorreoElectronico, DNI, Telefono, TipoUsuario, Activo
    FROM USUARIOS
	WHERE Activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[SelVentaPorId]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelVentaPorId]
    @IdVenta INT
AS
BEGIN
    SELECT 
        v.IdVenta,
        v.IdCliente,
        c.Nombre AS NombreCliente,
        v.Fecha,
        v.Total
    FROM 
        Ventas v
    INNER JOIN 
        Clientes c ON v.IdCliente = c.IdCliente
    WHERE 
        v.IdVenta = @IdVenta;
END;
GO
/****** Object:  StoredProcedure [dbo].[SelVentas]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelVentas]
AS
BEGIN
    SELECT V.IdVenta, 
           V.IdCliente, 
           C.Nombre AS NombreCliente, 
           V.Fecha, 
           V.Total
    FROM Ventas V
    INNER JOIN Clientes C ON V.IdCliente = C.IdCliente
	ORDER BY V.IdVenta DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerCategoriaPorId]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerCategoriaPorId]
    @IdCategoria INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        IdCategoria,
        Nombre,
        Activo
    FROM 
        Categoria
    WHERE 
        IdCategoria = @IdCategoria;
END;
GO
/****** Object:  StoredProcedure [dbo].[updCategoria]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updCategoria]
    @IdCategoria INT,
    @Nombre NVARCHAR(100),
    @Activo BIT
AS
BEGIN
    UPDATE Categoria SET Nombre = @Nombre, Activo = @Activo WHERE IdCategoria = @IdCategoria
END
GO
/****** Object:  StoredProcedure [dbo].[updCliente]    Script Date: 13/12/2024 17:24:09 ******/
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
/****** Object:  StoredProcedure [dbo].[updCompra]    Script Date: 13/12/2024 17:24:09 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdMarca]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdMarca]
    @IdMarca INT,
    @Nombre NVARCHAR(255),
    @Activo BIT -- Agregar el parámetro para el estado activo
AS
BEGIN
    UPDATE Marcas
    SET 
        Nombre = @Nombre,
        Activo = @Activo -- Actualizar el estado activo
    WHERE IdMarca = @IdMarca
END
GO
/****** Object:  StoredProcedure [dbo].[updProducto]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updProducto]
    @IdProducto INT,
    @Nombre NVARCHAR(100),
    @IdCategoria INT,
    @IdMarca INT,
    @Precio DECIMAL(18, 2),
    @StockActual INT,
    @StockMinimo INT,
	@PorcentajeGanancia Decimal
	
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Productos
    SET Nombre = @Nombre,
        IdCategoria = @IdCategoria,
        IdMarca = @IdMarca,
        Precio = @Precio,
        StockActual = @StockActual,
        StockMinimo = @StockMinimo,
		PorcentajeGanancia = @PorcentajeGanancia
    WHERE IdProducto = @IdProducto
	AND Activo = 1;
END;
GO
/****** Object:  StoredProcedure [dbo].[updProveedor]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updProveedor]
    @IdProveedor INT,
    @Nombre NVARCHAR(100),
    @Detalle NVARCHAR(200),
    @CorreoElectronico NVARCHAR(100),
    @Telefono NVARCHAR(20),
	@Activo BIT = 1
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Proveedores
    SET Nombre = @Nombre,
        Detalle = @Detalle,
        CorreoElectronico = @CorreoElectronico,
        Telefono = @Telefono,
		Activo = @Activo
    WHERE IdProveedor = @IdProveedor;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdStockProducto]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdStockProducto]
    @IdProducto INT,
    @StockActual INT
AS
BEGIN
    UPDATE Productos
    SET StockActual = @StockActual
    WHERE IdProducto = @IdProducto;
END;
GO
/****** Object:  StoredProcedure [dbo].[updUsuario]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updUsuario]
    @IdUsuario INT,
    @Nombre NVARCHAR(100),
    @CorreoElectronico NVARCHAR(100),
    @DNI INT,
    @Telefono NVARCHAR(15),
    @TipoUsuario INT
	
AS
BEGIN
    UPDATE USUARIOS
    SET Nombre = @Nombre,
        CorreoElectronico = @CorreoElectronico,
        DNI = @DNI,
        Telefono = @Telefono,
        TipoUsuario = @TipoUsuario,
		 Activo = 1
    WHERE IdUsuario = @IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[UpdVenta]    Script Date: 13/12/2024 17:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdVenta]
    @IdVenta INT,
    @IdCliente INT,
    @Fecha DATETIME,
    @Total DECIMAL(18, 2)
AS
BEGIN
    UPDATE Ventas
    SET IdCliente = @IdCliente, Fecha = @Fecha, Total = @Total
    WHERE IdVenta = @IdVenta
END
GO
/****** Object:  StoredProcedure [dbo].[verificarUsuarioExistente]    Script Date: 13/12/2024 17:24:09 ******/
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
    WHERE (DNI = @DNI OR CorreoElectronico = @CorreoElectronico) AND Activo = 1;
    
    SELECT @Existe AS Existe;
END
GO
USE [master]
GO
ALTER DATABASE [PROYECTACOMERCIO] SET  READ_WRITE 
GO
