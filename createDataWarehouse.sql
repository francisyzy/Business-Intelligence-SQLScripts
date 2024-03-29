USE [master]
GO
/****** Object:  Database [BI_CA1_DW]    Script Date: 11/29/2017 12:18:18 PM ******/
CREATE DATABASE [BI_CA1_DW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BI_CA1_DW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BI_CA1_DW.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BI_CA1_DW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BI_CA1_DW_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BI_CA1_DW] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BI_CA1_DW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BI_CA1_DW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BI_CA1_DW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BI_CA1_DW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BI_CA1_DW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BI_CA1_DW] SET ARITHABORT OFF 
GO
ALTER DATABASE [BI_CA1_DW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BI_CA1_DW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BI_CA1_DW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BI_CA1_DW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BI_CA1_DW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BI_CA1_DW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BI_CA1_DW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BI_CA1_DW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BI_CA1_DW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BI_CA1_DW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BI_CA1_DW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BI_CA1_DW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BI_CA1_DW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BI_CA1_DW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BI_CA1_DW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BI_CA1_DW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BI_CA1_DW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BI_CA1_DW] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BI_CA1_DW] SET  MULTI_USER 
GO
ALTER DATABASE [BI_CA1_DW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BI_CA1_DW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BI_CA1_DW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BI_CA1_DW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BI_CA1_DW] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BI_CA1_DW] SET QUERY_STORE = OFF
GO
USE [BI_CA1_DW]
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
USE [BI_CA1_DW]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/29/2017 12:18:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerNumber] [int] NOT NULL,
	[contactFirstName] [nvarchar](50) NULL,
	[contactLastName] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[addressLine1] [nvarchar](50) NULL,
	[addressLine2] [nvarchar](50) NULL,
	[postalCode] [nvarchar](15) NULL,
	[city] [nvarchar](50) NULL,
	[state] [nvarchar](50) NULL,
	[country] [nvarchar](50) NULL,
	[creditLimit] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customerNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11/29/2017 12:18:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[employeeNumber] [int] NOT NULL,
	[firstName] [nvarchar](50) NULL,
	[lastName] [nvarchar](50) NULL,
	[jobTitle] [nvarchar](50) NULL,
	[extension] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[reportsTo] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[employeeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Office]    Script Date: 11/29/2017 12:18:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Office](
	[officeCode] [nvarchar](10) NOT NULL,
	[city] [nvarchar](50) NULL,
	[state] [nvarchar](50) NULL,
	[country] [nvarchar](50) NULL,
	[territory] [nvarchar](50) NULL,
 CONSTRAINT [PK_Offices] PRIMARY KEY CLUSTERED 
(
	[officeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/29/2017 12:18:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productCode] [nvarchar](15) NOT NULL,
	[productName] [nvarchar](70) NULL,
	[productScale] [nvarchar](10) NULL,
	[productVendor] [nvarchar](50) NULL,
	[productLine] [nvarchar](50) NULL,
	[quantityInStock] [int] NULL,
	[buyPrice] [decimal](10, 2) NULL,
	[msrp] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesFact]    Script Date: 11/29/2017 12:18:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesFact](
	[customerNumber] [int] NOT NULL,
	[orderNumber] [int] NOT NULL,
	[productCode] [nvarchar](15) NOT NULL,
	[orderTimeKey] [int] NOT NULL,
	[requiredTimeKey] [int] NOT NULL,
	[shippedTimeKey] [int] NOT NULL,
	[employeeNumber] [int] NOT NULL,
	[officeCode] [nvarchar](10) NOT NULL,
	[quantityOrdered] [int] NOT NULL,
	[priceEach] [decimal](10, 2) NOT NULL,
	[status] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customerNumber] ASC,
	[orderNumber] ASC,
	[productCode] ASC,
	[orderTimeKey] ASC,
	[requiredTimeKey] ASC,
	[shippedTimeKey] ASC,
	[employeeNumber] ASC,
	[officeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Time]    Script Date: 11/29/2017 12:18:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time](
		[TimeKey] INT , 
		[Date] DATETIME,
		[FullDateUK] CHAR(10), -- Date in dd-MM-yyyy format
		[FullDateUSA] CHAR(10),-- Date in MM-dd-yyyy format
		[DayOfMonth] VARCHAR(2), -- Field will hold day number of Month
		[DaySuffix] VARCHAR(4), -- Apply suffix as 1st, 2nd ,3rd etc
		[DayName] VARCHAR(9), -- Contains name of the day, Sunday, Monday 
		[DayOfWeekUSA] CHAR(1),-- First Day Sunday=1 and Saturday=7
		[DayOfWeekUK] CHAR(1),-- First Day Monday=1 and Sunday=7
		[DayOfWeekInMonth] VARCHAR(2), --1st Monday or 2nd Monday in Month
		[DayOfWeekInYear] VARCHAR(2),
		[DayOfQuarter] VARCHAR(3),
		[DayOfYear] VARCHAR(3),
		[WeekOfMonth] VARCHAR(1),-- Week Number of Month 
		[WeekOfQuarter] VARCHAR(2), --Week Number of the Quarter
		[WeekOfYear] VARCHAR(2),--Week Number of the Year
		[Month] VARCHAR(2), --Number of the Month 1 to 12
		[MonthName] VARCHAR(9),--January, February etc
		[MonthOfQuarter] VARCHAR(2),-- Month Number belongs to Quarter
		[Quarter] CHAR(1),
		[QuarterName] VARCHAR(9),--First,Second..
		[Year] CHAR(4),-- Year value of Date stored in Row
		[YearName] CHAR(7), --CY 2012,CY 2013
		[MonthYear] CHAR(10), --Jan-2013,Feb-2013
		[MMYYYY] CHAR(6),
		[FirstDayOfMonth] DATE,
		[LastDayOfMonth] DATE,
		[FirstDayOfQuarter] DATE,
		[LastDayOfQuarter] DATE,
		[FirstDayOfYear] DATE,
		[LastDayOfYear] DATE,
		[IsHolidayUSA] BIT,-- Flag 1=National Holiday, 0-No National Holiday
		[IsWeekday] BIT,-- 0=Week End ,1=Week Day
		[HolidayUSA] VARCHAR(50),--Name of Holiday in US
		[IsHolidayUK] BIT Null,
		[HolidayUK] VARCHAR(50) Null, --Name of Holiday in UK
 CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED 
(
	[timeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Employee] FOREIGN KEY([reportsTo])
REFERENCES [dbo].[Employee] ([employeeNumber])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Employee]
GO
ALTER TABLE [dbo].[SalesFact]  WITH CHECK ADD FOREIGN KEY([customerNumber])
REFERENCES [dbo].[Customer] ([customerNumber])
GO
ALTER TABLE [dbo].[SalesFact]  WITH CHECK ADD FOREIGN KEY([employeeNumber])
REFERENCES [dbo].[Employee] ([employeeNumber])
GO
ALTER TABLE [dbo].[SalesFact]  WITH CHECK ADD FOREIGN KEY([officeCode])
REFERENCES [dbo].[Office] ([officeCode])
GO
ALTER TABLE [dbo].[SalesFact]  WITH CHECK ADD FOREIGN KEY([orderTimeKey])
REFERENCES [dbo].[Time] ([timeKey])
GO
ALTER TABLE [dbo].[SalesFact]  WITH CHECK ADD FOREIGN KEY([productCode])
REFERENCES [dbo].[Product] ([productCode])
GO
ALTER TABLE [dbo].[SalesFact]  WITH CHECK ADD FOREIGN KEY([requiredTimeKey])
REFERENCES [dbo].[Time] ([timeKey])
GO
ALTER TABLE [dbo].[SalesFact]  WITH CHECK ADD FOREIGN KEY([shippedTimeKey])
REFERENCES [dbo].[Time] ([timeKey])
GO
USE [master]
GO
ALTER DATABASE [BI_CA1_DW] SET  READ_WRITE 
GO
