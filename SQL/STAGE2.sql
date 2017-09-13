USE [master]
GO
/****** Object:  Database [STAGE2]    Script Date: 12/09/2017 16:36:29 ******/
CREATE DATABASE [STAGE2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'STAGE2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\STAGE2.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'STAGE2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\STAGE2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [STAGE2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [STAGE2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [STAGE2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [STAGE2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [STAGE2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [STAGE2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [STAGE2] SET ARITHABORT OFF 
GO
ALTER DATABASE [STAGE2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [STAGE2] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [STAGE2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [STAGE2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [STAGE2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [STAGE2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [STAGE2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [STAGE2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [STAGE2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [STAGE2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [STAGE2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [STAGE2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [STAGE2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [STAGE2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [STAGE2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [STAGE2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [STAGE2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [STAGE2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [STAGE2] SET RECOVERY FULL 
GO
ALTER DATABASE [STAGE2] SET  MULTI_USER 
GO
ALTER DATABASE [STAGE2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [STAGE2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [STAGE2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [STAGE2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'STAGE2', N'ON'
GO
USE [STAGE2]
GO
/****** Object:  User [BIP7\CDI14]    Script Date: 12/09/2017 16:36:30 ******/
CREATE USER [BIP7\CDI14] FOR LOGIN [BIP7\CDI14] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [BIP7\CDI14]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [BIP7\CDI14]
GO
/****** Object:  Table [dbo].[SectionsSet]    Script Date: 12/09/2017 16:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionsSet](
	[IdSection] [int] IDENTITY(1,1) NOT NULL,
	[NomSection] [nvarchar](max) NOT NULL,
	[CodeSection] [nvarchar](max) NOT NULL,
	[DateDebut] [nvarchar](max) NOT NULL,
	[DateFin] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SectionsSet] PRIMARY KEY CLUSTERED 
(
	[IdSection] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StagiairesSet]    Script Date: 12/09/2017 16:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StagiairesSet](
	[NumOsia] [int] NOT NULL,
	[NomStagiaire] [nvarchar](20) NOT NULL,
	[PrenomStagiaire] [nvarchar](20) NOT NULL,
	[rueStagiaire] [nvarchar](20) NOT NULL,
	[VilleStagiaire] [nvarchar](20) NOT NULL,
	[CodePostalStagiaire] [nchar](5) NOT NULL,
	[NbreNote] [int] NULL,
	[PointsNotes] [float] NOT NULL,
	[Sections_IdSection] [int] NOT NULL,
 CONSTRAINT [PK_StagiairesSet] PRIMARY KEY CLUSTERED 
(
	[NumOsia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StagiairesSet_StagiaireCIF]    Script Date: 12/09/2017 16:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StagiairesSet_StagiaireCIF](
	[TypeCIF] [nvarchar](20) NOT NULL,
	[Fongecif] [nvarchar](20) NOT NULL,
	[NumOsia] [int] NOT NULL,
 CONSTRAINT [PK_StagiairesSet_StagiaireCIF] PRIMARY KEY CLUSTERED 
(
	[NumOsia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StagiairesSet_StagiaireDE]    Script Date: 12/09/2017 16:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StagiairesSet_StagiaireDE](
	[RemuAfpa] [bit] NOT NULL,
	[NumOsia] [int] NOT NULL,
 CONSTRAINT [PK_StagiairesSet_StagiaireDE] PRIMARY KEY CLUSTERED 
(
	[NumOsia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_FK_SectionsStagiaires]    Script Date: 12/09/2017 16:36:30 ******/
CREATE NONCLUSTERED INDEX [IX_FK_SectionsStagiaires] ON [dbo].[StagiairesSet]
(
	[Sections_IdSection] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StagiairesSet]  WITH CHECK ADD  CONSTRAINT [FK_SectionsStagiaires] FOREIGN KEY([Sections_IdSection])
REFERENCES [dbo].[SectionsSet] ([IdSection])
GO
ALTER TABLE [dbo].[StagiairesSet] CHECK CONSTRAINT [FK_SectionsStagiaires]
GO
ALTER TABLE [dbo].[StagiairesSet_StagiaireCIF]  WITH CHECK ADD  CONSTRAINT [FK_StagiaireCIF_inherits_Stagiaires] FOREIGN KEY([NumOsia])
REFERENCES [dbo].[StagiairesSet] ([NumOsia])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StagiairesSet_StagiaireCIF] CHECK CONSTRAINT [FK_StagiaireCIF_inherits_Stagiaires]
GO
ALTER TABLE [dbo].[StagiairesSet_StagiaireDE]  WITH CHECK ADD  CONSTRAINT [FK_StagiaireDE_inherits_Stagiaires] FOREIGN KEY([NumOsia])
REFERENCES [dbo].[StagiairesSet] ([NumOsia])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StagiairesSet_StagiaireDE] CHECK CONSTRAINT [FK_StagiaireDE_inherits_Stagiaires]
GO
USE [master]
GO
ALTER DATABASE [STAGE2] SET  READ_WRITE 
GO
