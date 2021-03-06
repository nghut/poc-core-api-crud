USE [master]
GO
/****** Object:  Database [Company]    Script Date: 8/22/2020 9:59:04 PM ******/
CREATE DATABASE [Company]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Python', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER_2016\MSSQL\DATA\Python.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Python_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER_2016\MSSQL\DATA\Python_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Company] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Company].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Company] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Company] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Company] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Company] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Company] SET ARITHABORT OFF 
GO
ALTER DATABASE [Company] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Company] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Company] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Company] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Company] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Company] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Company] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Company] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Company] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Company] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Company] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Company] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Company] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Company] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Company] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Company] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Company] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Company] SET RECOVERY FULL 
GO
ALTER DATABASE [Company] SET  MULTI_USER 
GO
ALTER DATABASE [Company] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Company] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Company] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Company] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Company] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Company', N'ON'
GO
ALTER DATABASE [Company] SET QUERY_STORE = OFF
GO
USE [Company]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Company]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 8/22/2020 9:59:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [varchar](100) NULL,
	[Age] [int] NULL,
	[DateOfBirth] [date] NULL,
	[EmailID] [varchar](100) NULL,
	[MobileNumber] [bigint] NULL,
	[Address] [varchar](150) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedDateTime] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Age], [DateOfBirth], [EmailID], [MobileNumber], [Address], [City], [State], [IsActive], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy]) VALUES (10, N'Naveen', 28, NULL, N'naveen@gmail.com', 8549819815, N'NO 2, 5th Cross st', N'Vellore', N'TamilNadu', 1, CAST(N'2020-08-22T15:47:00.830' AS DateTime), N'User', NULL, NULL)
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Age], [DateOfBirth], [EmailID], [MobileNumber], [Address], [City], [State], [IsActive], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy]) VALUES (11, N'Prakash', 31, NULL, N'prakash@gmail.com', 4984456984, N'Richie st', N'Vlr', N'TN', 1, CAST(N'2020-08-22T15:55:38.797' AS DateTime), N'User', NULL, NULL)
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [Age], [DateOfBirth], [EmailID], [MobileNumber], [Address], [City], [State], [IsActive], [CreatedDateTime], [CreatedBy], [ModifiedDateTime], [ModifiedBy]) VALUES (12, N'Vino', 31, NULL, N'Vino@gmail.com', 4984456984, N'Richie st', N'Vlr', N'TN', 1, CAST(N'2020-08-22T16:12:42.633' AS DateTime), N'User', CAST(N'2020-08-22T16:25:23.877' AS DateTime), N'User')
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
USE [master]
GO
ALTER DATABASE [Company] SET  READ_WRITE 
GO
