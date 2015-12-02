USE [master]
GO
/****** Object:  Database [EDCFootball]    Script Date: 02/12/15 10:28:59 ******/
CREATE DATABASE [EDCFootball]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EDCFootball', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\EDCFootball.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EDCFootball_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\EDCFootball_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EDCFootball] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EDCFootball].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EDCFootball] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EDCFootball] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EDCFootball] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EDCFootball] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EDCFootball] SET ARITHABORT OFF 
GO
ALTER DATABASE [EDCFootball] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EDCFootball] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [EDCFootball] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EDCFootball] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EDCFootball] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EDCFootball] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EDCFootball] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EDCFootball] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EDCFootball] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EDCFootball] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EDCFootball] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EDCFootball] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EDCFootball] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EDCFootball] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EDCFootball] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EDCFootball] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EDCFootball] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EDCFootball] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EDCFootball] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EDCFootball] SET  MULTI_USER 
GO
ALTER DATABASE [EDCFootball] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EDCFootball] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EDCFootball] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EDCFootball] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [EDCFootball]
GO
/****** Object:  Schema [football]    Script Date: 02/12/15 10:28:59 ******/
CREATE SCHEMA [football]
GO
/****** Object:  Table [football].[player]    Script Date: 02/12/15 10:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [football].[player](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [text] NULL,
	[position] [text] NULL,
	[jerseyNumber] [int] NULL,
	[dateOfBirth] [text] NULL,
	[nationality] [text] NULL,
	[contractUntil] [text] NULL,
	[marketValue] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [football].[season]    Script Date: 02/12/15 10:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [football].[season](
	[id] [int] NOT NULL,
	[link_fixtures_href] [text] NULL,
	[link_leagueTable_href] [text] NULL,
	[link_self_href] [text] NULL,
	[link_teams_href] [text] NULL,
	[caption] [text] NULL,
	[last_updated] [text] NULL,
	[league] [text] NULL,
	[numberOfGames] [int] NULL,
	[numberOfTeams] [int] NULL,
	[seasonYear] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [football].[team]    Script Date: 02/12/15 10:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [football].[team](
	[id] [int] NOT NULL,
	[link_fixtures_href] [text] NULL,
	[link_players_href] [text] NULL,
	[link_self_href] [text] NULL,
	[name] [text] NULL,
	[code] [text] NULL,
	[shortName] [text] NULL,
	[squadMarketValue] [text] NULL,
	[crestURL] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [football].[teamplayer]    Script Date: 02/12/15 10:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [football].[teamplayer](
	[playerID] [int] NULL,
	[seasonID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [football].[teamSeason]    Script Date: 02/12/15 10:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [football].[teamSeason](
	[seasonID] [int] NULL,
	[teamID] [int] NULL
) ON [PRIMARY]

GO
ALTER TABLE [football].[teamplayer]  WITH CHECK ADD FOREIGN KEY([playerID])
REFERENCES [football].[player] ([id])
GO
ALTER TABLE [football].[teamplayer]  WITH CHECK ADD FOREIGN KEY([seasonID])
REFERENCES [football].[season] ([id])
GO
ALTER TABLE [football].[teamSeason]  WITH CHECK ADD FOREIGN KEY([seasonID])
REFERENCES [football].[season] ([id])
GO
ALTER TABLE [football].[teamSeason]  WITH CHECK ADD FOREIGN KEY([teamID])
REFERENCES [football].[team] ([id])
GO
USE [master]
GO
ALTER DATABASE [EDCFootball] SET  READ_WRITE 
GO
