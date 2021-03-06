USE [master]
GO
/****** Object:  Database [StoreManagement]    Script Date: 12/07/2018 7:22:40 p.m. ******/
CREATE DATABASE [StoreManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Store', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Store.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Store_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Store_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [StoreManagement] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StoreManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StoreManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StoreManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StoreManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StoreManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StoreManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [StoreManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StoreManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StoreManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StoreManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StoreManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StoreManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StoreManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StoreManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StoreManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StoreManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StoreManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StoreManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StoreManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StoreManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StoreManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StoreManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StoreManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StoreManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [StoreManagement] SET  MULTI_USER 
GO
ALTER DATABASE [StoreManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StoreManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StoreManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StoreManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StoreManagement] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StoreManagement', N'ON'
GO
ALTER DATABASE [StoreManagement] SET QUERY_STORE = OFF
GO
USE [StoreManagement]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [StoreManagement]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/07/2018 7:22:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/07/2018 7:23:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSold]    Script Date: 12/07/2018 7:23:13 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSold](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[CustomerId] [int] NULL,
	[StoreId] [int] NULL,
	[DateSold] [datetime] NULL,
 CONSTRAINT [PK_ProductSold] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 12/07/2018 7:23:14 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductSold]  WITH CHECK ADD  CONSTRAINT [FK_ProductSold_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductSold] CHECK CONSTRAINT [FK_ProductSold_Customer]
GO
ALTER TABLE [dbo].[ProductSold]  WITH CHECK ADD  CONSTRAINT [FK_ProductSold_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductSold] CHECK CONSTRAINT [FK_ProductSold_Product]
GO
ALTER TABLE [dbo].[ProductSold]  WITH CHECK ADD  CONSTRAINT [FK_ProductSold_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductSold] CHECK CONSTRAINT [FK_ProductSold_Store]
GO
USE [master]
GO
ALTER DATABASE [StoreManagement] SET  READ_WRITE 
GO
