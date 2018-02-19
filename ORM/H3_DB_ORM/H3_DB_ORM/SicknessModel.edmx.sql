
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/19/2018 09:06:33
-- Generated from EDMX file: C:\Users\Birdface\source\repos\H3_DB_ORM\H3_DB_ORM\SicknessModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DB_Sickness];
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

-- Creating table 'Tbl_Sickness'
CREATE TABLE [dbo].[Tbl_Sickness] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Avr_Dur] nvarchar(max)  NOT NULL,
    [Leathality] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Tbl_Symptoms'
CREATE TABLE [dbo].[Tbl_Symptoms] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Effect] nvarchar(max)  NOT NULL,
    [Tbl_MedicationId] int  NOT NULL,
    [Tbl_Sickness_Id] int  NOT NULL
);
GO

-- Creating table 'Tbl_Treatment'
CREATE TABLE [dbo].[Tbl_Treatment] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Medication] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Tbl_SicknessId] int  NOT NULL
);
GO

-- Creating table 'Tbl_Medication'
CREATE TABLE [dbo].[Tbl_Medication] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Tbl_TreatmentId] int  NOT NULL
);
GO

-- Creating table 'Tbl_Effects'
CREATE TABLE [dbo].[Tbl_Effects] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Effect] nvarchar(max)  NOT NULL,
    [Tbl_MedicationId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Tbl_Sickness'
ALTER TABLE [dbo].[Tbl_Sickness]
ADD CONSTRAINT [PK_Tbl_Sickness]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Tbl_Symptoms'
ALTER TABLE [dbo].[Tbl_Symptoms]
ADD CONSTRAINT [PK_Tbl_Symptoms]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Tbl_Treatment'
ALTER TABLE [dbo].[Tbl_Treatment]
ADD CONSTRAINT [PK_Tbl_Treatment]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Tbl_Medication'
ALTER TABLE [dbo].[Tbl_Medication]
ADD CONSTRAINT [PK_Tbl_Medication]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Tbl_Effects'
ALTER TABLE [dbo].[Tbl_Effects]
ADD CONSTRAINT [PK_Tbl_Effects]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Tbl_Sickness_Id] in table 'Tbl_Symptoms'
ALTER TABLE [dbo].[Tbl_Symptoms]
ADD CONSTRAINT [FK_Tbl_SicknessTbl_Symptoms]
    FOREIGN KEY ([Tbl_Sickness_Id])
    REFERENCES [dbo].[Tbl_Sickness]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Tbl_SicknessTbl_Symptoms'
CREATE INDEX [IX_FK_Tbl_SicknessTbl_Symptoms]
ON [dbo].[Tbl_Symptoms]
    ([Tbl_Sickness_Id]);
GO

-- Creating foreign key on [Tbl_SicknessId] in table 'Tbl_Treatment'
ALTER TABLE [dbo].[Tbl_Treatment]
ADD CONSTRAINT [FK_Tbl_SicknessTbl_Treatment]
    FOREIGN KEY ([Tbl_SicknessId])
    REFERENCES [dbo].[Tbl_Sickness]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Tbl_SicknessTbl_Treatment'
CREATE INDEX [IX_FK_Tbl_SicknessTbl_Treatment]
ON [dbo].[Tbl_Treatment]
    ([Tbl_SicknessId]);
GO

-- Creating foreign key on [Tbl_TreatmentId] in table 'Tbl_Medication'
ALTER TABLE [dbo].[Tbl_Medication]
ADD CONSTRAINT [FK_Tbl_TreatmentTbl_Medication]
    FOREIGN KEY ([Tbl_TreatmentId])
    REFERENCES [dbo].[Tbl_Treatment]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Tbl_TreatmentTbl_Medication'
CREATE INDEX [IX_FK_Tbl_TreatmentTbl_Medication]
ON [dbo].[Tbl_Medication]
    ([Tbl_TreatmentId]);
GO

-- Creating foreign key on [Tbl_MedicationId] in table 'Tbl_Effects'
ALTER TABLE [dbo].[Tbl_Effects]
ADD CONSTRAINT [FK_Tbl_MedicationTbl_Effects]
    FOREIGN KEY ([Tbl_MedicationId])
    REFERENCES [dbo].[Tbl_Medication]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Tbl_MedicationTbl_Effects'
CREATE INDEX [IX_FK_Tbl_MedicationTbl_Effects]
ON [dbo].[Tbl_Effects]
    ([Tbl_MedicationId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------