
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 03/06/2014 22:59:00
-- Generated from EDMX file: F:\Projects - Odesk - Please Dont Touch It\Kanrisha\KanrishaEF\Kanrisha.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Kanrisha];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[Kanrisha].[FK_TB_UserProfile_TB_Role]', 'F') IS NOT NULL
    ALTER TABLE [Kanrisha].[TB_UserProfile] DROP CONSTRAINT [FK_TB_UserProfile_TB_Role];
GO
IF OBJECT_ID(N'[Kanrisha].[FK_TB_UserProfile_TB_User]', 'F') IS NOT NULL
    ALTER TABLE [Kanrisha].[TB_UserProfile] DROP CONSTRAINT [FK_TB_UserProfile_TB_User];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[Kanrisha].[TB_Role]', 'U') IS NOT NULL
    DROP TABLE [Kanrisha].[TB_Role];
GO
IF OBJECT_ID(N'[Kanrisha].[TB_User]', 'U') IS NOT NULL
    DROP TABLE [Kanrisha].[TB_User];
GO
IF OBJECT_ID(N'[Kanrisha].[TB_UserProfile]', 'U') IS NOT NULL
    DROP TABLE [Kanrisha].[TB_UserProfile];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'TB_Role'
CREATE TABLE [dbo].[TB_Role] (
    [RoleId] int IDENTITY(1,1) NOT NULL,
    [Role] varchar(50)  NULL
);
GO

-- Creating table 'TB_User'
CREATE TABLE [dbo].[TB_User] (
    [UserID] int IDENTITY(1,1) NOT NULL,
    [UserName] varchar(50)  NOT NULL,
    [Password] varchar(50)  NOT NULL,
    [Active] varchar(50)  NOT NULL,
    [FirstLogin] varchar(5)  NULL
);
GO

-- Creating table 'TB_UserProfile'
CREATE TABLE [dbo].[TB_UserProfile] (
    [ProfileId] int IDENTITY(1,1) NOT NULL,
    [FirstName] varchar(50)  NULL,
    [LastName] varchar(50)  NULL,
    [CreatedDate] datetime  NULL,
    [ModifiedDate] datetime  NULL,
    [UserId] int  NULL,
    [RoleId] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [RoleId] in table 'TB_Role'
ALTER TABLE [dbo].[TB_Role]
ADD CONSTRAINT [PK_TB_Role]
    PRIMARY KEY CLUSTERED ([RoleId] ASC);
GO

-- Creating primary key on [UserID] in table 'TB_User'
ALTER TABLE [dbo].[TB_User]
ADD CONSTRAINT [PK_TB_User]
    PRIMARY KEY CLUSTERED ([UserID] ASC);
GO

-- Creating primary key on [ProfileId] in table 'TB_UserProfile'
ALTER TABLE [dbo].[TB_UserProfile]
ADD CONSTRAINT [PK_TB_UserProfile]
    PRIMARY KEY CLUSTERED ([ProfileId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [RoleId] in table 'TB_UserProfile'
ALTER TABLE [dbo].[TB_UserProfile]
ADD CONSTRAINT [FK_TB_UserProfile_TB_Role]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[TB_Role]
        ([RoleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_UserProfile_TB_Role'
CREATE INDEX [IX_FK_TB_UserProfile_TB_Role]
ON [dbo].[TB_UserProfile]
    ([RoleId]);
GO

-- Creating foreign key on [UserId] in table 'TB_UserProfile'
ALTER TABLE [dbo].[TB_UserProfile]
ADD CONSTRAINT [FK_TB_UserProfile_TB_User]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[TB_User]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_UserProfile_TB_User'
CREATE INDEX [IX_FK_TB_UserProfile_TB_User]
ON [dbo].[TB_UserProfile]
    ([UserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------