
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/12/2017 14:29:53
-- Generated from EDMX file: C:\Users\DL-CDI\Dropbox\AFPA2\74.EntityFrameWorkCouchepersistance\5.Exo9MVCDLL\ClassesDAO\Formation.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [STAGE2];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'StagiairesSet'
CREATE TABLE [dbo].[StagiairesSet] (
    [NumOsia] int  NOT NULL,
    [NomStagiaire] nvarchar(20)  NOT NULL,
    [PrenomStagiaire] nvarchar(20)  NOT NULL,
    [rueStagiaire] nvarchar(20)  NOT NULL,
    [VilleStagiaire] nvarchar(20)  NOT NULL,
    [CodePostalStagiaire] nchar(5)  NOT NULL,
    [NbreNote] int  NULL,
    [PointsNotes] float  NOT NULL,
    [Sections_IdSection] int  NOT NULL
);
GO

-- Creating table 'SectionsSet'
CREATE TABLE [dbo].[SectionsSet] (
    [IdSection] int IDENTITY(1,1) NOT NULL,
    [NomSection] nvarchar(max)  NOT NULL,
    [CodeSection] nvarchar(max)  NOT NULL,
    [DateDebut] nvarchar(max)  NOT NULL,
    [DateFin] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'StagiairesSet_StagiaireCIF'
CREATE TABLE [dbo].[StagiairesSet_StagiaireCIF] (
    [TypeCIF] nvarchar(20)  NOT NULL,
    [Fongecif] nvarchar(20)  NOT NULL,
    [NumOsia] int  NOT NULL
);
GO

-- Creating table 'StagiairesSet_StagiaireDE'
CREATE TABLE [dbo].[StagiairesSet_StagiaireDE] (
    [RemuAfpa] bit  NOT NULL,
    [NumOsia] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [NumOsia] in table 'StagiairesSet'
ALTER TABLE [dbo].[StagiairesSet]
ADD CONSTRAINT [PK_StagiairesSet]
    PRIMARY KEY CLUSTERED ([NumOsia] ASC);
GO

-- Creating primary key on [IdSection] in table 'SectionsSet'
ALTER TABLE [dbo].[SectionsSet]
ADD CONSTRAINT [PK_SectionsSet]
    PRIMARY KEY CLUSTERED ([IdSection] ASC);
GO

-- Creating primary key on [NumOsia] in table 'StagiairesSet_StagiaireCIF'
ALTER TABLE [dbo].[StagiairesSet_StagiaireCIF]
ADD CONSTRAINT [PK_StagiairesSet_StagiaireCIF]
    PRIMARY KEY CLUSTERED ([NumOsia] ASC);
GO

-- Creating primary key on [NumOsia] in table 'StagiairesSet_StagiaireDE'
ALTER TABLE [dbo].[StagiairesSet_StagiaireDE]
ADD CONSTRAINT [PK_StagiairesSet_StagiaireDE]
    PRIMARY KEY CLUSTERED ([NumOsia] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Sections_IdSection] in table 'StagiairesSet'
ALTER TABLE [dbo].[StagiairesSet]
ADD CONSTRAINT [FK_SectionsStagiaires]
    FOREIGN KEY ([Sections_IdSection])
    REFERENCES [dbo].[SectionsSet]
        ([IdSection])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SectionsStagiaires'
CREATE INDEX [IX_FK_SectionsStagiaires]
ON [dbo].[StagiairesSet]
    ([Sections_IdSection]);
GO

-- Creating foreign key on [NumOsia] in table 'StagiairesSet_StagiaireCIF'
ALTER TABLE [dbo].[StagiairesSet_StagiaireCIF]
ADD CONSTRAINT [FK_StagiaireCIF_inherits_Stagiaires]
    FOREIGN KEY ([NumOsia])
    REFERENCES [dbo].[StagiairesSet]
        ([NumOsia])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [NumOsia] in table 'StagiairesSet_StagiaireDE'
ALTER TABLE [dbo].[StagiairesSet_StagiaireDE]
ADD CONSTRAINT [FK_StagiaireDE_inherits_Stagiaires]
    FOREIGN KEY ([NumOsia])
    REFERENCES [dbo].[StagiairesSet]
        ([NumOsia])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------