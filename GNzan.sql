USE [master]
GO
/****** Object:  Database [GrupoNazan]    Script Date: 18/06/2025 05:35:40 p. m. ******/
CREATE DATABASE [GrupoNazan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GrupoNazan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GrupoNazan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GrupoNazan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GrupoNazan_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GrupoNazan] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GrupoNazan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GrupoNazan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GrupoNazan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GrupoNazan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GrupoNazan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GrupoNazan] SET ARITHABORT OFF 
GO
ALTER DATABASE [GrupoNazan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GrupoNazan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GrupoNazan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GrupoNazan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GrupoNazan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GrupoNazan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GrupoNazan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GrupoNazan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GrupoNazan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GrupoNazan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GrupoNazan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GrupoNazan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GrupoNazan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GrupoNazan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GrupoNazan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GrupoNazan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GrupoNazan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GrupoNazan] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GrupoNazan] SET  MULTI_USER 
GO
ALTER DATABASE [GrupoNazan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GrupoNazan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GrupoNazan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GrupoNazan] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GrupoNazan] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GrupoNazan] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GrupoNazan] SET QUERY_STORE = OFF
GO
USE [GrupoNazan]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 18/06/2025 05:35:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[Empleado_Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[APaterno] [varchar](50) NOT NULL,
	[AMaterno] [varchar](50) NOT NULL,
	[Puesto_Id] [int] NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[Empleado_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maestra]    Script Date: 18/06/2025 05:35:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maestra](
	[Empleado_Id] [int] NOT NULL,
	[Puesto_Id] [int] NOT NULL,
	[Salario_Id] [int] NOT NULL,
 CONSTRAINT [PK_Maestra] PRIMARY KEY CLUSTERED 
(
	[Empleado_Id] ASC,
	[Puesto_Id] ASC,
	[Salario_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 18/06/2025 05:35:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puesto](
	[Puesto_Id] [int] IDENTITY(1,1) NOT NULL,
	[NombrePuesto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Puesto] PRIMARY KEY CLUSTERED 
(
	[Puesto_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salario]    Script Date: 18/06/2025 05:35:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salario](
	[Salario_Id] [int] IDENTITY(1,1) NOT NULL,
	[Puesto_Id] [int] NOT NULL,
	[Monto_Diario] [money] NOT NULL,
 CONSTRAINT [PK_Salario] PRIMARY KEY CLUSTERED 
(
	[Salario_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([Empleado_Id], [Nombre], [APaterno], [AMaterno], [Puesto_Id]) VALUES (1, N'Ramses', N'Ocampo', N'Moreno', 2)
INSERT [dbo].[Empleado] ([Empleado_Id], [Nombre], [APaterno], [AMaterno], [Puesto_Id]) VALUES (2, N'Alejandro', N'Lopez', N'Perez', 3)
SET IDENTITY_INSERT [dbo].[Empleado] OFF
GO
SET IDENTITY_INSERT [dbo].[Puesto] ON 

INSERT [dbo].[Puesto] ([Puesto_Id], [NombrePuesto]) VALUES (1, N'Director')
INSERT [dbo].[Puesto] ([Puesto_Id], [NombrePuesto]) VALUES (2, N'Gerente')
INSERT [dbo].[Puesto] ([Puesto_Id], [NombrePuesto]) VALUES (3, N'Empleado')
SET IDENTITY_INSERT [dbo].[Puesto] OFF
GO
SET IDENTITY_INSERT [dbo].[Salario] ON 

INSERT [dbo].[Salario] ([Salario_Id], [Puesto_Id], [Monto_Diario]) VALUES (1, 1, 3000.0000)
INSERT [dbo].[Salario] ([Salario_Id], [Puesto_Id], [Monto_Diario]) VALUES (2, 2, 2000.0000)
INSERT [dbo].[Salario] ([Salario_Id], [Puesto_Id], [Monto_Diario]) VALUES (3, 3, 1500.0000)
SET IDENTITY_INSERT [dbo].[Salario] OFF
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Puesto] FOREIGN KEY([Puesto_Id])
REFERENCES [dbo].[Puesto] ([Puesto_Id])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Puesto]
GO
ALTER TABLE [dbo].[Maestra]  WITH CHECK ADD  CONSTRAINT [FK_Maestra_Empleado] FOREIGN KEY([Empleado_Id])
REFERENCES [dbo].[Empleado] ([Empleado_Id])
GO
ALTER TABLE [dbo].[Maestra] CHECK CONSTRAINT [FK_Maestra_Empleado]
GO
ALTER TABLE [dbo].[Maestra]  WITH CHECK ADD  CONSTRAINT [FK_Maestra_Puesto] FOREIGN KEY([Puesto_Id])
REFERENCES [dbo].[Puesto] ([Puesto_Id])
GO
ALTER TABLE [dbo].[Maestra] CHECK CONSTRAINT [FK_Maestra_Puesto]
GO
ALTER TABLE [dbo].[Maestra]  WITH CHECK ADD  CONSTRAINT [FK_Maestra_Salario] FOREIGN KEY([Salario_Id])
REFERENCES [dbo].[Salario] ([Salario_Id])
GO
ALTER TABLE [dbo].[Maestra] CHECK CONSTRAINT [FK_Maestra_Salario]
GO
ALTER TABLE [dbo].[Salario]  WITH CHECK ADD  CONSTRAINT [FK_Salario_Puesto] FOREIGN KEY([Puesto_Id])
REFERENCES [dbo].[Puesto] ([Puesto_Id])
GO
ALTER TABLE [dbo].[Salario] CHECK CONSTRAINT [FK_Salario_Puesto]
GO
/****** Object:  StoredProcedure [dbo].[stp_ActualizarPuestoEmpleado]    Script Date: 18/06/2025 05:35:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[stp_ActualizarPuestoEmpleado]
	@Empleado_Id INT,
	@Puesto_Id INT
AS
BEGIN

	UPDATE Empleado
	SET Puesto_Id = @Puesto_Id
	WHERE Empleado_Id = @Empleado_Id

END
GO
/****** Object:  StoredProcedure [dbo].[stp_ConsultaCuestionarioTecnico]    Script Date: 18/06/2025 05:35:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[stp_ConsultaCuestionarioTecnico] 
	
AS
BEGIN
	
	SELECT Nombre, NombrePuesto, Monto_Diario AS Salario_Diario, (Monto_Diario * 30) AS Salario_Mensual
	FROM Empleado AS Emp
	INNER JOIN Puesto AS Pue ON Emp.Puesto_Id = Pue.Puesto_Id
	INNER JOIN Salario AS Sal ON Emp.Puesto_Id = Sal.Puesto_Id

END
GO
/****** Object:  StoredProcedure [dbo].[stp_ConsultarEmpleadoPorId]    Script Date: 18/06/2025 05:35:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[stp_ConsultarEmpleadoPorId]
	@Empleado_Id INT
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT
		e.Empleado_Id,
		e.Nombre,
		e.APaterno,
		e.AMaterno,
		e.Puesto_Id,
		p.NombrePuesto
		FROM Empleado e
		INNER JOIN Puesto p ON e.Puesto_Id = p.Puesto_Id
		WHERE Empleado_Id = @Empleado_Id

END
GO
/****** Object:  StoredProcedure [dbo].[stp_ConsultarSueldoMensualEmpleado]    Script Date: 18/06/2025 05:35:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[stp_ConsultarSueldoMensualEmpleado]
	@Empleado_Id INT
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT
		s.Monto_Diario * 30 AS SueldoMensual
	FROM Empleado e
	INNER JOIN Salario s ON e.Puesto_Id = s.Puesto_Id
	WHERE e.Empleado_Id = @Empleado_Id

END
GO
/****** Object:  StoredProcedure [dbo].[stp_InsertarEmpleado]    Script Date: 18/06/2025 05:35:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[stp_InsertarEmpleado]
	@Nombre VARCHAR(50),
	@APaterno VARCHAR(50),
	@AMaterno VARCHAR(50),
	@Puesto_Id INT,
	@Empleado_Id INT OUTPUT
AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT INTO Empleado (Nombre, APaterno, AMaterno, Puesto_Id)
	VALUES (@Nombre, @APaterno, @AMaterno, @Puesto_Id)

	SET @Empleado_Id = SCOPE_IDENTITY()

END
GO
USE [master]
GO
ALTER DATABASE [GrupoNazan] SET  READ_WRITE 
GO
