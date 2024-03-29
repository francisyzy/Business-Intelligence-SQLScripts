USE [master]
GO
/****** Object:  Database [BI_CA1_OLTP]    Script Date: 11/29/2017 11:43:00 AM ******/
CREATE DATABASE [BI_CA1_OLTP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BI_CA1_OLTP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BI_CA1_OLTP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BI_CA1_OLTP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BI_CA1_OLTP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BI_CA1_OLTP] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BI_CA1_OLTP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BI_CA1_OLTP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BI_CA1_OLTP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BI_CA1_OLTP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BI_CA1_OLTP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BI_CA1_OLTP] SET ARITHABORT OFF 
GO
ALTER DATABASE [BI_CA1_OLTP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BI_CA1_OLTP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BI_CA1_OLTP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BI_CA1_OLTP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BI_CA1_OLTP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BI_CA1_OLTP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BI_CA1_OLTP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BI_CA1_OLTP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BI_CA1_OLTP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BI_CA1_OLTP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BI_CA1_OLTP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BI_CA1_OLTP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BI_CA1_OLTP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BI_CA1_OLTP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BI_CA1_OLTP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BI_CA1_OLTP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BI_CA1_OLTP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BI_CA1_OLTP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BI_CA1_OLTP] SET  MULTI_USER 
GO
ALTER DATABASE [BI_CA1_OLTP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BI_CA1_OLTP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BI_CA1_OLTP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BI_CA1_OLTP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BI_CA1_OLTP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BI_CA1_OLTP] SET QUERY_STORE = OFF
GO
USE [BI_CA1_OLTP]
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
USE [BI_CA1_OLTP]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 11/29/2017 11:43:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[customerNumber] [int] NOT NULL,
	[customerName] [varchar](50) NOT NULL,
	[contactLastName] [varchar](50) NOT NULL,
	[contactFirstName] [varchar](50) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[addressLine1] [varchar](50) NOT NULL,
	[addressLine2] [varchar](50) NULL,
	[city] [varchar](50) NOT NULL,
	[state] [varchar](50) NULL,
	[postalCode] [varchar](15) NULL,
	[country] [varchar](50) NOT NULL,
	[salesRepEmployeeNumber] [int] NULL,
	[creditLimit] [decimal](20, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customerNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 11/29/2017 11:43:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[employeeNumber] [int] NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[extension] [varchar](10) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[officeCode] [varchar](10) NOT NULL,
	[reportsTo] [int] NULL,
	[jobTitle] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[employeeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[offices]    Script Date: 11/29/2017 11:43:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[offices](
	[officeCode] [varchar](10) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[addressLine1] [varchar](50) NOT NULL,
	[addressLine2] [varchar](50) NULL,
	[state] [varchar](50) NULL,
	[country] [varchar](50) NOT NULL,
	[postalCode] [varchar](10) NOT NULL,
	[territory] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[officeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderdetails]    Script Date: 11/29/2017 11:43:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetails](
	[orderNumber] [int] NOT NULL,
	[productCode] [varchar](15) NOT NULL,
	[quantityOrdered] [int] NOT NULL,
	[priceEach] [decimal](20, 2) NOT NULL,
	[orderLineNumber] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderNumber] ASC,
	[productCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 11/29/2017 11:43:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[orderNumber] [int] NOT NULL,
	[orderDate] [datetime] NOT NULL,
	[requiredDate] [datetime] NULL,
	[shippedDate] [datetime] NULL,
	[status] [varchar](15) NOT NULL,
	[comments] [text] NULL,
	[customerNumber] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payments]    Script Date: 11/29/2017 11:43:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payments](
	[customerNumber] [int] NOT NULL,
	[checkNumber] [varchar](50) NOT NULL,
	[paymentDate] [datetime] NOT NULL,
	[amount] [decimal](20, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customerNumber] ASC,
	[checkNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductLines]    Script Date: 11/29/2017 11:43:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductLines](
	[productLine] [varchar](50) NOT NULL,
	[textDescription] [text] NOT NULL,
	[htmlDescription] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[productLine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/29/2017 11:43:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productCode] [varchar](15) NOT NULL,
	[productName] [varchar](70) NOT NULL,
	[productLine] [varchar](50) NOT NULL,
	[productScale] [varchar](10) NOT NULL,
	[productVendor] [varchar](50) NOT NULL,
	[productDescription] [text] NOT NULL,
	[quantityInStock] [int] NOT NULL,
	[buyPrice] [decimal](20, 2) NOT NULL,
	[MSRP] [decimal](20, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (103, N'Atelier graphique', N'Schmitt', N'Carine ', N'40.32.2555', N'54, rue Royale', NULL, N'Nantes', NULL, N'44000', N'France', 1370, CAST(21000.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (112, N'Signal Gift Stores', N'King', N'Sue', N'7025551838', N'8489 Strong St.', NULL, N'Las Vegas', N'NV', N'83030', N'USA', 1166, CAST(71800.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (114, N'Australian Collectors, Co.', N'Ferguson', N'Peter', N'03 9520 4555', N'636 St Kilda Road', N'Level 3', N'Melbourne', N'Victoria', N'3004', N'Australia', 1611, CAST(117300.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (119, N'La Rochelle Gifts', N'Labrune', N'Janine ', N'40.67.8555', N'67, rue des Cinquante Otages', NULL, N'Nantes', NULL, N'44000', N'France', 1370, CAST(118200.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (121, N'Baane Mini Imports', N'Bergulfsen', N'Jonas ', N'07-98 9555', N'Erling Skakkes gate 78', NULL, N'Stavern', NULL, N'4110', N'Norway', 1504, CAST(81700.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (124, N'Mini Gifts Distributors Ltd.', N'Nelson', N'Valarie', N'4155551450', N'5677 Strong St.', NULL, N'San Rafael', N'CA', N'97562', N'USA', 1165, CAST(210500.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (125, N'Havel & Zbyszek Co', N'Piestrzeniewicz', N'Zbyszek ', N'(26) 642-7555', N'ul. Filtrowa 68', NULL, N'Warszawa', NULL, N'01-012', N'Poland', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (128, N'Blauer See Auto, Co.', N'Keitel', N'Roland', N'+49 69 66 90 2555', N'Lyonerstr. 34', NULL, N'Frankfurt', NULL, N'60528', N'Germany', 1504, CAST(59700.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (129, N'Mini Wheels Co.', N'Murphy', N'Julie', N'6505555787', N'5557 North Pendale Street', NULL, N'San Francisco', N'CA', N'94217', N'USA', 1165, CAST(64600.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (131, N'Land of Toys Inc.', N'Yu', N'Kwai', N'2125557818', N'897 Long Airport Avenue', NULL, N'NYC', N'NY', N'10022', N'USA', 1323, CAST(114900.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (141, N'Euro+ Shopping Channel', N'Freyre', N'Diego ', N'(91) 555 94 44', N'C/ Moralzarzal, 86', NULL, N'Madrid', NULL, N'28034', N'Spain', 1370, CAST(227600.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (144, N'Volvo Model Replicas, Co', N'Berglund', N'Christina ', N'0921-12 3555', N'Berguvsv‰gen  8', NULL, N'LuleÂ', NULL, N'S-958 22', N'Sweden', 1504, CAST(53100.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (145, N'Danish Wholesale Imports', N'Petersen', N'Jytte ', N'31 12 3555', N'VinbÊltet 34', NULL, N'Kobenhavn', NULL, N'1734', N'Denmark', 1401, CAST(83400.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (146, N'Saveley & Henriot, Co.', N'Saveley', N'Mary ', N'78.32.5555', N'2, rue du Commerce', NULL, N'Lyon', NULL, N'69004', N'France', 1337, CAST(123900.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (148, N'Dragon Souveniers, Ltd.', N'Natividad', N'Eric', N'+65 221 7555', N'Bronz Sok., Bronz Apt. 3/6 Tesvikiye', NULL, N'Singapore', NULL, N'079903', N'Singapore', 1621, CAST(103800.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (151, N'Muscle Machine Inc', N'Young', N'Jeff', N'2125557413', N'4092 Furth Circle', N'Suite 400', N'NYC', N'NY', N'10022', N'USA', 1286, CAST(138500.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (157, N'Diecast Classics Inc.', N'Yu', N'Kyung', N'2155551555', N'7586 Pompton St.', NULL, N'Allentown', N'PA', N'70267', N'USA', 1216, CAST(100600.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (161, N'Technics Stores Inc.', N'Hirano', N'Juri', N'6505556809', N'9408 Furth Circle', NULL, N'Burlingame', N'CA', N'94217', N'USA', 1165, CAST(84600.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (166, N'Handji Gifts& Co', N'Victorino', N'Wendy', N'+65 224 1555', N'Village Close - 106 Linden Road Sandown', N'2nd Floor', N'Singapore', NULL, N'069045', N'Singapore', 1612, CAST(97900.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (167, N'Herkku Gifts', N'Oeztan', N'Veysel', N'+47 2267 3215', N'Drammen 121, PR 744 Sentrum', NULL, N'Bergen', NULL, N'N 5804', N'Norway  ', 1504, CAST(96800.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (168, N'American Souvenirs Inc', N'Franco', N'Sue', N'2035557845', N'149 Spinnaker Dr.', N'Suite 101', N'New Haven', N'CT', N'97823', N'USA', 1286, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (169, N'Porto Imports Co.', N'de Castro', N'Isabel ', N'(1) 356-5555', N'Estrada da sa?de n. 58', NULL, N'Lisboa', NULL, N'1756', N'Portugal', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (171, N'Daedalus Designs Imports', N'RancÈ', N'Martine ', N'20.16.1555', N'184, chaussÈe de Tournai', NULL, N'Lille', NULL, N'59000', N'France', 1370, CAST(82900.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (172, N'La Corne D''abondance, Co.', N'Bertrand', N'Marie', N'(1) 42.34.2555', N'265, boulevard Charonne', NULL, N'Paris', NULL, N'75012', N'France', 1337, CAST(84300.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (173, N'Cambridge Collectables Co.', N'Tseng', N'Kyung', N'6175555555', N'4658 Baden Av.', NULL, N'Cambridge', N'MA', N'51247', N'USA', 1188, CAST(43400.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (175, N'Gift Depot Inc.', N'King', N'Julie', N'2035552570', N'25593 South Bay Ln.', NULL, N'Bridgewater', N'CT', N'97562', N'USA', 1323, CAST(84300.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (177, N'Osaka Souveniers Co.', N'Kentary', N'Mory', N'+81 06 6342 5555', N'Dojima Avanza 4F, 1-6-20 Dojima, Kita-ku', NULL, N'Osaka', N'Osaka', N' 530-0003', N'Japan', 1621, CAST(81200.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (181, N'Vitachrome Inc.', N'Frick', N'Michael', N'2125551500', N'2678 Kingston Rd.', N'Suite 101', N'NYC', N'NY', N'10022', N'USA', 1286, CAST(76400.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (186, N'Toys of Finland, Co.', N'Karttunen', N'Matti', N'90-224 8555', N'Keskuskatu 45', NULL, N'Helsinki', NULL, N'21240', N'Finland', 1501, CAST(96500.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (187, N'AV Stores, Co.', N'Ashworth', N'Victoria', N'(171) 555-1555', N'Fauntleroy Circus', NULL, N'Manchester', NULL, N'EC2 5NT', N'UK', 1501, CAST(136800.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (189, N'Clover Collections, Co.', N'Cassidy', N'Dean', N'+353 1862 1555', N'25 Maiden Lane', N'Floor No. 4', N'Dublin', NULL, N'2', N'Ireland', 1504, CAST(69400.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (198, N'Auto-Moto Classics Inc.', N'Taylor', N'Leslie', N'6175558428', N'16780 Pompton St.', NULL, N'Brickhaven', N'MA', N'58339', N'USA', 1216, CAST(23000.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (201, N'UK Collectables, Ltd.', N'Devon', N'Elizabeth', N'(171) 555-2282', N'Berkeley Gardens 12  Brewery', NULL, N'Liverpool', NULL, N'WX1 6LT', N'UK', 1501, CAST(92700.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (202, N'Canadian Gift Exchange Network', N'Tannamuri', N'Yoshi ', N'(604) 555-3392', N'1900 Oak St.', NULL, N'Vancouver', N'BC', N'V3F 2K1', N'Canada', 1323, CAST(90300.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (204, N'Online Mini Collectables', N'Barajas', N'Miguel', N'6175557555', N'7635 Spinnaker Dr.', NULL, N'Brickhaven', N'MA', N'58339', N'USA', 1188, CAST(68700.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (205, N'Toys4GrownUps.com', N'Young', N'Julie', N'6265557265', N'78934 Hillside Dr.', NULL, N'Pasadena', N'CA', N'90003', N'USA', 1166, CAST(90700.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (206, N'Asian Shopping Network, Co', N'Walker', N'Brydey', N'+612 9411 1555', N'Penthouse Level, Suntec Tower Three, 8 Temasek', NULL, N'Singapore', NULL, N'038988', N'Singapore', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (209, N'Mini Caravy', N'Citeaux', N'FrÈdÈrique ', N'88.60.1555', N'24, place KlÈber', NULL, N'Strasbourg', NULL, N'67000', N'France', 1370, CAST(53800.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (211, N'King Kong Collectables, Co.', N'Sunwoo', N'Michael', N'+852 2251 1555', N'Bank of China Tower, 1 Garden Road', N'Level 25', N'Central Hong Kong', NULL, NULL, N'Hong Kong', 1621, CAST(58600.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (216, N'Enaco Distributors', N'Saavedra', N'Eduardo ', N'(93) 203 4555', N'Rambla de CataluÒa, 23', NULL, N'Barcelona', NULL, N'08022', N'Spain', 1702, CAST(60300.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (219, N'Boards & Toys Co.', N'Young', N'Leslie', N'3105552373', N'4097 Douglas Av.', NULL, N'Glendale', N'CA', N'92561', N'USA', 1166, CAST(11000.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (223, N'Nat¸rlich Autos', N'Kloss', N'Horst ', N'0372-555188', N'Taucherstra?e 10', NULL, N'Cunewalde', NULL, N'01307', N'Germany', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (227, N'Heintze Collectables', N'Ibsen', N'Palle', N'86 21 3555', N'Smagsloget 45', NULL, N'˜rhus', NULL, N'8200', N'Denmark', 1401, CAST(120800.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (233, N'QuÈbec Home Shopping Network', N'FresniËre', N'Jean ', N'(514) 555-8054', N'43 rue St. Laurent', NULL, N'MontrÈal', N'QuÈbec', N'H1J 1C3', N'Canada', 1286, CAST(48700.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (237, N'ANG Resellers', N'Camino', N'Alejandra ', N'(91) 745 6555', N'Gran VÌa, 1', NULL, N'Madrid', NULL, N'28001', N'Spain', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (239, N'Collectable Mini Designs Co.', N'Thompson', N'Valarie', N'7605558146', N'361 Furth Circle', NULL, N'San Diego', N'CA', N'91217', N'USA', 1166, CAST(105000.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (240, N'giftsbymail.co.uk', N'Bennett', N'Helen ', N'(198) 555-8888', N'Garden House Crowther Way', NULL, N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'UK', 1501, CAST(93900.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (242, N'Alpha Cognac', N'Roulet', N'Annette ', N'61.77.6555', N'1 rue Alsace-Lorraine', NULL, N'Toulouse', NULL, N'31000', N'France', 1370, CAST(61100.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (247, N'Messner Shopping Network', N'Messner', N'Renate ', N'069-0555984', N'Magazinweg 7', NULL, N'Frankfurt', NULL, N'60528', N'Germany', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (249, N'Amica Models & Co.', N'Accorti', N'Paolo ', N'011-4988555', N'Via Monte Bianco 34', NULL, N'Torino', NULL, N'10100', N'Italy', 1401, CAST(113000.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (250, N'Lyon Souveniers', N'Da Cunha', N'Daniel', N'+33 1 46 62 7555', N'27 rue du Colonel Pierre Avia', NULL, N'Paris', NULL, N'75508', N'France', 1337, CAST(68100.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (256, N'Auto AssociÈs & Cie.', N'Tonini', N'Daniel ', N'30.59.8555', N'67, avenue de l''Europe', NULL, N'Versailles', NULL, N'78000', N'France', 1370, CAST(77900.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (259, N'Toms Spezialit‰ten, Ltd', N'Pfalzheim', N'Henriette ', N'0221-5554327', N'Mehrheimerstr. 369', NULL, N'Kˆln', NULL, N'50739', N'Germany', 1504, CAST(120400.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (260, N'Royal Canadian Collectables, Ltd.', N'Lincoln', N'Elizabeth ', N'(604) 555-4555', N'23 Tsawassen Blvd.', NULL, N'Tsawassen', N'BC', N'T2F 8M4', N'Canada', 1323, CAST(89600.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (273, N'Franken Gifts, Co', N'Franken', N'Peter ', N'089-0877555', N'Berliner Platz 43', NULL, N'M¸nchen', NULL, N'80805', N'Germany', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (276, N'Anna''s Decorations, Ltd', N'O''Hara', N'Anna', N'02 9936 8555', N'201 Miller Street', N'Level 15', N'North Sydney', N'NSW', N'2060', N'Australia', 1611, CAST(107800.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (278, N'Rovelli Gifts', N'Rovelli', N'Giovanni ', N'035-640555', N'Via Ludovico il Moro 22', NULL, N'Bergamo', NULL, N'24100', N'Italy', 1401, CAST(119600.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (282, N'Souveniers And Things Co.', N'Huxley', N'Adrian', N'+61 2 9495 8555', N'Monitor Money Building, 815 Pacific Hwy', N'Level 6', N'Chatswood', N'NSW', N'2067', N'Australia', 1611, CAST(93300.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (286, N'Marta''s Replicas Co.', N'Hernandez', N'Marta', N'6175558555', N'39323 Spinnaker Dr.', NULL, N'Cambridge', N'MA', N'51247', N'USA', 1216, CAST(123700.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (293, N'BG&E Collectables', N'Pon', N'Ed', N'+41 26 425 50 01', N'Rte des Arsenaux 41 ', NULL, N'Fribourg', NULL, N'1700', N'Switzerland', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (298, N'Vida Sport, Ltd', N'Holz', N'Michael ', N'0897-034555', N'Grenzacherweg 237', NULL, N'GenËve', NULL, N'1203', N'Switzerland', 1702, CAST(141300.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (299, N'Norway Gifts By Mail, Co.', N'Klaeboe', N'Jan', N'+47 2212 1555', N'Drammensveien 126 A, PB 744 Sentrum', NULL, N'Oslo', NULL, N'N 0106', N'Norway  ', 1504, CAST(95100.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (303, N'Schuyler Imports', N'Schuyler', N'Bradley', N'+31 20 491 9555', N'Kingsfordweg 151', NULL, N'Amsterdam', NULL, N'1043 GR', N'Netherlands', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (307, N'Der Hund Imports', N'Anders', N'Maria ', N'030-0074555', N'Obere Str. 57', NULL, N'Berlin', NULL, N'12209', N'Germany', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (311, N'Oulu Toy Supplies, Inc.', N'Koskitalo', N'Pirkko', N'981-443655', N'Torikatu 38', NULL, N'Oulu', NULL, N'90110', N'Finland', 1501, CAST(90500.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (314, N'Petit Auto', N'Dewey', N'Catherine ', N'(02) 5554 67', N'Rue Joseph-Bens 532', NULL, N'Bruxelles', NULL, N'B-1180', N'Belgium', 1401, CAST(79900.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (319, N'Mini Classics', N'Frick', N'Steve', N'9145554562', N'3758 North Pendale Street', NULL, N'White Plains', N'NY', N'24067', N'USA', 1323, CAST(102700.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (320, N'Mini Creations Ltd.', N'Tam', N'Wing C', N'5085559555', N'4575 Hillside Dr.', NULL, N'New Bedford', N'MA', N'50553', N'USA', 1188, CAST(94500.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (321, N'Corporate Gift Ideas Co.', N'Brown', N'Julie', N'6505551386', N'7734 Strong St.', NULL, N'San Francisco', N'CA', N'94217', N'USA', 1165, CAST(105000.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (323, N'Down Under Souveniers, Inc', N'Graham', N'Mike', N'+64 9 312 5555', N'162-164 Grafton Road', N'Level 2', N'Auckland  ', NULL, NULL, N'New Zealand', 1612, CAST(88000.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (324, N'Stylish Desk Decors, Co.', N'Brown', N'Ann ', N'(171) 555-0297', N'35 King George', NULL, N'London', NULL, N'WX3 6FW', N'UK', 1501, CAST(77000.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (328, N'Tekni Collectables Inc.', N'Brown', N'William', N'2015559350', N'7476 Moss Rd.', NULL, N'Newark', N'NJ', N'94019', N'USA', 1323, CAST(44100.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (333, N'Australian Gift Network, Co', N'Calaghan', N'Tony', N'61-7-3844-6555', N'31 Duncan St. West End', NULL, N'South Brisbane', N'Queensland', N'4101', N'Australia', 1611, CAST(51600.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (334, N'Suominen Souveniers', N'Suominen', N'Kalle', N'+358 9 8045 555', N'Software Engineering Center, SEC Oy', NULL, N'Espoo', NULL, N'FIN-02271', N'Finland', 1501, CAST(98800.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (335, N'Cramer Spezialit‰ten, Ltd', N'Cramer', N'Philip ', N'0555-09555', N'Maubelstr. 90', NULL, N'Brandenburg', NULL, N'14776', N'Germany', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (339, N'Classic Gift Ideas, Inc', N'Cervantes', N'Francisca', N'2155554695', N'782 First Street', NULL, N'Philadelphia', N'PA', N'71270', N'USA', 1188, CAST(81100.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (344, N'CAF Imports', N'Fernandez', N'Jesus', N'+34 913 728 555', N'Merchants House, 27-30 Merchant''s Quay', NULL, N'Madrid', NULL, N'28023', N'Spain', 1702, CAST(59600.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (347, N'Men ''R'' US Retailers, Ltd.', N'Chandler', N'Michael', N'2155554369', N'6047 Douglas Av.', NULL, N'Los Angeles', N'CA', N'91003', N'USA', 1166, CAST(57700.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (348, N'Asian Treasures, Inc.', N'McKenna', N'Patricia ', N'2967 555', N'8 Johnstown Road', NULL, N'Cork', N'Co. Cork', NULL, N'Ireland', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (350, N'Marseille Mini Autos', N'Lebihan', N'Laurence ', N'91.24.4555', N'12, rue des Bouchers', NULL, N'Marseille', NULL, N'13008', N'France', 1337, CAST(65000.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (353, N'Reims Collectables', N'Henriot', N'Paul ', N'26.47.1555', N'59 rue de l''Abbaye', NULL, N'Reims', NULL, N'51100', N'France', 1337, CAST(81100.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (356, N'SAR Distributors, Co', N'Kuger', N'Armand', N'+27 21 550 3555', N'Century City-Montague Gardens PO Box 37177', NULL, N'Chempet', NULL, N' 7442', N'South Africa', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (357, N'GiftsForHim.com', N'MacKinlay', N'Wales', N'64-9-3763555', N'199 Great North Road', NULL, N'Auckland', NULL, NULL, N'New Zealand', 1612, CAST(77700.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (361, N'Kommission Auto', N'Josephs', N'Karin', N'0251-555259', N'Luisenstr. 48', NULL, N'M¸nster', NULL, N'44087', N'Germany', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (362, N'Gifts4AllAges.com', N'Yoshido', N'Juri', N'6175559555', N'8616 Spinnaker Dr.', NULL, N'Boston', N'MA', N'51003', N'USA', 1216, CAST(41900.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (363, N'Online Diecast Creations Co.', N'Young', N'Valarie', N'6035558647', N'2304 Long Airport Avenue', NULL, N'Nashua', N'NH', N'62005', N'USA', 1216, CAST(114200.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (369, N'Lisboa Souveniers, Inc', N'Rodriguez', N'Lino ', N'(1) 354-2555', N'Jardim das rosas n. 32', NULL, N'Lisboa', NULL, N'1675', N'Portugal', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (376, N'Precious Collectables', N'Wang', N'Yang ', N'0452-076555', N'Hauptstr. 29', NULL, N'Bern', NULL, N'3012', N'Switzerland', 1702, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (379, N'Collectables For Less Inc.', N'Nelson', N'Allen', N'6175558555', N'7825 Douglas Av.', NULL, N'Brickhaven', N'MA', N'58339', N'USA', 1188, CAST(70700.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (381, N'Royale Belge', N'Cartrain', N'Pascale ', N'(071) 23 67 2555', N'Boulevard Tirou, 255', NULL, N'Charleroi', NULL, N'B-6000', N'Belgium', 1401, CAST(23500.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (382, N'Salzburg Collectables', N'Pipps', N'Georg ', N'6562-9555', N'Geislweg 14', NULL, N'Salzburg', NULL, N'5020', N'Austria', 1401, CAST(71700.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (385, N'Cruz & Sons Co.', N'Cruz', N'Arnold', N'+63 2 555 3587', N'15 McCallum Street - NatWest Center #13-03', NULL, N'Makati City', NULL, N'1227 MM', N'Philippines', 1621, CAST(81500.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (386, N'L''ordine Souveniers', N'Moroni', N'Maurizio ', N'0522-556555', N'Strada Provinciale 124', NULL, N'Reggio Emilia', NULL, N'42100', N'Italy', 1401, CAST(121400.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (398, N'Tokyo Collectables, Ltd', N'Shimamura', N'Akiko', N'+81 3 3584 0555', N'2-2-8 Roppongi', NULL, N'Minato-ku', N'Tokyo', N'106-0032', N'Japan', 1621, CAST(94400.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (406, N'Auto Canal+ Petit', N'Perrier', N'Dominique', N'(1) 47.55.6555', N'25, rue Lauriston', NULL, N'Paris', NULL, N'75016', N'France', 1337, CAST(95000.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (409, N'Stuttgart Collectable Exchange', N'M¸ller', N'Rita ', N'0711-555361', N'Adenauerallee 900', NULL, N'Stuttgart', NULL, N'70563', N'Germany', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (412, N'Extreme Desk Decorations, Ltd', N'McRoy', N'Sarah', N'04 499 9555', N'101 Lambton Quay', N'Level 11', N'Wellington', NULL, NULL, N'New Zealand', 1612, CAST(86800.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (415, N'Bavarian Collectables Imports, Co.', N'Donnermeyer', N'Michael', N' +49 89 61 08 9555', N'Hansastr. 15', NULL, N'Munich', NULL, N'80686', N'Germany', 1504, CAST(77000.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (424, N'Classic Legends Inc.', N'Hernandez', N'Maria', N'2125558493', N'5905 Pompton St.', N'Suite 750', N'NYC', N'NY', N'10022', N'USA', 1286, CAST(67500.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (443, N'Feuer Online Stores, Inc', N'Feuer', N'Alexander ', N'0342-555176', N'Heerstr. 22', NULL, N'Leipzig', NULL, N'04179', N'Germany', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (447, N'Gift Ideas Corp.', N'Lewis', N'Dan', N'2035554407', N'2440 Pompton St.', NULL, N'Glendale', N'CT', N'97561', N'USA', 1323, CAST(49700.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (448, N'Scandinavian Gift Ideas', N'Larsson', N'Maria ', N'0695-34 6555', N'˜kergatan 24', NULL, N'Br‰cke', NULL, N'S-844 67', N'Sweden', 1504, CAST(116400.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (450, N'The Sharp Gifts Warehouse', N'Frick', N'Sue', N'4085553659', N'3086 Ingle Ln.', NULL, N'San Jose', N'CA', N'94217', N'USA', 1165, CAST(77600.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (452, N'Mini Auto Werke', N'Mendel', N'Roland ', N'7675-3555', N'Kirchgasse 6', NULL, N'Graz', NULL, N'8010', N'Austria', 1401, CAST(45300.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (455, N'Super Scale Inc.', N'Murphy', N'Leslie', N'2035559545', N'567 North Pendale Street', NULL, N'New Haven', N'CT', N'97823', N'USA', 1286, CAST(95400.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (456, N'Microscale Inc.', N'Kuo', N'Kee', N'2125551957', N'5290 North Pendale Street', N'Suite 200', N'NYC', N'NY', N'10022', N'USA', 1286, CAST(39800.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (458, N'Corrida Auto Replicas, Ltd', N'Sommer', N'MartÌn ', N'(91) 555 22 82', N'C/ Araquil, 67', NULL, N'Madrid', NULL, N'28023', N'Spain', 1702, CAST(104600.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (459, N'Warburg Exchange', N'Ottlieb', N'Sven ', N'0241-039123', N'Walserweg 21', NULL, N'Aachen', NULL, N'52066', N'Germany', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (462, N'FunGiftIdeas.com', N'Benitez', N'Violeta', N'5085552555', N'1785 First Street', NULL, N'New Bedford', N'MA', N'50553', N'USA', 1216, CAST(85800.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (465, N'Anton Designs, Ltd.', N'Anton', N'Carmen', N'+34 913 728555', N'c/ Gobelas, 19-1 Urb. La Florida', NULL, N'Madrid', NULL, N'28023', N'Spain', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (471, N'Australian Collectables, Ltd', N'Connery', N'Sean', N'61-9-3844-6555', N'7 Allen Street', NULL, N'Glen Waverly', N'Victoria', N'3150', N'Australia', 1611, CAST(60300.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (473, N'Frau da Collezione', N'Ricotti', N'Franco', N'+39 022515555', N'20093 Cologno Monzese, via Alessandro Volta 16', NULL, N'Milan', NULL, NULL, N'Italy', 1401, CAST(34800.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (475, N'West Coast Collectables Co.', N'Thompson', N'Steve', N'3105553722', N'3675 Furth Circle', NULL, N'Burbank', N'CA', N'94019', N'USA', 1166, CAST(55400.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (477, N'Mit Vergn¸gen & Co.', N'Moos', N'Hanna ', N'0621-08555', N'Forsterstr. 57', NULL, N'Mannheim', NULL, N'68306', N'Germany', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (480, N'Kremlin Collectables, Co.', N'Semenov', N'Alexander ', N'+7 812 293 0521', N'2 Pobedy Square', NULL, N'Saint Petersburg', NULL, N'196143', N'Russia', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (481, N'Raanan Stores, Inc', N'Altagar,G M', N'Raanan', N'+ 972 9 959 8555', N'3 Hagalim Blv.,', NULL, N'Herzlia', NULL, N'47625', N'Israel', NULL, CAST(0.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (484, N'Iberia Gift Imports, Corp.', N'Roel', N'JosÈ Pedro ', N'(95) 555 82 82', N'C/ Romero, 33', NULL, N'Sevilla', NULL, N'41101', N'Spain', 1702, CAST(65700.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (486, N'Motor Mint Distributors Inc.', N'Hernandez', N'Rosa', N'2155559857', N'11328 Douglas Av.', NULL, N'Philadelphia', N'PA', N'71270', N'USA', 1323, CAST(72600.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (487, N'Signal Collectibles Ltd.', N'Taylor', N'Sue', N'4155554312', N'2793 Furth Circle', NULL, N'Brisbane', N'CA', N'94217', N'USA', 1165, CAST(60300.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (489, N'Double Decker Gift Stores, Ltd', N'Hardy', N'Thomas ', N'(171) 555-7555', N'120 Hanover Sq.', NULL, N'London', NULL, N'WA1 1DP', N'UK', 1501, CAST(43300.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (495, N'Diecast Collectables', N'Franco', N'Valarie', N'6175552555', N'6251 Ingle Ln.', NULL, N'Boston', N'MA', N'51003', N'USA', 1188, CAST(85100.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[customers] ([customerNumber], [customerName], [contactLastName], [contactFirstName], [phone], [addressLine1], [addressLine2], [city], [state], [postalCode], [country], [salesRepEmployeeNumber], [creditLimit]) VALUES (496, N'Kelly''s Gift Shop', N'Snowden', N'Tony', N'+64 9 5555500', N'Arenales 1938 3''A''', NULL, N'Auckland  ', NULL, NULL, N'New Zealand', 1612, CAST(110000.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1002, N'Murphy', N'Diane', N'x5800', N'dmurphy@classicmodelcars.com', N'1', NULL, N'President')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1056, N'Patterson', N'Mary', N'x4611', N'mpatterso@classicmodelcars.com', N'1', 1002, N'VP Sales')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1076, N'Firrelli', N'Jeff', N'x9273', N'jfirrelli@classicmodelcars.com', N'1', 1002, N'VP Marketing')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1088, N'Patterson', N'William', N'x4871', N'wpatterson@classicmodelcars.com', N'6', 1056, N'Sales Manager (JAPAN, APAC)')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1102, N'Bondur', N'Gerard', N'x5408', N'athompson@classicmodelcars.com', N'4', 1056, N'Sale Manager (EMEA)')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1143, N'Bow', N'Anthony', N'x5428', N'bhoward@classicmodelcars.com', N'1', 1056, N'Sales Manager (NA)')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1165, N'Jennings', N'Leslie', N'x3291', N'ljennings@classicmodelcars.com', N'1', 1143, N'Sales Rep')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1166, N'Thompson', N'Leslie', N'x4065', N'lthompson@classicmodelcars.com', N'1', 1143, N'Sales Rep')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1188, N'Firrelli', N'Julie', N'x2173', N'jfirrelli@classicmodelcars.com', N'2', 1143, N'Sales Rep')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1216, N'Patterson', N'Steve', N'x4334', N'spatterso@classicmodelcars.com', N'2', 1143, N'Sales Rep')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1286, N'Tseng', N'Foon Yue', N'x2248', N'ftseng@classicmodelcars.com', N'3', 1143, N'Sales Rep')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1323, N'Vanauf', N'George', N'x4102', N'gvanauf@classicmodelcars.com', N'3', 1143, N'Sales Rep')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1337, N'Bondur', N'Loui', N'x6493', N'lbondur@classicmodelcars.com', N'4', 1102, N'Sales Rep')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1370, N'Hernandez', N'Gerard', N'x2028', N'ghernande@classicmodelcars.com', N'4', 1102, N'Sales Rep')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1401, N'Castillo', N'Pamela', N'x2759', N'pcastillo@classicmodelcars.com', N'4', 1102, N'Sales Rep')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1501, N'Bott', N'Larry', N'x2311', N'lbott@classicmodelcars.com', N'7', 1102, N'Sales Rep')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1504, N'Jones', N'Barry', N'x102', N'bjones@classicmodelcars.com', N'7', 1102, N'Sales Rep')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1611, N'Fixter', N'Andy', N'x101', N'afixter@classicmodelcars.com', N'6', 1088, N'Sales Rep')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1612, N'Marsh', N'Peter', N'x102', N'pmarsh@classicmodelcars.com', N'6', 1088, N'Sales Rep')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1619, N'King', N'Tom', N'x103', N'tking@classicmodelcars.com', N'6', 1088, N'Sales Rep')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1621, N'Nishi', N'Mami', N'x101', N'mnishi@classicmodelcars.com', N'5', 1088, N'Sales Rep')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1625, N'Kato', N'Yoshimi', N'x102', N'ekato@classicmodelcars.com', N'5', 1088, N'Sales Rep')
GO
INSERT [dbo].[employees] ([employeeNumber], [lastName], [firstName], [extension], [email], [officeCode], [reportsTo], [jobTitle]) VALUES (1702, N'Gerard', N'Martin', N'x2312', N'gmartin@classicmodelcars.com', N'4', 1102, N'Sales Rep')
GO
INSERT [dbo].[offices] ([officeCode], [city], [phone], [addressLine1], [addressLine2], [state], [country], [postalCode], [territory]) VALUES (N'1', N'San Francisco', N'+1 650 219 4782', N'100 Market Street', N'Suite 300', N'CA', N'USA', N'94080', N'NA')
GO
INSERT [dbo].[offices] ([officeCode], [city], [phone], [addressLine1], [addressLine2], [state], [country], [postalCode], [territory]) VALUES (N'2', N'Boston', N'+1 215 837 0825', N'1550 Court Place', N'Suite 102', N'MA', N'USA', N'02107', N'NA')
GO
INSERT [dbo].[offices] ([officeCode], [city], [phone], [addressLine1], [addressLine2], [state], [country], [postalCode], [territory]) VALUES (N'3', N'NYC', N'+1 212 555 3000', N'523 East 53rd Street', N'apt. 5A', N'NY', N'USA', N'10022', N'NA')
GO
INSERT [dbo].[offices] ([officeCode], [city], [phone], [addressLine1], [addressLine2], [state], [country], [postalCode], [territory]) VALUES (N'4', N'Paris', N'+33 14 723 4404', N'43 Rue Jouffroy D''abbans', NULL, N'', N'France', N'75017', N'EMEA')
GO
INSERT [dbo].[offices] ([officeCode], [city], [phone], [addressLine1], [addressLine2], [state], [country], [postalCode], [territory]) VALUES (N'5', N'Tokyo', N'+81 33 224 5000', N'4-1 Kioicho', NULL, N'Chiyoda-Ku', N'Japan', N'102-8578', N'Japan')
GO
INSERT [dbo].[offices] ([officeCode], [city], [phone], [addressLine1], [addressLine2], [state], [country], [postalCode], [territory]) VALUES (N'6', N'Sydney', N'+61 2 9264 2451', N'5-11 Wentworth Avenue', N'Floor #2', NULL, N'Australia', N'NSW 2010', N'APAC')
GO
INSERT [dbo].[offices] ([officeCode], [city], [phone], [addressLine1], [addressLine2], [state], [country], [postalCode], [territory]) VALUES (N'7', N'London', N'+44 20 7877 2041', N'25 Old Broad Street', N'Level 7', NULL, N'UK', N'EC2N 1HN', N'EMEA')
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10100, N'S18_1749', 30, CAST(171.70 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10100, N'S18_2248', 50, CAST(67.80 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10100, N'S18_4409', 22, CAST(86.51 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10100, N'S24_3969', 49, CAST(34.47 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10101, N'S18_2325', 25, CAST(151.28 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10101, N'S18_2795', 26, CAST(145.13 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10101, N'S24_1937', 45, CAST(31.20 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10101, N'S24_2022', 46, CAST(53.76 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10102, N'S18_1342', 39, CAST(123.29 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10102, N'S18_1367', 41, CAST(50.14 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10103, N'S10_1949', 26, CAST(207.87 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10103, N'S10_4962', 42, CAST(128.53 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10103, N'S12_1666', 27, CAST(125.74 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10103, N'S18_1097', 35, CAST(112.00 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10103, N'S18_2432', 22, CAST(54.09 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10103, N'S18_2949', 27, CAST(83.07 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10103, N'S18_2957', 35, CAST(57.46 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10103, N'S18_3136', 25, CAST(101.58 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10103, N'S18_3320', 46, CAST(104.17 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10103, N'S18_4600', 36, CAST(117.45 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10103, N'S18_4668', 41, CAST(47.29 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10103, N'S24_2300', 36, CAST(102.23 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10103, N'S24_4258', 25, CAST(114.92 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10103, N'S32_1268', 31, CAST(104.01 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10103, N'S32_3522', 45, CAST(75.63 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10103, N'S700_2824', 42, CAST(106.21 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10104, N'S12_3148', 34, CAST(175.25 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10104, N'S12_4473', 41, CAST(112.58 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10104, N'S18_2238', 24, CAST(144.08 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10104, N'S18_2319', 29, CAST(130.09 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10104, N'S18_3232', 23, CAST(198.13 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10104, N'S18_4027', 38, CAST(140.75 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10104, N'S24_1444', 35, CAST(55.49 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10104, N'S24_2840', 44, CAST(39.60 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10104, N'S24_4048', 26, CAST(112.37 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10104, N'S32_2509', 35, CAST(47.62 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10104, N'S32_3207', 49, CAST(65.87 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10104, N'S50_1392', 33, CAST(112.28 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10104, N'S50_1514', 32, CAST(53.31 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10105, N'S10_4757', 50, CAST(144.16 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10105, N'S12_1108', 41, CAST(211.96 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10105, N'S12_3891', 29, CAST(157.45 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10105, N'S18_3140', 22, CAST(139.32 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10105, N'S18_3259', 38, CAST(113.95 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10105, N'S18_4522', 41, CAST(82.50 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10105, N'S24_2011', 43, CAST(147.47 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10105, N'S24_3151', 44, CAST(72.58 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10105, N'S24_3816', 50, CAST(79.67 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10105, N'S700_1138', 41, CAST(70.67 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10105, N'S700_1938', 29, CAST(70.15 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10105, N'S700_2610', 31, CAST(65.77 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10105, N'S700_3505', 39, CAST(81.14 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10105, N'S700_3962', 22, CAST(116.19 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10105, N'S72_3212', 25, CAST(56.78 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10106, N'S18_1662', 36, CAST(146.65 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10106, N'S18_2581', 34, CAST(90.39 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10106, N'S18_3029', 41, CAST(83.44 AS Decimal(20, 2)), 18)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10106, N'S18_3856', 41, CAST(116.46 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10106, N'S24_1785', 28, CAST(88.63 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10106, N'S24_2841', 49, CAST(74.68 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10106, N'S24_3420', 31, CAST(52.60 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10106, N'S24_3949', 50, CAST(64.83 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10106, N'S24_4278', 26, CAST(63.76 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10106, N'S32_4289', 33, CAST(72.92 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10106, N'S50_1341', 39, CAST(40.15 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10106, N'S700_1691', 31, CAST(106.87 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10106, N'S700_2047', 30, CAST(105.91 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10106, N'S700_2466', 34, CAST(110.69 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10106, N'S700_2834', 32, CAST(124.58 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10106, N'S700_3167', 44, CAST(74.40 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10106, N'S700_4002', 48, CAST(61.44 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10106, N'S72_1253', 48, CAST(52.64 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10107, N'S10_1678', 30, CAST(95.70 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10107, N'S10_2016', 39, CAST(99.91 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10107, N'S10_4698', 27, CAST(224.65 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10107, N'S12_2823', 21, CAST(144.60 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10107, N'S18_2625', 29, CAST(70.87 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10107, N'S24_1578', 25, CAST(113.83 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10107, N'S24_2000', 38, CAST(83.03 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10107, N'S32_1374', 20, CAST(92.90 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10108, N'S12_1099', 33, CAST(159.55 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10108, N'S12_3380', 45, CAST(136.23 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10108, N'S12_3990', 39, CAST(89.38 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10108, N'S12_4675', 36, CAST(103.64 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10108, N'S18_1889', 38, CAST(82.39 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10108, N'S18_3278', 26, CAST(68.35 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10108, N'S18_3482', 29, CAST(139.64 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10108, N'S18_3782', 43, CAST(67.77 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10108, N'S18_4721', 44, CAST(126.48 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10108, N'S24_2360', 35, CAST(58.87 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10108, N'S24_3371', 30, CAST(63.07 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10108, N'S24_3856', 40, CAST(136.22 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10108, N'S24_4620', 31, CAST(68.71 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10108, N'S32_2206', 27, CAST(43.45 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10108, N'S32_4485', 31, CAST(118.38 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10108, N'S50_4713', 34, CAST(82.99 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10109, N'S18_1129', 26, CAST(168.43 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10109, N'S18_1984', 38, CAST(116.65 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10109, N'S18_2870', 26, CAST(121.44 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10109, N'S18_3232', 46, CAST(179.50 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10109, N'S18_3685', 47, CAST(132.80 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10109, N'S24_2972', 29, CAST(32.10 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10110, N'S18_1589', 37, CAST(146.84 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10110, N'S18_1749', 42, CAST(144.50 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10110, N'S18_2248', 32, CAST(50.25 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10110, N'S18_2325', 33, CAST(116.96 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10110, N'S18_2795', 31, CAST(163.69 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10110, N'S18_4409', 28, CAST(89.27 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10110, N'S18_4933', 42, CAST(61.29 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10110, N'S24_1046', 36, CAST(85.25 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10110, N'S24_1628', 29, CAST(59.37 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10110, N'S24_1937', 20, CAST(35.51 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10110, N'S24_2022', 39, CAST(44.35 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10110, N'S24_2766', 43, CAST(78.15 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10110, N'S24_2887', 46, CAST(129.18 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10110, N'S24_3191', 27, CAST(73.62 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10110, N'S24_3432', 37, CAST(100.66 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10110, N'S24_3969', 48, CAST(34.47 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10111, N'S18_1342', 33, CAST(99.66 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10111, N'S18_1367', 48, CAST(49.06 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10111, N'S18_2957', 28, CAST(64.33 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10111, N'S18_3136', 43, CAST(112.05 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10111, N'S18_3320', 39, CAST(107.15 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10111, N'S24_4258', 26, CAST(86.68 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10112, N'S10_1949', 29, CAST(248.59 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10112, N'S18_2949', 23, CAST(110.43 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10113, N'S12_1666', 21, CAST(162.64 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10113, N'S18_1097', 49, CAST(100.34 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10113, N'S18_4668', 50, CAST(49.81 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10113, N'S32_3522', 23, CAST(68.52 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10114, N'S10_4962', 31, CAST(138.88 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10114, N'S18_2319', 39, CAST(106.78 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10114, N'S18_2432', 45, CAST(68.67 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10114, N'S18_3232', 48, CAST(171.03 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10114, N'S18_4600', 41, CAST(117.45 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10114, N'S24_2300', 21, CAST(139.29 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10114, N'S24_2840', 24, CAST(30.06 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10114, N'S32_1268', 32, CAST(114.61 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10114, N'S32_2509', 28, CAST(55.73 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10114, N'S700_2824', 42, CAST(113.29 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10115, N'S12_4473', 46, CAST(124.43 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10115, N'S18_2238', 46, CAST(160.46 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10115, N'S24_1444', 47, CAST(69.36 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10115, N'S24_4048', 44, CAST(126.56 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10115, N'S50_1392', 27, CAST(105.33 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10116, N'S32_3207', 27, CAST(63.38 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10117, N'S12_1108', 33, CAST(182.86 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10117, N'S12_3148', 43, CAST(137.48 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10117, N'S12_3891', 39, CAST(152.26 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10117, N'S18_3140', 26, CAST(136.59 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10117, N'S18_3259', 21, CAST(95.80 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10117, N'S18_4027', 22, CAST(126.39 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10117, N'S18_4522', 23, CAST(97.42 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10117, N'S24_2011', 41, CAST(126.58 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10117, N'S50_1514', 21, CAST(49.21 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10117, N'S700_1938', 38, CAST(79.68 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10117, N'S700_3962', 45, CAST(83.42 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10117, N'S72_3212', 50, CAST(43.68 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10118, N'S700_3505', 36, CAST(117.20 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10119, N'S10_4757', 46, CAST(108.80 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10119, N'S18_1662', 43, CAST(160.84 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10119, N'S18_3029', 21, CAST(89.46 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10119, N'S18_3856', 27, CAST(99.52 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10119, N'S24_2841', 41, CAST(59.60 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10119, N'S24_3151', 35, CAST(87.62 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10119, N'S24_3420', 20, CAST(72.98 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10119, N'S24_3816', 35, CAST(90.57 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10119, N'S24_3949', 28, CAST(70.29 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10119, N'S700_1138', 25, CAST(76.67 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10119, N'S700_2047', 29, CAST(94.14 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10119, N'S700_2610', 38, CAST(65.77 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10119, N'S700_4002', 26, CAST(59.22 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10119, N'S72_1253', 28, CAST(48.17 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10120, N'S10_2016', 29, CAST(96.34 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10120, N'S10_4698', 46, CAST(201.41 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10120, N'S18_2581', 29, CAST(71.81 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10120, N'S18_2625', 46, CAST(58.15 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10120, N'S24_1578', 35, CAST(98.05 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10120, N'S24_1785', 39, CAST(119.27 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10120, N'S24_2000', 34, CAST(83.79 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10120, N'S24_4278', 29, CAST(85.49 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10120, N'S32_1374', 22, CAST(111.88 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10120, N'S32_4289', 29, CAST(72.23 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10120, N'S50_1341', 49, CAST(50.62 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10120, N'S700_1691', 47, CAST(82.21 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10120, N'S700_2466', 24, CAST(107.70 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10120, N'S700_2834', 24, CAST(142.38 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10120, N'S700_3167', 43, CAST(76.00 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10121, N'S10_1678', 34, CAST(81.35 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10121, N'S12_2823', 50, CAST(165.68 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10121, N'S24_2360', 32, CAST(76.88 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10121, N'S32_4485', 25, CAST(86.74 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10121, N'S50_4713', 44, CAST(74.85 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10122, N'S12_1099', 42, CAST(180.95 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10122, N'S12_3380', 37, CAST(99.82 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10122, N'S12_3990', 32, CAST(63.84 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10122, N'S12_4675', 20, CAST(107.10 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10122, N'S18_1129', 34, CAST(147.20 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10122, N'S18_1889', 43, CAST(72.38 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10122, N'S18_1984', 31, CAST(132.29 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10122, N'S18_3232', 25, CAST(143.94 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10122, N'S18_3278', 21, CAST(73.17 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10122, N'S18_3482', 21, CAST(117.59 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10122, N'S18_3782', 35, CAST(49.74 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10122, N'S18_4721', 28, CAST(127.97 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10122, N'S24_2972', 39, CAST(30.96 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10122, N'S24_3371', 34, CAST(50.21 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10122, N'S24_3856', 43, CAST(127.79 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10122, N'S24_4620', 29, CAST(71.14 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10122, N'S32_2206', 31, CAST(44.66 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10123, N'S18_1589', 26, CAST(118.22 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10123, N'S18_2870', 46, CAST(112.20 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10123, N'S18_3685', 34, CAST(156.82 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10123, N'S24_1628', 50, CAST(59.87 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10124, N'S18_1749', 21, CAST(136.00 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10124, N'S18_2248', 42, CAST(53.88 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10124, N'S18_2325', 42, CAST(105.52 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10124, N'S18_4409', 36, CAST(85.59 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10124, N'S18_4933', 23, CAST(57.73 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10124, N'S24_1046', 22, CAST(77.90 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10124, N'S24_1937', 45, CAST(37.84 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10124, N'S24_2022', 22, CAST(45.25 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10124, N'S24_2766', 32, CAST(72.70 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10124, N'S24_2887', 25, CAST(93.95 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10124, N'S24_3191', 49, CAST(83.04 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10124, N'S24_3432', 43, CAST(121.00 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10124, N'S24_3969', 46, CAST(33.23 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10125, N'S18_1342', 32, CAST(101.71 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10125, N'S18_2795', 34, CAST(190.69 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10126, N'S10_1949', 38, CAST(192.87 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10126, N'S10_4962', 22, CAST(152.17 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10126, N'S12_1666', 21, CAST(116.17 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10126, N'S18_1097', 38, CAST(101.50 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10126, N'S18_1367', 42, CAST(54.99 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10126, N'S18_2432', 43, CAST(65.02 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10126, N'S18_2949', 31, CAST(90.17 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10126, N'S18_2957', 46, CAST(73.70 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10126, N'S18_3136', 30, CAST(97.39 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10126, N'S18_3320', 38, CAST(82.34 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10126, N'S18_4600', 50, CAST(141.66 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10126, N'S18_4668', 43, CAST(53.83 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10126, N'S24_2300', 27, CAST(126.51 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10126, N'S24_4258', 34, CAST(105.18 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10126, N'S32_1268', 43, CAST(96.31 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10126, N'S32_3522', 26, CAST(62.70 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10126, N'S700_2824', 45, CAST(102.16 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10127, N'S12_1108', 46, CAST(245.20 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10127, N'S12_3148', 46, CAST(160.14 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10127, N'S12_3891', 42, CAST(193.78 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10127, N'S12_4473', 24, CAST(106.65 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10127, N'S18_2238', 45, CAST(158.82 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10127, N'S18_2319', 45, CAST(139.91 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10127, N'S18_3232', 22, CAST(174.42 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10127, N'S18_4027', 25, CAST(137.88 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10127, N'S24_1444', 20, CAST(60.69 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10127, N'S24_2840', 39, CAST(38.19 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10127, N'S24_4048', 20, CAST(96.99 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10127, N'S32_2509', 45, CAST(51.95 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10127, N'S32_3207', 29, CAST(70.84 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10127, N'S50_1392', 46, CAST(134.27 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10127, N'S50_1514', 46, CAST(69.12 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10128, N'S18_3140', 41, CAST(135.22 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10128, N'S18_3259', 41, CAST(117.98 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10128, N'S18_4522', 43, CAST(92.16 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10128, N'S700_1938', 32, CAST(97.00 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10129, N'S10_4757', 33, CAST(133.28 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10129, N'S24_2011', 45, CAST(133.95 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10129, N'S24_3151', 41, CAST(94.71 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10129, N'S24_3816', 50, CAST(77.99 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10129, N'S700_1138', 31, CAST(60.00 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10129, N'S700_2610', 45, CAST(85.29 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10129, N'S700_3505', 42, CAST(91.15 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10129, N'S700_3962', 30, CAST(85.41 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10129, N'S72_3212', 32, CAST(64.97 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10130, N'S18_3029', 40, CAST(96.34 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10130, N'S18_3856', 33, CAST(103.75 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10131, N'S18_1662', 21, CAST(132.46 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10131, N'S24_2841', 35, CAST(67.14 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10131, N'S24_3420', 29, CAST(59.18 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10131, N'S24_3949', 50, CAST(81.89 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10131, N'S700_2047', 22, CAST(85.99 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10131, N'S700_2466', 40, CAST(110.69 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10131, N'S700_4002', 26, CAST(85.13 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10131, N'S72_1253', 21, CAST(41.71 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10132, N'S700_3167', 36, CAST(68.80 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10133, N'S18_2581', 49, CAST(69.27 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10133, N'S24_1785', 41, CAST(94.10 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10133, N'S24_4278', 46, CAST(77.52 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10133, N'S32_1374', 23, CAST(114.87 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10133, N'S32_4289', 49, CAST(57.10 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10133, N'S50_1341', 27, CAST(50.19 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10133, N'S700_1691', 24, CAST(77.64 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10133, N'S700_2834', 27, CAST(99.67 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10134, N'S10_1678', 41, CAST(94.74 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10134, N'S10_2016', 27, CAST(122.51 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10134, N'S10_4698', 31, CAST(226.58 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10134, N'S12_2823', 20, CAST(135.56 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10134, N'S18_2625', 30, CAST(61.78 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10134, N'S24_1578', 35, CAST(93.54 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10134, N'S24_2000', 43, CAST(83.03 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10135, N'S12_1099', 42, CAST(190.68 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10135, N'S12_3380', 48, CAST(125.66 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10135, N'S12_3990', 24, CAST(75.01 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10135, N'S12_4675', 29, CAST(97.89 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10135, N'S18_1889', 48, CAST(79.31 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10135, N'S18_3278', 45, CAST(78.00 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10135, N'S18_3482', 42, CAST(129.35 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10135, N'S18_3782', 45, CAST(50.36 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10135, N'S18_4721', 31, CAST(151.78 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10135, N'S24_2360', 29, CAST(61.64 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10135, N'S24_2972', 20, CAST(35.87 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10135, N'S24_3371', 27, CAST(66.13 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10135, N'S24_3856', 47, CAST(134.81 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10135, N'S24_4620', 23, CAST(87.31 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10135, N'S32_2206', 33, CAST(40.23 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10135, N'S32_4485', 30, CAST(89.80 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10135, N'S50_4713', 44, CAST(96.00 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10136, N'S18_1129', 25, CAST(145.79 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10136, N'S18_1984', 36, CAST(146.52 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10136, N'S18_3232', 41, CAST(203.21 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10137, N'S18_1589', 44, CAST(99.55 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10137, N'S18_2870', 37, CAST(117.48 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10137, N'S18_3685', 31, CAST(165.30 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10137, N'S24_1628', 26, CAST(49.81 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10138, N'S18_1749', 33, CAST(161.50 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10138, N'S18_2248', 22, CAST(48.43 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10138, N'S18_2325', 38, CAST(108.06 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10138, N'S18_4409', 47, CAST(100.31 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10138, N'S18_4933', 23, CAST(66.99 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10138, N'S24_1046', 45, CAST(84.51 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10138, N'S24_1937', 22, CAST(29.21 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10138, N'S24_2022', 33, CAST(43.01 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10138, N'S24_2766', 28, CAST(104.50 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10138, N'S24_2887', 30, CAST(138.58 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10138, N'S24_3191', 49, CAST(90.75 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10138, N'S24_3432', 21, CAST(118.86 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10138, N'S24_3969', 29, CAST(38.16 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10139, N'S18_1342', 31, CAST(102.74 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10139, N'S18_1367', 49, CAST(43.13 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10139, N'S18_2795', 41, CAST(194.06 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10139, N'S18_2949', 46, CAST(120.56 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10139, N'S18_2957', 20, CAST(71.20 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10139, N'S18_3136', 20, CAST(90.06 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10139, N'S18_3320', 30, CAST(103.18 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10139, N'S24_4258', 29, CAST(112.97 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10140, N'S10_1949', 37, CAST(199.30 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10140, N'S10_4962', 26, CAST(122.62 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10140, N'S12_1666', 38, CAST(127.10 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10140, N'S18_1097', 32, CAST(130.67 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10140, N'S18_2432', 46, CAST(61.99 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10140, N'S18_4600', 40, CAST(115.03 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10140, N'S18_4668', 29, CAST(43.27 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10140, N'S24_2300', 47, CAST(108.62 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10140, N'S32_1268', 26, CAST(108.83 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10140, N'S32_3522', 28, CAST(60.76 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10140, N'S700_2824', 36, CAST(114.30 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10141, N'S12_4473', 21, CAST(101.91 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10141, N'S18_2238', 39, CAST(152.27 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10141, N'S18_2319', 47, CAST(133.78 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10141, N'S18_3232', 34, CAST(142.25 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10141, N'S24_1444', 20, CAST(54.33 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10141, N'S24_2840', 21, CAST(42.43 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10141, N'S24_4048', 40, CAST(94.62 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10141, N'S32_2509', 24, CAST(45.99 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10141, N'S50_1392', 44, CAST(125.01 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10142, N'S12_1108', 33, CAST(243.13 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10142, N'S12_3148', 33, CAST(151.08 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10142, N'S12_3891', 46, CAST(205.89 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10142, N'S18_3140', 47, CAST(128.39 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10142, N'S18_3259', 22, CAST(97.81 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10142, N'S18_4027', 24, CAST(157.98 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10142, N'S18_4522', 24, CAST(70.22 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10142, N'S24_2011', 33, CAST(102.00 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10142, N'S24_3151', 49, CAST(98.25 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10142, N'S32_3207', 42, CAST(74.57 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10142, N'S50_1514', 42, CAST(49.79 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10142, N'S700_1138', 41, CAST(64.00 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10142, N'S700_1938', 43, CAST(84.01 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10142, N'S700_3505', 21, CAST(111.19 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10142, N'S700_3962', 38, CAST(85.41 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10142, N'S72_3212', 39, CAST(44.23 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10143, N'S10_4757', 49, CAST(114.24 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10143, N'S18_1662', 32, CAST(164.00 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10143, N'S18_3029', 46, CAST(74.84 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10143, N'S18_3856', 34, CAST(101.64 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10143, N'S24_2841', 27, CAST(60.97 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10143, N'S24_3420', 33, CAST(77.59 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10143, N'S24_3816', 23, CAST(80.51 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10143, N'S24_3949', 28, CAST(66.19 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10143, N'S50_1341', 34, CAST(36.66 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10143, N'S700_1691', 36, CAST(109.61 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10143, N'S700_2047', 26, CAST(100.48 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10143, N'S700_2466', 26, CAST(82.77 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10143, N'S700_2610', 31, CAST(85.29 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10143, N'S700_3167', 28, CAST(96.00 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10143, N'S700_4002', 34, CAST(85.87 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10143, N'S72_1253', 37, CAST(50.65 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10144, N'S32_4289', 20, CAST(81.86 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10145, N'S10_1678', 45, CAST(83.26 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10145, N'S10_2016', 37, CAST(140.35 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10145, N'S10_4698', 33, CAST(156.86 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10145, N'S12_2823', 49, CAST(170.20 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10145, N'S18_2581', 30, CAST(85.32 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10145, N'S18_2625', 30, CAST(49.67 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10145, N'S24_1578', 43, CAST(95.80 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10145, N'S24_1785', 40, CAST(87.54 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10145, N'S24_2000', 47, CAST(83.03 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10145, N'S24_2360', 27, CAST(60.95 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10145, N'S24_4278', 33, CAST(84.77 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10145, N'S32_1374', 33, CAST(93.90 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10145, N'S32_2206', 31, CAST(35.80 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10145, N'S32_4485', 27, CAST(120.42 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10145, N'S50_4713', 38, CAST(81.36 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10145, N'S700_2834', 20, CAST(137.63 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10146, N'S18_3782', 47, CAST(67.14 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10146, N'S18_4721', 29, CAST(153.26 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10147, N'S12_1099', 48, CAST(192.62 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10147, N'S12_3380', 31, CAST(112.74 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10147, N'S12_3990', 21, CAST(63.84 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10147, N'S12_4675', 33, CAST(97.89 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10147, N'S18_1889', 26, CAST(82.39 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10147, N'S18_3278', 36, CAST(86.04 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10147, N'S18_3482', 37, CAST(119.06 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10147, N'S24_2972', 25, CAST(42.67 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10147, N'S24_3371', 30, CAST(68.58 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10147, N'S24_3856', 23, CAST(126.39 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10147, N'S24_4620', 31, CAST(64.67 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10148, N'S18_1129', 23, CAST(117.48 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10148, N'S18_1589', 47, CAST(124.44 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10148, N'S18_1984', 25, CAST(169.28 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10148, N'S18_2870', 27, CAST(130.68 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10148, N'S18_3232', 32, CAST(169.34 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10148, N'S18_3685', 28, CAST(129.98 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10148, N'S18_4409', 34, CAST(105.83 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10148, N'S18_4933', 29, CAST(81.25 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10148, N'S24_1046', 25, CAST(60.26 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10148, N'S24_1628', 47, CAST(56.85 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10148, N'S24_2766', 21, CAST(73.60 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10148, N'S24_2887', 34, CAST(129.18 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10148, N'S24_3191', 31, CAST(73.62 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10148, N'S24_3432', 27, CAST(128.50 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10149, N'S18_1342', 50, CAST(118.15 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10149, N'S18_1367', 30, CAST(58.22 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10149, N'S18_1749', 34, CAST(158.10 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10149, N'S18_2248', 24, CAST(62.36 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10149, N'S18_2325', 33, CAST(150.01 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10149, N'S18_2795', 23, CAST(183.94 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10149, N'S18_3320', 42, CAST(94.25 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10149, N'S24_1937', 36, CAST(33.19 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10149, N'S24_2022', 49, CAST(49.28 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10149, N'S24_3969', 26, CAST(38.98 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10149, N'S24_4258', 20, CAST(90.57 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10150, N'S10_1949', 45, CAST(244.30 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10150, N'S10_4962', 20, CAST(159.56 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10150, N'S12_1666', 30, CAST(136.67 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10150, N'S18_1097', 34, CAST(136.50 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10150, N'S18_2949', 47, CAST(91.18 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10150, N'S18_2957', 30, CAST(49.97 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10150, N'S18_3136', 26, CAST(107.86 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10150, N'S18_4600', 49, CAST(131.98 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10150, N'S18_4668', 30, CAST(42.76 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10150, N'S32_3522', 49, CAST(58.18 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10150, N'S700_2824', 20, CAST(105.20 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10151, N'S12_4473', 24, CAST(138.65 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10151, N'S18_2238', 43, CAST(165.37 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10151, N'S18_2319', 49, CAST(110.46 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10151, N'S18_2432', 39, CAST(69.28 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10151, N'S18_3232', 21, CAST(177.81 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10151, N'S24_2300', 42, CAST(121.40 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10151, N'S24_2840', 30, CAST(40.31 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10151, N'S32_1268', 27, CAST(113.65 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10151, N'S32_2509', 41, CAST(63.85 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10151, N'S50_1392', 26, CAST(123.85 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10152, N'S18_4027', 35, CAST(129.26 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10152, N'S24_1444', 25, CAST(65.31 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10152, N'S24_4048', 23, CAST(121.83 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10152, N'S32_3207', 33, CAST(50.95 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10153, N'S12_1108', 20, CAST(245.20 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10153, N'S12_3148', 42, CAST(128.42 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10153, N'S12_3891', 49, CAST(143.61 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10153, N'S18_3140', 31, CAST(117.47 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10153, N'S18_3259', 29, CAST(88.74 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10153, N'S18_4522', 22, CAST(83.38 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10153, N'S24_2011', 40, CAST(136.41 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10153, N'S50_1514', 31, CAST(57.41 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10153, N'S700_1138', 43, CAST(64.67 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10153, N'S700_1938', 31, CAST(87.48 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10153, N'S700_3505', 50, CAST(88.15 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10153, N'S700_3962', 20, CAST(110.23 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10153, N'S72_3212', 50, CAST(60.06 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10154, N'S24_3151', 31, CAST(91.17 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10154, N'S700_2610', 36, CAST(64.33 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10155, N'S10_4757', 32, CAST(141.44 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10155, N'S18_1662', 38, CAST(171.88 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10155, N'S18_3029', 44, CAST(79.14 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10155, N'S18_3856', 29, CAST(124.93 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10155, N'S24_2841', 23, CAST(72.62 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10155, N'S24_3420', 34, CAST(55.89 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10155, N'S24_3816', 37, CAST(67.93 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10155, N'S24_3949', 44, CAST(77.11 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10155, N'S700_2047', 32, CAST(91.43 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10155, N'S700_2466', 20, CAST(117.67 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10155, N'S700_3167', 43, CAST(86.40 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10155, N'S700_4002', 44, CAST(85.87 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10155, N'S72_1253', 34, CAST(49.16 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10156, N'S50_1341', 20, CAST(41.02 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10156, N'S700_1691', 48, CAST(103.21 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10157, N'S18_2581', 33, CAST(78.57 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10157, N'S24_1785', 40, CAST(102.85 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10157, N'S24_4278', 33, CAST(86.22 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10157, N'S32_1374', 34, CAST(118.87 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10157, N'S32_4289', 28, CAST(74.98 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10157, N'S700_2834', 48, CAST(124.58 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10158, N'S24_2000', 22, CAST(67.03 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10159, N'S10_1678', 49, CAST(106.23 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10159, N'S10_2016', 37, CAST(135.59 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10159, N'S10_4698', 22, CAST(187.85 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10159, N'S12_1099', 41, CAST(202.35 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10159, N'S12_2823', 38, CAST(164.18 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10159, N'S12_3990', 24, CAST(73.42 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10159, N'S18_2625', 42, CAST(51.48 AS Decimal(20, 2)), 18)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10159, N'S18_3278', 21, CAST(81.21 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10159, N'S18_3482', 25, CAST(145.52 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10159, N'S18_3782', 21, CAST(64.66 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10159, N'S18_4721', 32, CAST(144.34 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10159, N'S24_1578', 44, CAST(121.72 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10159, N'S24_2360', 27, CAST(80.34 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10159, N'S24_3371', 50, CAST(69.80 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10159, N'S24_4620', 23, CAST(67.10 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10159, N'S32_2206', 35, CAST(35.40 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10159, N'S32_4485', 23, CAST(102.05 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10159, N'S50_4713', 31, CAST(71.60 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10160, N'S12_3380', 46, CAST(115.09 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10160, N'S12_4675', 50, CAST(103.64 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10160, N'S18_1889', 38, CAST(88.55 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10160, N'S18_3232', 20, CAST(199.82 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10160, N'S24_2972', 42, CAST(37.00 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10160, N'S24_3856', 35, CAST(136.22 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10161, N'S18_1129', 28, CAST(134.46 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10161, N'S18_1589', 43, CAST(143.11 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10161, N'S18_1984', 48, CAST(128.03 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10161, N'S18_2870', 23, CAST(138.60 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10161, N'S18_3685', 36, CAST(154.00 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10161, N'S18_4933', 25, CAST(80.54 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10161, N'S24_1046', 37, CAST(72.76 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10161, N'S24_1628', 23, CAST(53.33 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10161, N'S24_2766', 20, CAST(107.23 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10161, N'S24_2887', 25, CAST(110.39 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10161, N'S24_3191', 20, CAST(77.05 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10161, N'S24_3432', 30, CAST(104.94 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10162, N'S18_1342', 48, CAST(91.44 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10162, N'S18_1367', 45, CAST(51.21 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10162, N'S18_1749', 29, CAST(178.50 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10162, N'S18_2248', 27, CAST(69.62 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10162, N'S18_2325', 38, CAST(113.15 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10162, N'S18_2795', 48, CAST(150.19 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10162, N'S18_4409', 39, CAST(100.31 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10162, N'S24_1937', 37, CAST(27.22 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10162, N'S24_2022', 43, CAST(36.29 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10162, N'S24_3969', 37, CAST(38.98 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10163, N'S10_1949', 21, CAST(231.44 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10163, N'S18_2949', 31, CAST(107.39 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10163, N'S18_2957', 48, CAST(69.96 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10163, N'S18_3136', 40, CAST(122.52 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10163, N'S18_3320', 43, CAST(116.08 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10163, N'S24_4258', 42, CAST(91.55 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10164, N'S10_4962', 21, CAST(168.42 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10164, N'S12_1666', 49, CAST(133.94 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10164, N'S18_1097', 36, CAST(99.17 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10164, N'S18_4600', 45, CAST(111.39 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10164, N'S18_4668', 25, CAST(53.83 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10164, N'S32_1268', 24, CAST(109.79 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10164, N'S32_3522', 49, CAST(54.94 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10164, N'S700_2824', 39, CAST(81.93 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10165, N'S12_1108', 44, CAST(195.33 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10165, N'S12_3148', 34, CAST(143.53 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10165, N'S12_3891', 27, CAST(205.89 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10165, N'S12_4473', 48, CAST(142.20 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10165, N'S18_2238', 29, CAST(173.55 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10165, N'S18_2319', 46, CAST(130.09 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10165, N'S18_2432', 31, CAST(71.10 AS Decimal(20, 2)), 18)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10165, N'S18_3232', 47, CAST(186.27 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10165, N'S18_3259', 50, CAST(106.89 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10165, N'S18_4027', 28, CAST(119.20 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10165, N'S24_1444', 25, CAST(69.36 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10165, N'S24_2300', 32, CAST(145.68 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10165, N'S24_2840', 27, CAST(31.82 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10165, N'S24_4048', 24, CAST(99.36 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10165, N'S32_2509', 48, CAST(45.99 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10165, N'S32_3207', 44, CAST(53.44 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10165, N'S50_1392', 48, CAST(94.92 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10165, N'S50_1514', 38, CAST(66.78 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10166, N'S18_3140', 43, CAST(161.18 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10166, N'S18_4522', 26, CAST(73.73 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10166, N'S700_1938', 29, CAST(103.93 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10167, N'S10_4757', 44, CAST(134.64 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10167, N'S18_1662', 43, CAST(134.04 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10167, N'S18_3029', 46, CAST(73.12 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10167, N'S18_3856', 34, CAST(105.87 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10167, N'S24_2011', 33, CAST(115.52 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10167, N'S24_2841', 21, CAST(69.88 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10167, N'S24_3151', 20, CAST(79.66 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10167, N'S24_3420', 32, CAST(63.12 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10167, N'S24_3816', 29, CAST(83.86 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10167, N'S700_1138', 43, CAST(75.34 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10167, N'S700_2047', 29, CAST(101.38 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10167, N'S700_2610', 46, CAST(70.11 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10167, N'S700_3505', 24, CAST(117.20 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10167, N'S700_3962', 28, CAST(107.25 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10167, N'S72_1253', 40, CAST(41.71 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10167, N'S72_3212', 38, CAST(48.59 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10168, N'S10_1678', 36, CAST(96.66 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10168, N'S10_2016', 27, CAST(135.59 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10168, N'S10_4698', 20, CAST(209.15 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10168, N'S18_2581', 21, CAST(70.96 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10168, N'S18_2625', 46, CAST(61.18 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10168, N'S24_1578', 50, CAST(114.95 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10168, N'S24_1785', 49, CAST(131.30 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10168, N'S24_2000', 29, CAST(75.41 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10168, N'S24_3949', 27, CAST(73.02 AS Decimal(20, 2)), 18)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10168, N'S24_4278', 48, CAST(78.25 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10168, N'S32_1374', 28, CAST(115.87 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10168, N'S32_4289', 31, CAST(73.61 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10168, N'S50_1341', 48, CAST(51.93 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10168, N'S700_1691', 28, CAST(98.65 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10168, N'S700_2466', 31, CAST(110.69 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10168, N'S700_2834', 36, CAST(125.77 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10168, N'S700_3167', 48, CAST(96.00 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10168, N'S700_4002', 39, CAST(82.91 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10169, N'S12_1099', 30, CAST(167.33 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10169, N'S12_2823', 35, CAST(132.55 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10169, N'S12_3990', 36, CAST(63.84 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10169, N'S18_3278', 32, CAST(70.76 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10169, N'S18_3482', 36, CAST(123.47 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10169, N'S18_3782', 38, CAST(68.39 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10169, N'S18_4721', 33, CAST(148.80 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10169, N'S24_2360', 38, CAST(74.11 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10169, N'S24_3371', 34, CAST(50.21 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10169, N'S24_4620', 24, CAST(94.58 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10169, N'S32_2206', 26, CAST(39.83 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10169, N'S32_4485', 34, CAST(115.32 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10169, N'S50_4713', 48, CAST(80.55 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10170, N'S12_3380', 47, CAST(116.27 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10170, N'S12_4675', 41, CAST(107.10 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10170, N'S18_1889', 20, CAST(63.14 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10170, N'S24_3856', 34, CAST(112.34 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10171, N'S18_1129', 35, CAST(128.80 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10171, N'S18_1984', 35, CAST(133.72 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10171, N'S18_3232', 39, CAST(140.55 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10171, N'S24_2972', 36, CAST(35.49 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10172, N'S18_1589', 42, CAST(118.22 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10172, N'S18_2870', 39, CAST(154.44 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10172, N'S18_3685', 48, CAST(114.44 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10172, N'S24_1046', 32, CAST(75.69 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10172, N'S24_1628', 34, CAST(42.76 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10172, N'S24_2766', 22, CAST(74.51 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10172, N'S24_3191', 24, CAST(81.33 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10172, N'S24_3432', 22, CAST(98.51 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10173, N'S18_1342', 43, CAST(117.12 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10173, N'S18_1367', 48, CAST(44.21 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10173, N'S18_1749', 24, CAST(146.20 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10173, N'S18_2248', 26, CAST(57.51 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10173, N'S18_2325', 31, CAST(144.93 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10173, N'S18_2795', 22, CAST(156.94 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10173, N'S18_2957', 28, CAST(53.72 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10173, N'S18_3136', 31, CAST(89.01 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10173, N'S18_3320', 29, CAST(95.24 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10173, N'S18_4409', 21, CAST(75.46 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10173, N'S18_4933', 39, CAST(71.98 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10173, N'S24_1937', 31, CAST(31.53 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10173, N'S24_2022', 27, CAST(41.22 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10173, N'S24_2887', 23, CAST(118.61 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10173, N'S24_3969', 35, CAST(33.23 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10173, N'S24_4258', 22, CAST(116.87 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10174, N'S10_1949', 34, CAST(235.73 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10174, N'S12_1666', 43, CAST(158.54 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10174, N'S18_1097', 48, CAST(93.34 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10174, N'S18_2949', 46, CAST(121.57 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10174, N'S18_4668', 49, CAST(44.78 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10175, N'S10_4962', 33, CAST(162.51 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10175, N'S12_4473', 26, CAST(136.28 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10175, N'S18_2319', 48, CAST(122.73 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10175, N'S18_2432', 41, CAST(69.28 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10175, N'S18_3232', 29, CAST(152.41 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10175, N'S18_4600', 47, CAST(108.97 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10175, N'S24_2300', 28, CAST(106.07 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10175, N'S24_2840', 37, CAST(31.12 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10175, N'S32_1268', 22, CAST(110.76 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10175, N'S32_2509', 50, CAST(63.31 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10175, N'S32_3522', 29, CAST(74.98 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10175, N'S700_2824', 42, CAST(85.98 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10176, N'S12_1108', 33, CAST(226.50 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10176, N'S12_3148', 47, CAST(178.27 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10176, N'S12_3891', 50, CAST(157.45 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10176, N'S18_2238', 20, CAST(183.38 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10176, N'S18_4027', 36, CAST(153.67 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10176, N'S24_1444', 27, CAST(68.78 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10176, N'S24_4048', 29, CAST(100.54 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10176, N'S32_3207', 22, CAST(64.00 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10176, N'S50_1392', 23, CAST(135.43 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10176, N'S50_1514', 38, CAST(64.44 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10177, N'S18_3140', 23, CAST(159.81 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10177, N'S18_3259', 29, CAST(105.88 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10177, N'S18_4522', 35, CAST(74.60 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10177, N'S24_2011', 50, CAST(121.66 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10177, N'S24_3151', 45, CAST(72.58 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10177, N'S700_1138', 24, CAST(76.00 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10177, N'S700_1938', 31, CAST(88.34 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10177, N'S700_2610', 32, CAST(76.62 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10177, N'S700_3505', 44, CAST(92.16 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10177, N'S700_3962', 24, CAST(105.27 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10177, N'S72_3212', 40, CAST(50.23 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10178, N'S10_4757', 24, CAST(145.52 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10178, N'S18_1662', 42, CAST(154.54 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10178, N'S18_3029', 41, CAST(81.72 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10178, N'S18_3856', 48, CAST(112.22 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10178, N'S24_2841', 34, CAST(80.84 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10178, N'S24_3420', 27, CAST(73.64 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10178, N'S24_3816', 21, CAST(72.12 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10178, N'S24_3949', 30, CAST(72.33 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10178, N'S700_2047', 34, CAST(96.86 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10178, N'S700_2466', 22, CAST(87.75 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10178, N'S700_4002', 45, CAST(76.25 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10178, N'S72_1253', 45, CAST(51.15 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10179, N'S18_2581', 24, CAST(78.57 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10179, N'S24_1785', 47, CAST(124.74 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10179, N'S24_4278', 27, CAST(84.77 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10179, N'S32_1374', 45, CAST(119.87 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10179, N'S32_4289', 24, CAST(72.23 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10179, N'S50_1341', 34, CAST(42.77 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10179, N'S700_1691', 23, CAST(107.78 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10179, N'S700_2834', 25, CAST(105.60 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10179, N'S700_3167', 39, CAST(68.80 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10180, N'S10_1678', 29, CAST(86.13 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10180, N'S10_2016', 42, CAST(111.80 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10180, N'S10_4698', 41, CAST(216.90 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10180, N'S12_2823', 40, CAST(168.69 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10180, N'S18_2625', 25, CAST(64.20 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10180, N'S18_3782', 21, CAST(50.36 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10180, N'S18_4721', 44, CAST(126.48 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10180, N'S24_1578', 48, CAST(111.57 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10180, N'S24_2000', 28, CAST(68.55 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10180, N'S24_2360', 35, CAST(72.03 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10180, N'S24_4620', 28, CAST(71.14 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10180, N'S32_2206', 34, CAST(45.46 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10180, N'S32_4485', 22, CAST(114.30 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10180, N'S50_4713', 21, CAST(93.56 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10181, N'S12_1099', 27, CAST(200.41 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10181, N'S12_3380', 28, CAST(102.17 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10181, N'S12_3990', 20, CAST(81.40 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10181, N'S12_4675', 36, CAST(124.37 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10181, N'S18_1129', 44, CAST(123.14 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10181, N'S18_1589', 42, CAST(129.42 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10181, N'S18_1889', 22, CAST(73.92 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10181, N'S18_1984', 21, CAST(156.48 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10181, N'S18_2870', 27, CAST(143.88 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10181, N'S18_3232', 45, CAST(140.55 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10181, N'S18_3278', 30, CAST(82.82 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10181, N'S18_3482', 22, CAST(154.34 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10181, N'S18_3685', 39, CAST(148.34 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10181, N'S24_1628', 34, CAST(53.83 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10181, N'S24_2972', 37, CAST(42.67 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10181, N'S24_3371', 23, CAST(65.52 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10181, N'S24_3856', 25, CAST(154.47 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10182, N'S18_1342', 25, CAST(87.33 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10182, N'S18_1367', 32, CAST(54.45 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10182, N'S18_1749', 44, CAST(171.70 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10182, N'S18_2248', 38, CAST(61.15 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10182, N'S18_2325', 20, CAST(110.60 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10182, N'S18_2795', 21, CAST(145.13 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10182, N'S18_3320', 33, CAST(86.31 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10182, N'S18_4409', 36, CAST(109.52 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10182, N'S18_4933', 44, CAST(69.84 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10182, N'S24_1046', 47, CAST(74.22 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10182, N'S24_1937', 39, CAST(36.84 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10182, N'S24_2022', 31, CAST(36.74 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10182, N'S24_2766', 36, CAST(73.60 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10182, N'S24_2887', 20, CAST(119.79 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10182, N'S24_3191', 33, CAST(94.17 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10182, N'S24_3432', 49, CAST(127.43 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10182, N'S24_3969', 23, CAST(42.26 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10183, N'S10_1949', 23, CAST(233.59 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10183, N'S10_4962', 28, CAST(122.62 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10183, N'S12_1666', 41, CAST(150.34 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10183, N'S18_1097', 21, CAST(96.84 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10183, N'S18_2949', 37, CAST(89.15 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10183, N'S18_2957', 39, CAST(68.08 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10183, N'S18_3136', 22, CAST(113.10 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10183, N'S18_4600', 21, CAST(116.24 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10183, N'S18_4668', 40, CAST(49.30 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10183, N'S24_4258', 47, CAST(107.13 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10183, N'S32_3522', 49, CAST(64.64 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10183, N'S700_2824', 23, CAST(86.99 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10184, N'S12_4473', 37, CAST(122.06 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10184, N'S18_2238', 46, CAST(160.46 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10184, N'S18_2319', 46, CAST(130.09 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10184, N'S18_2432', 44, CAST(60.16 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10184, N'S18_3232', 28, CAST(157.49 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10184, N'S24_1444', 31, CAST(60.11 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10184, N'S24_2300', 24, CAST(145.68 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10184, N'S24_2840', 42, CAST(31.82 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10184, N'S24_4048', 49, CAST(118.28 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10184, N'S32_1268', 46, CAST(100.16 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10184, N'S32_2509', 33, CAST(62.77 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10184, N'S32_3207', 48, CAST(50.95 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10184, N'S50_1392', 45, CAST(109.96 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10185, N'S12_1108', 21, CAST(184.94 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10185, N'S12_3148', 33, CAST(122.37 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10185, N'S12_3891', 43, CAST(183.40 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10185, N'S18_3140', 28, CAST(122.93 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10185, N'S18_3259', 49, CAST(80.67 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10185, N'S18_4027', 39, CAST(130.69 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10185, N'S18_4522', 47, CAST(77.24 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10185, N'S24_2011', 30, CAST(105.69 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10185, N'S24_3151', 33, CAST(74.35 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10185, N'S50_1514', 20, CAST(48.62 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10185, N'S700_1138', 21, CAST(54.00 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10185, N'S700_1938', 30, CAST(94.40 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10185, N'S700_2610', 39, CAST(57.82 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10185, N'S700_3505', 37, CAST(105.18 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10185, N'S700_3962', 22, CAST(79.45 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10185, N'S72_3212', 28, CAST(64.43 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10186, N'S10_4757', 26, CAST(148.24 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10186, N'S18_1662', 32, CAST(187.65 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10186, N'S18_3029', 32, CAST(89.46 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10186, N'S18_3856', 46, CAST(106.93 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10186, N'S24_2841', 22, CAST(69.20 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10186, N'S24_3420', 21, CAST(69.04 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10186, N'S24_3816', 36, CAST(85.54 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10186, N'S700_2047', 24, CAST(99.57 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10186, N'S72_1253', 28, CAST(52.14 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10187, N'S18_2581', 45, CAST(93.77 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10187, N'S24_1785', 46, CAST(95.20 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10187, N'S24_3949', 43, CAST(58.00 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10187, N'S24_4278', 33, CAST(59.41 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10187, N'S32_4289', 31, CAST(60.54 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10187, N'S50_1341', 41, CAST(38.84 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10187, N'S700_1691', 34, CAST(92.25 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10187, N'S700_2466', 44, CAST(105.70 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10187, N'S700_3167', 34, CAST(88.00 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10187, N'S700_4002', 44, CAST(71.81 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10188, N'S10_1678', 48, CAST(114.84 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10188, N'S10_2016', 38, CAST(96.34 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10188, N'S10_4698', 45, CAST(193.66 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10188, N'S18_2625', 32, CAST(65.42 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10188, N'S24_1578', 25, CAST(101.43 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10188, N'S24_2000', 40, CAST(91.40 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10188, N'S32_1374', 44, CAST(98.89 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10188, N'S700_2834', 29, CAST(136.45 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10189, N'S12_2823', 28, CAST(161.16 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10190, N'S24_2360', 42, CAST(76.19 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10190, N'S32_2206', 46, CAST(32.99 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10190, N'S32_4485', 42, CAST(85.72 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10190, N'S50_4713', 40, CAST(66.72 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10191, N'S12_1099', 21, CAST(182.90 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10191, N'S12_3380', 40, CAST(139.75 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10191, N'S12_3990', 30, CAST(64.64 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10191, N'S18_3278', 36, CAST(94.88 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10191, N'S18_3482', 23, CAST(148.46 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10191, N'S18_3782', 43, CAST(72.74 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10191, N'S18_4721', 32, CAST(132.43 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10191, N'S24_3371', 48, CAST(60.01 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10191, N'S24_4620', 44, CAST(66.29 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10192, N'S12_4675', 27, CAST(131.28 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10192, N'S18_1129', 22, CAST(150.03 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10192, N'S18_1589', 29, CAST(146.84 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10192, N'S18_1889', 45, CAST(90.86 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10192, N'S18_1984', 47, CAST(157.90 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10192, N'S18_2870', 38, CAST(130.68 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10192, N'S18_3232', 26, CAST(150.71 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10192, N'S18_3685', 45, CAST(118.68 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10192, N'S24_1046', 37, CAST(69.82 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10192, N'S24_1628', 47, CAST(53.83 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10192, N'S24_2766', 46, CAST(83.60 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10192, N'S24_2887', 23, CAST(132.71 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10192, N'S24_2972', 30, CAST(30.59 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10192, N'S24_3191', 32, CAST(72.77 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10192, N'S24_3432', 46, CAST(121.00 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10192, N'S24_3856', 45, CAST(140.43 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10193, N'S18_1342', 28, CAST(110.96 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10193, N'S18_1367', 46, CAST(53.37 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10193, N'S18_1749', 21, CAST(149.60 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10193, N'S18_2248', 42, CAST(59.33 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10193, N'S18_2325', 44, CAST(105.52 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10193, N'S18_2795', 22, CAST(167.06 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10193, N'S18_2949', 28, CAST(93.21 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10193, N'S18_2957', 24, CAST(51.84 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10193, N'S18_3136', 23, CAST(120.43 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10193, N'S18_3320', 32, CAST(79.37 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10193, N'S18_4409', 24, CAST(97.55 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10193, N'S18_4933', 25, CAST(76.26 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10193, N'S24_1937', 26, CAST(29.21 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10193, N'S24_2022', 20, CAST(50.62 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10193, N'S24_3969', 22, CAST(41.03 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10193, N'S24_4258', 20, CAST(113.95 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10194, N'S10_1949', 42, CAST(173.58 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10194, N'S10_4962', 26, CAST(163.99 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10194, N'S12_1666', 38, CAST(129.84 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10194, N'S18_1097', 21, CAST(93.34 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10194, N'S18_2432', 45, CAST(70.49 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10194, N'S18_4600', 32, CAST(133.19 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10194, N'S18_4668', 41, CAST(44.78 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10194, N'S24_2300', 49, CAST(117.57 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10194, N'S32_1268', 37, CAST(97.27 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10194, N'S32_3522', 39, CAST(54.94 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10194, N'S700_2824', 26, CAST(89.01 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10195, N'S12_4473', 49, CAST(131.54 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10195, N'S18_2238', 27, CAST(189.93 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10195, N'S18_2319', 35, CAST(103.09 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10195, N'S18_3232', 50, CAST(152.41 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10195, N'S24_1444', 44, CAST(66.47 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10195, N'S24_2840', 32, CAST(28.29 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10195, N'S24_4048', 34, CAST(108.82 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10195, N'S32_2509', 32, CAST(43.29 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10195, N'S32_3207', 33, CAST(54.68 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10195, N'S50_1392', 49, CAST(105.33 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10196, N'S12_1108', 47, CAST(189.10 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10196, N'S12_3148', 24, CAST(158.63 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10196, N'S12_3891', 38, CAST(190.32 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10196, N'S18_3140', 49, CAST(140.69 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10196, N'S18_3259', 35, CAST(101.85 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10196, N'S18_4027', 27, CAST(168.04 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10196, N'S50_1514', 46, CAST(62.09 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10196, N'S700_1938', 50, CAST(94.40 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10197, N'S10_4757', 45, CAST(118.32 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10197, N'S18_3029', 46, CAST(87.74 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10197, N'S18_3856', 22, CAST(115.40 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10197, N'S18_4522', 50, CAST(101.81 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10197, N'S24_2011', 41, CAST(110.60 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10197, N'S24_3151', 47, CAST(83.20 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10197, N'S24_3816', 22, CAST(86.38 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10197, N'S700_1138', 23, CAST(64.67 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10197, N'S700_2047', 24, CAST(90.52 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10197, N'S700_2610', 50, CAST(78.79 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10197, N'S700_3505', 27, CAST(92.16 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10197, N'S700_3962', 35, CAST(93.35 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10197, N'S72_1253', 29, CAST(41.71 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10197, N'S72_3212', 42, CAST(50.23 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10198, N'S18_1662', 42, CAST(178.19 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10198, N'S24_2841', 48, CAST(67.82 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10198, N'S24_3420', 27, CAST(71.67 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10198, N'S24_3949', 43, CAST(66.19 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10198, N'S700_2466', 42, CAST(113.68 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10198, N'S700_4002', 40, CAST(63.67 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10199, N'S50_1341', 29, CAST(38.40 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10199, N'S700_1691', 48, CAST(83.12 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10199, N'S700_3167', 38, CAST(82.40 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10200, N'S18_2581', 28, CAST(92.93 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10200, N'S24_1785', 33, CAST(98.48 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10200, N'S24_4278', 39, CAST(72.45 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10200, N'S32_1374', 35, CAST(109.88 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10200, N'S32_4289', 27, CAST(67.41 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10200, N'S700_2834', 39, CAST(102.04 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10201, N'S10_1678', 22, CAST(98.57 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10201, N'S10_2016', 24, CAST(126.08 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10201, N'S10_4698', 49, CAST(164.61 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10201, N'S12_2823', 25, CAST(161.16 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10201, N'S18_2625', 30, CAST(64.81 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10201, N'S24_1578', 39, CAST(111.57 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10201, N'S24_2000', 25, CAST(73.88 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10202, N'S18_3782', 30, CAST(54.71 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10202, N'S18_4721', 43, CAST(136.90 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10202, N'S24_2360', 50, CAST(69.26 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10202, N'S24_4620', 50, CAST(87.31 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10202, N'S32_2206', 27, CAST(44.25 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10202, N'S32_4485', 31, CAST(102.05 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10202, N'S50_4713', 40, CAST(89.50 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10203, N'S12_1099', 20, CAST(196.52 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10203, N'S12_3380', 20, CAST(112.74 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10203, N'S12_3990', 44, CAST(82.99 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10203, N'S12_4675', 47, CAST(110.55 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10203, N'S18_1889', 45, CAST(85.47 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10203, N'S18_3232', 48, CAST(172.73 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10203, N'S18_3278', 33, CAST(86.04 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10203, N'S18_3482', 32, CAST(160.22 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10203, N'S24_2972', 21, CAST(37.00 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10203, N'S24_3371', 34, CAST(64.90 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10203, N'S24_3856', 47, CAST(148.86 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10204, N'S18_1129', 42, CAST(147.20 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10204, N'S18_1589', 40, CAST(100.80 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10204, N'S18_1749', 33, CAST(178.50 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10204, N'S18_1984', 38, CAST(169.28 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10204, N'S18_2248', 23, CAST(71.44 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10204, N'S18_2325', 26, CAST(123.32 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10204, N'S18_2870', 27, CAST(154.44 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10204, N'S18_3685', 35, CAST(163.88 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10204, N'S18_4409', 29, CAST(85.59 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10204, N'S18_4933', 45, CAST(76.26 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10204, N'S24_1046', 20, CAST(62.47 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10204, N'S24_1628', 45, CAST(49.81 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10204, N'S24_2766', 47, CAST(96.32 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10204, N'S24_2887', 42, CAST(101.00 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10204, N'S24_3191', 40, CAST(79.62 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10204, N'S24_3432', 48, CAST(91.02 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10204, N'S24_3969', 39, CAST(33.23 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10205, N'S18_1342', 36, CAST(103.77 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10205, N'S18_1367', 48, CAST(63.61 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10205, N'S18_2795', 40, CAST(187.31 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10205, N'S24_1937', 32, CAST(37.17 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10205, N'S24_2022', 24, CAST(38.08 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10206, N'S10_1949', 47, CAST(192.87 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10206, N'S12_1666', 28, CAST(144.87 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10206, N'S18_1097', 34, CAST(116.67 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10206, N'S18_2949', 37, CAST(90.17 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10206, N'S18_2957', 28, CAST(67.46 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10206, N'S18_3136', 30, CAST(119.38 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10206, N'S18_3320', 28, CAST(87.30 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10206, N'S18_4668', 21, CAST(53.33 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10206, N'S24_4258', 33, CAST(97.39 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10206, N'S32_3522', 36, CAST(58.82 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10206, N'S700_2824', 33, CAST(117.33 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10207, N'S10_4962', 31, CAST(131.49 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10207, N'S12_4473', 34, CAST(99.54 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10207, N'S18_2238', 44, CAST(160.46 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10207, N'S18_2319', 43, CAST(133.78 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10207, N'S18_2432', 37, CAST(69.89 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10207, N'S18_3232', 25, CAST(157.49 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10207, N'S18_4027', 40, CAST(153.67 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10207, N'S18_4600', 47, CAST(141.66 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10207, N'S24_1444', 49, CAST(46.82 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10207, N'S24_2300', 46, CAST(148.24 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10207, N'S24_2840', 42, CAST(29.70 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10207, N'S24_4048', 28, CAST(106.45 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10207, N'S32_1268', 49, CAST(80.90 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10207, N'S32_2509', 27, CAST(60.06 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10207, N'S32_3207', 45, CAST(56.55 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10207, N'S50_1392', 28, CAST(94.92 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10208, N'S12_1108', 46, CAST(187.02 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10208, N'S12_3148', 26, CAST(120.86 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10208, N'S12_3891', 20, CAST(155.72 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10208, N'S18_3140', 24, CAST(109.27 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10208, N'S18_3259', 48, CAST(116.97 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10208, N'S18_4522', 45, CAST(87.77 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10208, N'S24_2011', 35, CAST(122.89 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10208, N'S24_3151', 20, CAST(89.40 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10208, N'S50_1514', 30, CAST(65.61 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10208, N'S700_1138', 38, CAST(74.67 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10208, N'S700_1938', 40, CAST(80.55 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10208, N'S700_2610', 46, CAST(74.45 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10208, N'S700_3505', 37, CAST(120.20 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10208, N'S700_3962', 33, CAST(85.41 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10208, N'S72_3212', 42, CAST(63.88 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10209, N'S10_4757', 39, CAST(133.28 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10209, N'S18_3029', 28, CAST(100.64 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10209, N'S18_3856', 20, CAST(124.93 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10209, N'S24_2841', 43, CAST(82.21 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10209, N'S24_3420', 36, CAST(77.59 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10209, N'S24_3816', 22, CAST(89.73 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10209, N'S700_2047', 33, CAST(88.71 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10209, N'S72_1253', 48, CAST(44.69 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10210, N'S10_2016', 23, CAST(130.83 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10210, N'S10_4698', 34, CAST(180.10 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10210, N'S18_1662', 31, CAST(184.50 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10210, N'S18_2581', 50, CAST(76.88 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10210, N'S18_2625', 40, CAST(49.67 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10210, N'S24_1785', 27, CAST(98.48 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10210, N'S24_2000', 30, CAST(61.70 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10210, N'S24_3949', 29, CAST(69.60 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10210, N'S24_4278', 40, CAST(71.00 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10210, N'S32_1374', 46, CAST(79.91 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10210, N'S32_4289', 39, CAST(59.16 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10210, N'S50_1341', 43, CAST(41.02 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10210, N'S700_1691', 21, CAST(78.55 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10210, N'S700_2466', 26, CAST(99.72 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10210, N'S700_2834', 25, CAST(112.72 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10210, N'S700_3167', 31, CAST(86.40 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10210, N'S700_4002', 42, CAST(70.33 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10211, N'S10_1678', 41, CAST(114.84 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10211, N'S12_1099', 41, CAST(182.90 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10211, N'S12_2823', 36, CAST(132.55 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10211, N'S12_3990', 28, CAST(92.57 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10211, N'S18_3278', 35, CAST(78.00 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10211, N'S18_3482', 28, CAST(133.76 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10211, N'S18_3782', 46, CAST(54.09 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10211, N'S18_4721', 41, CAST(138.38 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10211, N'S24_1578', 25, CAST(90.16 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10211, N'S24_2360', 21, CAST(63.72 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10211, N'S24_3371', 48, CAST(48.98 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10211, N'S24_4620', 22, CAST(92.16 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10211, N'S32_2206', 41, CAST(42.24 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10211, N'S32_4485', 37, CAST(109.19 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10211, N'S50_4713', 40, CAST(80.55 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10212, N'S12_3380', 39, CAST(126.84 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10212, N'S12_4675', 33, CAST(126.68 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10212, N'S18_1129', 29, CAST(144.37 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10212, N'S18_1589', 38, CAST(118.22 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10212, N'S18_1889', 20, CAST(66.99 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10212, N'S18_1984', 41, CAST(118.07 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10212, N'S18_2870', 40, CAST(122.76 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10212, N'S18_3232', 40, CAST(138.86 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10212, N'S18_3685', 45, CAST(141.28 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10212, N'S24_1046', 41, CAST(82.31 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10212, N'S24_1628', 45, CAST(53.33 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10212, N'S24_2766', 45, CAST(88.14 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10212, N'S24_2972', 34, CAST(43.42 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10212, N'S24_3191', 27, CAST(79.62 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10212, N'S24_3432', 46, CAST(87.81 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10212, N'S24_3856', 49, CAST(141.83 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10213, N'S18_4409', 38, CAST(94.79 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10213, N'S18_4933', 25, CAST(83.39 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10213, N'S24_2887', 27, CAST(103.35 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10214, N'S18_1749', 30, CAST(198.90 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10214, N'S18_2248', 21, CAST(62.96 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10214, N'S18_2325', 27, CAST(133.49 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10214, N'S18_2795', 50, CAST(190.69 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10214, N'S24_1937', 20, CAST(34.19 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10214, N'S24_2022', 49, CAST(47.94 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10214, N'S24_3969', 44, CAST(34.88 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10215, N'S10_1949', 35, CAST(173.58 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10215, N'S18_1097', 46, CAST(112.00 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10215, N'S18_1342', 27, CAST(89.38 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10215, N'S18_1367', 33, CAST(43.13 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10215, N'S18_2949', 49, CAST(112.45 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10215, N'S18_2957', 31, CAST(58.71 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10215, N'S18_3136', 49, CAST(107.86 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10215, N'S18_3320', 41, CAST(111.12 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10215, N'S18_4668', 46, CAST(45.28 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10215, N'S24_4258', 39, CAST(90.57 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10216, N'S12_1666', 43, CAST(133.94 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10217, N'S10_4962', 48, CAST(146.26 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10217, N'S18_2432', 35, CAST(61.38 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10217, N'S18_4600', 38, CAST(118.66 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10217, N'S24_2300', 28, CAST(112.46 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10217, N'S32_1268', 21, CAST(106.90 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10217, N'S32_3522', 39, CAST(62.05 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10217, N'S700_2824', 31, CAST(88.00 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10218, N'S18_2319', 22, CAST(121.50 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10218, N'S18_3232', 34, CAST(135.47 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10219, N'S12_4473', 48, CAST(101.91 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10219, N'S18_2238', 43, CAST(196.48 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10219, N'S24_2840', 21, CAST(40.31 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10219, N'S32_2509', 35, CAST(55.19 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10220, N'S12_1108', 32, CAST(224.42 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10220, N'S12_3148', 30, CAST(157.12 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10220, N'S12_3891', 27, CAST(186.86 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10220, N'S18_4027', 50, CAST(165.16 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10220, N'S24_1444', 26, CAST(56.07 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10220, N'S24_4048', 37, CAST(136.02 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10220, N'S32_3207', 20, CAST(52.82 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10220, N'S50_1392', 37, CAST(107.65 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10220, N'S50_1514', 30, CAST(68.54 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10221, N'S18_3140', 33, CAST(133.86 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10221, N'S18_3259', 23, CAST(80.67 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10221, N'S18_4522', 39, CAST(89.53 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10221, N'S24_2011', 49, CAST(138.87 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10221, N'S700_1938', 23, CAST(97.00 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10222, N'S10_4757', 49, CAST(122.40 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10222, N'S18_1662', 49, CAST(141.92 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10222, N'S18_3029', 49, CAST(94.62 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10222, N'S18_3856', 45, CAST(85.75 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10222, N'S24_2841', 32, CAST(81.53 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10222, N'S24_3151', 47, CAST(70.81 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10222, N'S24_3420', 43, CAST(70.35 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10222, N'S24_3816', 46, CAST(80.51 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10222, N'S24_3949', 48, CAST(56.64 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10222, N'S700_1138', 31, CAST(62.67 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10222, N'S700_2047', 26, CAST(102.29 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10222, N'S700_2466', 37, CAST(87.75 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10222, N'S700_2610', 36, CAST(80.95 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10222, N'S700_3505', 38, CAST(110.19 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10222, N'S700_3962', 31, CAST(95.34 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10222, N'S700_4002', 43, CAST(74.03 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10222, N'S72_1253', 31, CAST(45.69 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10222, N'S72_3212', 36, CAST(63.34 AS Decimal(20, 2)), 18)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10223, N'S10_1678', 37, CAST(107.18 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10223, N'S10_2016', 47, CAST(115.37 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10223, N'S10_4698', 49, CAST(199.47 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10223, N'S18_2581', 47, CAST(100.53 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10223, N'S18_2625', 28, CAST(60.57 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10223, N'S24_1578', 32, CAST(91.29 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10223, N'S24_1785', 34, CAST(106.14 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10223, N'S24_2000', 38, CAST(69.31 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10223, N'S24_4278', 23, CAST(74.62 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10223, N'S32_1374', 21, CAST(117.87 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10223, N'S32_4289', 20, CAST(66.04 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10223, N'S50_1341', 41, CAST(46.26 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10223, N'S700_1691', 25, CAST(101.39 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10223, N'S700_2834', 29, CAST(110.34 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10223, N'S700_3167', 26, CAST(67.20 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10224, N'S12_2823', 43, CAST(141.58 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10224, N'S18_3782', 38, CAST(58.44 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10224, N'S24_2360', 37, CAST(80.34 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10224, N'S32_2206', 43, CAST(39.43 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10224, N'S32_4485', 30, CAST(111.23 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10224, N'S50_4713', 50, CAST(77.29 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10225, N'S12_1099', 27, CAST(167.33 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10225, N'S12_3380', 25, CAST(99.82 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10225, N'S12_3990', 37, CAST(77.41 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10225, N'S12_4675', 21, CAST(127.83 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10225, N'S18_1129', 32, CAST(141.54 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10225, N'S18_1889', 47, CAST(64.68 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10225, N'S18_3232', 43, CAST(149.02 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10225, N'S18_3278', 37, CAST(95.69 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10225, N'S18_3482', 27, CAST(169.04 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10225, N'S18_4721', 35, CAST(150.29 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10225, N'S24_2972', 42, CAST(36.63 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10225, N'S24_3371', 24, CAST(50.21 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10225, N'S24_3856', 40, CAST(113.75 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10225, N'S24_4620', 46, CAST(70.33 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10226, N'S18_1589', 38, CAST(109.51 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10226, N'S18_1984', 24, CAST(162.17 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10226, N'S18_2870', 24, CAST(134.64 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10226, N'S18_3685', 46, CAST(159.65 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10226, N'S24_1046', 21, CAST(60.26 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10226, N'S24_1628', 36, CAST(43.27 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10226, N'S24_3432', 48, CAST(92.09 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10227, N'S18_1342', 25, CAST(118.15 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10227, N'S18_1367', 31, CAST(48.52 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10227, N'S18_1749', 26, CAST(142.80 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10227, N'S18_2248', 28, CAST(50.85 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10227, N'S18_2325', 46, CAST(152.56 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10227, N'S18_2795', 29, CAST(192.38 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10227, N'S18_3320', 33, CAST(111.12 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10227, N'S18_4409', 34, CAST(104.91 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10227, N'S18_4933', 37, CAST(57.73 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10227, N'S24_1937', 42, CAST(29.21 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10227, N'S24_2022', 24, CAST(48.38 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10227, N'S24_2766', 47, CAST(88.14 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10227, N'S24_2887', 33, CAST(131.53 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10227, N'S24_3191', 40, CAST(79.62 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10227, N'S24_3969', 27, CAST(43.90 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10228, N'S10_1949', 29, CAST(222.87 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10228, N'S18_1097', 32, CAST(105.00 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10228, N'S18_2949', 24, CAST(104.35 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10228, N'S18_2957', 45, CAST(63.71 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10228, N'S18_3136', 31, CAST(102.63 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10228, N'S24_4258', 33, CAST(103.23 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10229, N'S10_4962', 50, CAST(128.53 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10229, N'S12_1666', 25, CAST(138.04 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10229, N'S12_4473', 36, CAST(125.61 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10229, N'S18_2319', 26, CAST(144.82 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10229, N'S18_2432', 28, CAST(59.55 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10229, N'S18_3232', 22, CAST(189.66 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10229, N'S18_4600', 41, CAST(115.03 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10229, N'S18_4668', 39, CAST(40.25 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10229, N'S24_2300', 48, CAST(118.84 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10229, N'S24_2840', 33, CAST(32.88 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10229, N'S32_1268', 25, CAST(111.72 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10229, N'S32_2509', 23, CAST(54.11 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10229, N'S32_3522', 30, CAST(73.04 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10229, N'S700_2824', 50, CAST(112.28 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10230, N'S12_3148', 43, CAST(163.17 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10230, N'S18_2238', 49, CAST(148.99 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10230, N'S18_4027', 42, CAST(172.34 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10230, N'S24_1444', 36, CAST(54.33 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10230, N'S24_4048', 45, CAST(105.27 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10230, N'S32_3207', 46, CAST(60.90 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10230, N'S50_1392', 34, CAST(116.91 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10230, N'S50_1514', 43, CAST(52.14 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10231, N'S12_1108', 42, CAST(199.49 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10231, N'S12_3891', 49, CAST(141.88 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10232, N'S18_3140', 22, CAST(163.91 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10232, N'S18_3259', 48, CAST(95.80 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10232, N'S18_4522', 23, CAST(89.53 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10232, N'S24_2011', 46, CAST(122.89 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10232, N'S700_1938', 26, CAST(88.34 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10232, N'S700_3505', 48, CAST(96.16 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10232, N'S700_3962', 35, CAST(82.43 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10232, N'S72_3212', 24, CAST(49.69 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10233, N'S24_3151', 40, CAST(94.71 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10233, N'S700_1138', 36, CAST(70.67 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10233, N'S700_2610', 29, CAST(82.40 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10234, N'S10_4757', 48, CAST(150.96 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10234, N'S18_1662', 50, CAST(189.23 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10234, N'S18_3029', 48, CAST(74.84 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10234, N'S18_3856', 39, CAST(125.99 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10234, N'S24_2841', 44, CAST(61.66 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10234, N'S24_3420', 25, CAST(57.20 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10234, N'S24_3816', 31, CAST(72.96 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10234, N'S700_2047', 29, CAST(87.80 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10234, N'S72_1253', 40, CAST(56.12 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10235, N'S18_2581', 24, CAST(76.03 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10235, N'S24_1785', 23, CAST(96.29 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10235, N'S24_3949', 33, CAST(60.05 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10235, N'S24_4278', 40, CAST(81.14 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10235, N'S32_1374', 41, CAST(101.89 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10235, N'S32_4289', 34, CAST(77.73 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10235, N'S50_1341', 41, CAST(35.35 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10235, N'S700_1691', 25, CAST(103.21 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10235, N'S700_2466', 38, CAST(88.75 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10235, N'S700_2834', 25, CAST(96.11 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10235, N'S700_3167', 32, CAST(92.00 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10235, N'S700_4002', 34, CAST(72.55 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10236, N'S10_2016', 22, CAST(129.64 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10236, N'S18_2625', 23, CAST(55.72 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10236, N'S24_2000', 36, CAST(87.60 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10237, N'S10_1678', 23, CAST(101.44 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10237, N'S10_4698', 39, CAST(180.10 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10237, N'S12_2823', 32, CAST(131.04 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10237, N'S18_3782', 26, CAST(52.22 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10237, N'S24_1578', 20, CAST(114.95 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10237, N'S24_2360', 26, CAST(79.65 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10237, N'S32_2206', 26, CAST(40.23 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10237, N'S32_4485', 27, CAST(115.32 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10237, N'S50_4713', 20, CAST(68.34 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10238, N'S12_1099', 28, CAST(206.24 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10238, N'S12_3380', 29, CAST(109.22 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10238, N'S12_3990', 20, CAST(74.21 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10238, N'S18_3278', 41, CAST(73.17 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10238, N'S18_3482', 49, CAST(133.76 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10238, N'S18_4721', 44, CAST(144.34 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10238, N'S24_3371', 47, CAST(62.45 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10238, N'S24_4620', 22, CAST(93.77 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10239, N'S12_4675', 21, CAST(93.28 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10239, N'S18_1889', 46, CAST(73.92 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10239, N'S18_3232', 47, CAST(150.71 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10239, N'S24_2972', 20, CAST(44.56 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10239, N'S24_3856', 29, CAST(154.47 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10240, N'S18_1129', 41, CAST(137.29 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10240, N'S18_1984', 37, CAST(149.36 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10240, N'S18_3685', 37, CAST(161.06 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10241, N'S18_1589', 21, CAST(119.46 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10241, N'S18_1749', 41, CAST(185.30 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10241, N'S18_2248', 33, CAST(72.65 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10241, N'S18_2870', 44, CAST(155.76 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10241, N'S18_4409', 42, CAST(90.19 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10241, N'S18_4933', 30, CAST(66.99 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10241, N'S24_1046', 22, CAST(76.43 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10241, N'S24_1628', 21, CAST(40.25 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10241, N'S24_2766', 47, CAST(94.50 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10241, N'S24_2887', 28, CAST(98.65 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10241, N'S24_3191', 26, CAST(81.33 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10241, N'S24_3432', 27, CAST(86.73 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10242, N'S24_3969', 46, CAST(36.93 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10243, N'S18_2325', 47, CAST(130.94 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10243, N'S24_1937', 33, CAST(29.54 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10244, N'S18_1342', 40, CAST(117.12 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10244, N'S18_1367', 20, CAST(58.22 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10244, N'S18_2795', 43, CAST(138.38 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10244, N'S18_2949', 30, CAST(117.52 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10244, N'S18_2957', 24, CAST(58.09 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10244, N'S18_3136', 29, CAST(115.19 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10244, N'S18_3320', 36, CAST(84.33 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10244, N'S24_2022', 39, CAST(45.25 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10244, N'S24_4258', 40, CAST(86.68 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10245, N'S10_1949', 34, CAST(180.01 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10245, N'S10_4962', 28, CAST(163.99 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10245, N'S12_1666', 38, CAST(155.80 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10245, N'S18_1097', 29, CAST(119.00 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10245, N'S18_4600', 21, CAST(113.82 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10245, N'S18_4668', 45, CAST(59.87 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10245, N'S32_1268', 37, CAST(111.72 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10245, N'S32_3522', 44, CAST(69.16 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10245, N'S700_2824', 44, CAST(105.20 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10246, N'S12_4473', 46, CAST(110.21 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10246, N'S18_2238', 40, CAST(163.73 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10246, N'S18_2319', 22, CAST(98.18 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10246, N'S18_2432', 30, CAST(61.99 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10246, N'S18_3232', 36, CAST(198.13 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10246, N'S24_1444', 44, CAST(52.60 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10246, N'S24_2300', 29, CAST(121.40 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10246, N'S24_2840', 49, CAST(36.07 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10246, N'S24_4048', 46, CAST(137.20 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10246, N'S32_2509', 35, CAST(48.70 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10246, N'S50_1392', 22, CAST(133.11 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10247, N'S12_1108', 44, CAST(241.05 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10247, N'S12_3148', 25, CAST(175.25 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10247, N'S12_3891', 27, CAST(153.99 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10247, N'S18_4027', 48, CAST(140.75 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10247, N'S32_3207', 40, CAST(49.71 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10247, N'S50_1514', 49, CAST(63.85 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10248, N'S10_4757', 20, CAST(145.52 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10248, N'S18_3029', 21, CAST(73.98 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10248, N'S18_3140', 32, CAST(118.83 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10248, N'S18_3259', 42, CAST(121.01 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10248, N'S18_4522', 42, CAST(75.48 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10248, N'S24_2011', 48, CAST(145.01 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10248, N'S24_3151', 30, CAST(101.79 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10248, N'S24_3816', 23, CAST(76.31 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10248, N'S700_1138', 36, CAST(71.34 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10248, N'S700_1938', 40, CAST(103.93 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10248, N'S700_2610', 32, CAST(75.89 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10248, N'S700_3505', 30, CAST(108.18 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10248, N'S700_3962', 35, CAST(90.37 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10248, N'S72_3212', 23, CAST(65.52 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10249, N'S18_3856', 46, CAST(121.75 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10249, N'S24_2841', 20, CAST(67.82 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10249, N'S24_3420', 25, CAST(69.70 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10249, N'S700_2047', 40, CAST(95.95 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10249, N'S72_1253', 32, CAST(57.61 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10250, N'S18_1662', 45, CAST(181.34 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10250, N'S18_2581', 27, CAST(98.84 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10250, N'S24_1785', 31, CAST(88.63 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10250, N'S24_2000', 32, CAST(87.60 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10250, N'S24_3949', 40, CAST(75.06 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10250, N'S24_4278', 37, CAST(74.62 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10250, N'S32_1374', 31, CAST(105.88 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10250, N'S32_4289', 50, CAST(61.22 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10250, N'S50_1341', 36, CAST(51.93 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10250, N'S700_1691', 31, CAST(91.34 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10250, N'S700_2466', 35, CAST(111.69 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10250, N'S700_2834', 44, CAST(137.63 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10250, N'S700_3167', 44, CAST(67.20 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10250, N'S700_4002', 38, CAST(62.19 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10251, N'S10_1678', 28, CAST(113.88 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10251, N'S10_2016', 44, CAST(130.83 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10251, N'S10_4698', 43, CAST(164.61 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10251, N'S12_2823', 46, CAST(164.18 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10251, N'S18_2625', 29, CAST(61.18 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10251, N'S24_1578', 26, CAST(101.43 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10252, N'S18_3278', 20, CAST(76.39 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10252, N'S18_3482', 41, CAST(164.63 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10252, N'S18_3782', 31, CAST(52.84 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10252, N'S18_4721', 26, CAST(136.90 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10252, N'S24_2360', 47, CAST(65.80 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10252, N'S24_4620', 38, CAST(87.31 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10252, N'S32_2206', 36, CAST(48.28 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10252, N'S32_4485', 25, CAST(113.28 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10252, N'S50_4713', 48, CAST(72.41 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10253, N'S12_1099', 24, CAST(163.44 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10253, N'S12_3380', 22, CAST(109.22 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10253, N'S12_3990', 25, CAST(90.17 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10253, N'S12_4675', 41, CAST(119.77 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10253, N'S18_1129', 26, CAST(117.48 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10253, N'S18_1589', 24, CAST(140.62 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10253, N'S18_1889', 23, CAST(83.93 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10253, N'S18_1984', 33, CAST(135.14 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10253, N'S18_2870', 37, CAST(139.92 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10253, N'S18_3232', 40, CAST(169.34 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10253, N'S18_3685', 31, CAST(129.98 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10253, N'S24_2972', 40, CAST(42.67 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10253, N'S24_3371', 24, CAST(52.66 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10253, N'S24_3856', 39, CAST(132.00 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10254, N'S18_1749', 49, CAST(142.80 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10254, N'S18_2248', 36, CAST(63.57 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10254, N'S18_2325', 41, CAST(110.60 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10254, N'S18_4409', 34, CAST(92.95 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10254, N'S18_4933', 30, CAST(57.73 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10254, N'S24_1046', 34, CAST(64.67 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10254, N'S24_1628', 32, CAST(60.37 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10254, N'S24_1937', 38, CAST(26.88 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10254, N'S24_2766', 31, CAST(100.87 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10254, N'S24_2887', 33, CAST(96.30 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10254, N'S24_3191', 42, CAST(96.74 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10254, N'S24_3432', 49, CAST(100.66 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10254, N'S24_3969', 20, CAST(43.49 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10255, N'S18_2795', 24, CAST(155.25 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10255, N'S24_2022', 37, CAST(45.70 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10256, N'S18_1342', 34, CAST(95.55 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10256, N'S18_1367', 29, CAST(51.75 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10257, N'S18_2949', 50, CAST(88.14 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10257, N'S18_2957', 49, CAST(53.72 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10257, N'S18_3136', 37, CAST(84.82 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10257, N'S18_3320', 26, CAST(89.29 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10257, N'S24_4258', 46, CAST(78.89 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10258, N'S10_1949', 32, CAST(240.02 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10258, N'S12_1666', 41, CAST(162.64 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10258, N'S18_1097', 41, CAST(133.00 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10258, N'S18_4668', 21, CAST(59.87 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10258, N'S32_3522', 20, CAST(61.41 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10258, N'S700_2824', 45, CAST(80.92 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10259, N'S10_4962', 26, CAST(155.13 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10259, N'S12_4473', 46, CAST(142.20 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10259, N'S18_2238', 30, CAST(189.93 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10259, N'S18_2319', 34, CAST(99.41 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10259, N'S18_2432', 30, CAST(49.22 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10259, N'S18_3232', 27, CAST(135.47 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10259, N'S18_4600', 41, CAST(113.82 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10259, N'S24_1444', 28, CAST(46.82 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10259, N'S24_2300', 47, CAST(112.46 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10259, N'S24_2840', 31, CAST(33.24 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10259, N'S32_1268', 45, CAST(86.68 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10259, N'S32_2509', 40, CAST(43.83 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10259, N'S50_1392', 29, CAST(105.33 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10260, N'S12_1108', 46, CAST(228.58 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10260, N'S12_3148', 30, CAST(170.72 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10260, N'S12_3891', 44, CAST(171.29 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10260, N'S18_3140', 32, CAST(131.13 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10260, N'S18_3259', 29, CAST(88.74 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10260, N'S18_4027', 23, CAST(155.11 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10260, N'S24_4048', 23, CAST(102.90 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10260, N'S32_3207', 27, CAST(57.17 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10260, N'S50_1514', 21, CAST(55.65 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10260, N'S700_1938', 33, CAST(85.74 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10261, N'S10_4757', 27, CAST(125.12 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10261, N'S18_4522', 20, CAST(89.53 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10261, N'S24_2011', 36, CAST(125.35 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10261, N'S24_3151', 22, CAST(91.17 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10261, N'S700_1138', 34, CAST(62.00 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10261, N'S700_2610', 44, CAST(68.67 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10261, N'S700_3505', 25, CAST(88.15 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10261, N'S700_3962', 50, CAST(81.43 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10261, N'S72_3212', 29, CAST(50.78 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10262, N'S18_1662', 49, CAST(134.04 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10262, N'S18_3029', 32, CAST(84.30 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10262, N'S18_3856', 34, CAST(120.69 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10262, N'S24_1785', 34, CAST(97.38 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10262, N'S24_2841', 24, CAST(67.14 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10262, N'S24_3420', 46, CAST(70.35 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10262, N'S24_3816', 49, CAST(87.21 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10262, N'S24_3949', 48, CAST(61.42 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10262, N'S32_4289', 40, CAST(79.11 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10262, N'S50_1341', 49, CAST(37.97 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10262, N'S700_1691', 40, CAST(84.03 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10262, N'S700_2047', 44, CAST(94.14 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10262, N'S700_2466', 33, CAST(90.75 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10262, N'S700_3167', 27, CAST(76.00 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10262, N'S700_4002', 35, CAST(71.07 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10262, N'S72_1253', 21, CAST(57.11 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10263, N'S10_1678', 34, CAST(108.14 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10263, N'S10_2016', 40, CAST(111.80 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10263, N'S10_4698', 41, CAST(203.34 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10263, N'S12_2823', 48, CAST(134.05 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10263, N'S18_2581', 33, CAST(86.17 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10263, N'S18_2625', 34, CAST(58.75 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10263, N'S24_1578', 42, CAST(102.56 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10263, N'S24_2000', 37, CAST(62.46 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10263, N'S24_4278', 24, CAST(75.35 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10263, N'S32_1374', 31, CAST(79.91 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10263, N'S700_2834', 47, CAST(116.28 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10264, N'S18_3782', 48, CAST(54.71 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10264, N'S18_4721', 20, CAST(120.53 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10264, N'S24_2360', 37, CAST(65.10 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10264, N'S24_4620', 47, CAST(83.27 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10264, N'S32_2206', 20, CAST(32.59 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10264, N'S32_4485', 34, CAST(97.97 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10264, N'S50_4713', 47, CAST(89.50 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10265, N'S18_3278', 45, CAST(86.84 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10265, N'S18_3482', 49, CAST(171.98 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10266, N'S12_1099', 44, CAST(208.19 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10266, N'S12_3380', 22, CAST(111.57 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10266, N'S12_3990', 35, CAST(76.61 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10266, N'S12_4675', 40, CAST(111.71 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10266, N'S18_1129', 21, CAST(120.31 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10266, N'S18_1589', 36, CAST(144.35 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10266, N'S18_1889', 33, CAST(74.69 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10266, N'S18_1984', 49, CAST(126.60 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10266, N'S18_2870', 20, CAST(141.24 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10266, N'S18_3232', 29, CAST(165.95 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10266, N'S18_3685', 33, CAST(152.58 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10266, N'S24_1628', 28, CAST(48.30 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10266, N'S24_2972', 34, CAST(40.40 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10266, N'S24_3371', 47, CAST(62.45 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10266, N'S24_3856', 24, CAST(122.17 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10267, N'S18_4933', 36, CAST(75.55 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10267, N'S24_1046', 40, CAST(80.10 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10267, N'S24_2766', 38, CAST(87.24 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10267, N'S24_2887', 43, CAST(108.04 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10267, N'S24_3191', 44, CAST(96.74 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10267, N'S24_3432', 43, CAST(118.86 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10268, N'S18_1342', 49, CAST(117.12 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10268, N'S18_1367', 26, CAST(64.69 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10268, N'S18_1749', 34, CAST(161.50 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10268, N'S18_2248', 31, CAST(49.04 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10268, N'S18_2325', 50, CAST(105.52 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10268, N'S18_2795', 35, CAST(151.88 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10268, N'S18_3320', 39, CAST(89.29 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10268, N'S18_4409', 35, CAST(87.43 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10268, N'S24_1937', 33, CAST(38.83 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10268, N'S24_2022', 40, CAST(46.14 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10268, N'S24_3969', 30, CAST(40.62 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10269, N'S18_2957', 32, CAST(63.08 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10269, N'S24_4258', 48, CAST(97.39 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10270, N'S10_1949', 21, CAST(233.59 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10270, N'S10_4962', 32, CAST(134.44 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10270, N'S12_1666', 28, CAST(146.24 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10270, N'S18_1097', 43, CAST(96.84 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10270, N'S18_2949', 31, CAST(96.24 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10270, N'S18_3136', 38, CAST(125.66 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10270, N'S18_4600', 38, CAST(141.66 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10270, N'S18_4668', 44, CAST(58.36 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10270, N'S32_1268', 32, CAST(85.72 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10270, N'S32_3522', 21, CAST(63.35 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10270, N'S700_2824', 46, CAST(88.00 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10271, N'S12_4473', 31, CAST(97.17 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10271, N'S18_2238', 50, CAST(183.38 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10271, N'S18_2319', 50, CAST(101.87 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10271, N'S18_2432', 25, CAST(69.28 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10271, N'S18_3232', 20, CAST(196.43 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10271, N'S24_1444', 45, CAST(64.74 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10271, N'S24_2300', 43, CAST(130.35 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10271, N'S24_2840', 38, CAST(41.72 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10271, N'S24_4048', 22, CAST(139.57 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10271, N'S32_2509', 35, CAST(47.62 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10271, N'S50_1392', 34, CAST(98.39 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10272, N'S12_1108', 35, CAST(166.24 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10272, N'S12_3148', 27, CAST(158.63 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10272, N'S12_3891', 39, CAST(204.16 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10272, N'S18_4027', 25, CAST(149.36 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10272, N'S32_3207', 45, CAST(64.63 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10272, N'S50_1514', 43, CAST(56.82 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10273, N'S10_4757', 30, CAST(116.96 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10273, N'S18_3029', 34, CAST(98.06 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10273, N'S18_3140', 40, CAST(125.66 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10273, N'S18_3259', 47, CAST(115.97 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10273, N'S18_3856', 50, CAST(85.75 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10273, N'S18_4522', 33, CAST(71.09 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10273, N'S24_2011', 22, CAST(126.58 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10273, N'S24_3151', 27, CAST(103.56 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10273, N'S24_3816', 48, CAST(83.02 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10273, N'S700_1138', 21, CAST(65.34 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10273, N'S700_1938', 21, CAST(102.20 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10273, N'S700_2610', 42, CAST(62.16 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10273, N'S700_3505', 40, CAST(86.15 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10273, N'S700_3962', 26, CAST(114.21 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10273, N'S72_3212', 37, CAST(45.86 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10274, N'S18_1662', 41, CAST(164.00 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10274, N'S24_2841', 40, CAST(65.08 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10274, N'S24_3420', 24, CAST(72.33 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10274, N'S700_2047', 24, CAST(90.52 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10274, N'S72_1253', 32, CAST(58.60 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10275, N'S10_1678', 45, CAST(92.83 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10275, N'S10_2016', 22, CAST(132.02 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10275, N'S10_4698', 36, CAST(191.72 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10275, N'S18_2581', 35, CAST(90.39 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10275, N'S18_2625', 37, CAST(63.60 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10275, N'S24_1578', 21, CAST(102.56 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10275, N'S24_1785', 25, CAST(95.20 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10275, N'S24_2000', 30, CAST(79.98 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10275, N'S24_3949', 41, CAST(81.89 AS Decimal(20, 2)), 18)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10275, N'S24_4278', 27, CAST(62.31 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10275, N'S32_1374', 23, CAST(81.91 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10275, N'S32_4289', 28, CAST(63.97 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10275, N'S50_1341', 38, CAST(45.39 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10275, N'S700_1691', 32, CAST(89.51 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10275, N'S700_2466', 39, CAST(114.68 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10275, N'S700_2834', 48, CAST(132.89 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10275, N'S700_3167', 43, CAST(73.60 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10275, N'S700_4002', 31, CAST(72.55 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10276, N'S12_1099', 50, CAST(192.62 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10276, N'S12_2823', 43, CAST(120.50 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10276, N'S12_3380', 47, CAST(116.27 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10276, N'S12_3990', 38, CAST(83.79 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10276, N'S18_3278', 38, CAST(69.96 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10276, N'S18_3482', 30, CAST(130.82 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10276, N'S18_3782', 33, CAST(50.36 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10276, N'S18_4721', 48, CAST(119.04 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10276, N'S24_2360', 46, CAST(75.49 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10276, N'S24_3371', 20, CAST(61.23 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10276, N'S24_4620', 48, CAST(75.18 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10276, N'S32_2206', 27, CAST(36.61 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10276, N'S32_4485', 38, CAST(113.28 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10276, N'S50_4713', 21, CAST(70.78 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10277, N'S12_4675', 28, CAST(111.71 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10278, N'S18_1129', 34, CAST(137.29 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10278, N'S18_1589', 23, CAST(113.24 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10278, N'S18_1889', 29, CAST(90.86 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10278, N'S18_1984', 29, CAST(129.45 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10278, N'S18_2870', 39, CAST(110.88 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10278, N'S18_3232', 42, CAST(152.41 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10278, N'S18_3685', 31, CAST(132.80 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10278, N'S24_1628', 35, CAST(45.28 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10278, N'S24_2972', 31, CAST(38.89 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10278, N'S24_3856', 25, CAST(126.39 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10279, N'S18_4933', 26, CAST(60.58 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10279, N'S24_1046', 32, CAST(74.96 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10279, N'S24_2766', 49, CAST(79.97 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10279, N'S24_2887', 48, CAST(116.27 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10279, N'S24_3191', 33, CAST(71.06 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10279, N'S24_3432', 48, CAST(128.50 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10280, N'S10_1949', 34, CAST(235.73 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10280, N'S18_1097', 24, CAST(116.67 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10280, N'S18_1342', 50, CAST(104.79 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10280, N'S18_1367', 27, CAST(57.68 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10280, N'S18_1749', 26, CAST(141.10 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10280, N'S18_2248', 25, CAST(62.96 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10280, N'S18_2325', 37, CAST(128.40 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10280, N'S18_2795', 22, CAST(202.50 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10280, N'S18_2949', 46, CAST(111.44 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10280, N'S18_2957', 43, CAST(68.71 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10280, N'S18_3136', 29, CAST(103.67 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10280, N'S18_3320', 34, CAST(102.19 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10280, N'S18_4409', 35, CAST(105.83 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10280, N'S24_1937', 20, CAST(28.88 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10280, N'S24_2022', 45, CAST(47.49 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10280, N'S24_3969', 33, CAST(41.85 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10280, N'S24_4258', 21, CAST(78.89 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10281, N'S10_4962', 44, CAST(159.56 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10281, N'S12_1666', 25, CAST(117.54 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10281, N'S12_4473', 41, CAST(127.98 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10281, N'S18_2319', 48, CAST(120.28 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10281, N'S18_2432', 29, CAST(57.73 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10281, N'S18_3232', 25, CAST(167.65 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10281, N'S18_4600', 25, CAST(99.29 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10281, N'S18_4668', 44, CAST(59.87 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10281, N'S24_2300', 25, CAST(111.18 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10281, N'S24_2840', 20, CAST(40.66 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10281, N'S32_1268', 29, CAST(82.83 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10281, N'S32_2509', 31, CAST(55.19 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10281, N'S32_3522', 36, CAST(77.57 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10281, N'S700_2824', 27, CAST(85.98 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10282, N'S12_1108', 41, CAST(172.47 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10282, N'S12_3148', 27, CAST(161.66 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10282, N'S12_3891', 24, CAST(157.45 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10282, N'S18_2238', 23, CAST(140.81 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10282, N'S18_3140', 43, CAST(155.71 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10282, N'S18_3259', 36, CAST(115.97 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10282, N'S18_4027', 31, CAST(150.80 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10282, N'S24_1444', 29, CAST(46.82 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10282, N'S24_4048', 39, CAST(123.01 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10282, N'S32_3207', 36, CAST(59.65 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10282, N'S50_1392', 38, CAST(113.44 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10282, N'S50_1514', 37, CAST(66.78 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10282, N'S700_1938', 43, CAST(86.61 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10283, N'S10_4757', 25, CAST(119.68 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10283, N'S18_3029', 21, CAST(98.06 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10283, N'S18_3856', 46, CAST(125.99 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10283, N'S18_4522', 34, CAST(105.32 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10283, N'S24_2011', 42, CAST(126.58 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10283, N'S24_3151', 34, CAST(92.94 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10283, N'S24_3816', 33, CAST(72.96 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10283, N'S700_1138', 45, CAST(78.67 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10283, N'S700_2047', 20, CAST(94.14 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10283, N'S700_2610', 47, CAST(65.77 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10283, N'S700_3505', 22, CAST(88.15 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10283, N'S700_3962', 38, CAST(89.38 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10283, N'S72_1253', 43, CAST(57.61 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10283, N'S72_3212', 33, CAST(51.32 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10284, N'S18_1662', 45, CAST(127.73 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10284, N'S18_2581', 31, CAST(71.81 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10284, N'S24_1785', 22, CAST(105.04 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10284, N'S24_2841', 30, CAST(73.99 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10284, N'S24_3420', 39, CAST(71.67 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10284, N'S24_3949', 21, CAST(55.96 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10284, N'S24_4278', 21, CAST(71.00 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10284, N'S32_4289', 50, CAST(81.86 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10284, N'S50_1341', 33, CAST(51.93 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10284, N'S700_1691', 24, CAST(83.12 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10284, N'S700_2466', 45, CAST(101.71 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10284, N'S700_3167', 25, CAST(69.60 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10284, N'S700_4002', 32, CAST(64.41 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10285, N'S10_1678', 36, CAST(113.88 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10285, N'S10_2016', 47, CAST(137.97 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10285, N'S10_4698', 27, CAST(201.41 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10285, N'S12_2823', 49, CAST(140.08 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10285, N'S18_2625', 20, CAST(49.06 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10285, N'S24_1578', 34, CAST(109.32 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10285, N'S24_2000', 39, CAST(70.08 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10285, N'S24_2360', 38, CAST(59.56 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10285, N'S32_1374', 37, CAST(98.89 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10285, N'S32_2206', 37, CAST(41.03 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10285, N'S32_4485', 26, CAST(100.01 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10285, N'S50_4713', 39, CAST(78.92 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10285, N'S700_2834', 45, CAST(119.84 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10286, N'S18_3782', 38, CAST(57.20 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10287, N'S12_1099', 21, CAST(163.44 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10287, N'S12_3380', 45, CAST(105.70 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10287, N'S12_3990', 41, CAST(69.43 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10287, N'S12_4675', 23, CAST(116.31 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10287, N'S18_1129', 41, CAST(158.52 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10287, N'S18_1889', 44, CAST(82.39 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10287, N'S18_1984', 24, CAST(146.52 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10287, N'S18_2870', 44, CAST(114.84 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10287, N'S18_3232', 36, CAST(162.57 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10287, N'S18_3278', 43, CAST(70.76 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10287, N'S18_3482', 40, CAST(169.04 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10287, N'S18_3685', 27, CAST(159.65 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10287, N'S18_4721', 34, CAST(126.48 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10287, N'S24_2972', 36, CAST(39.65 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10287, N'S24_3371', 20, CAST(67.97 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10287, N'S24_3856', 36, CAST(119.37 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10287, N'S24_4620', 40, CAST(88.12 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10288, N'S18_1589', 20, CAST(146.84 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10288, N'S18_1749', 32, CAST(183.60 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10288, N'S18_2248', 28, CAST(61.75 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10288, N'S18_2325', 31, CAST(123.32 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10288, N'S18_4409', 35, CAST(80.99 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10288, N'S18_4933', 23, CAST(73.41 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10288, N'S24_1046', 36, CAST(66.14 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10288, N'S24_1628', 50, CAST(52.32 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10288, N'S24_1937', 29, CAST(38.17 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10288, N'S24_2766', 35, CAST(80.87 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10288, N'S24_2887', 48, CAST(136.23 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10288, N'S24_3191', 34, CAST(68.49 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10288, N'S24_3432', 41, CAST(118.86 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10288, N'S24_3969', 33, CAST(40.62 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10289, N'S18_1342', 38, CAST(120.21 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10289, N'S18_1367', 24, CAST(56.07 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10289, N'S18_2795', 43, CAST(192.38 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10289, N'S24_2022', 45, CAST(48.38 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10290, N'S18_3320', 26, CAST(96.23 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10290, N'S24_4258', 45, CAST(114.92 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10291, N'S10_1949', 37, CAST(192.87 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10291, N'S10_4962', 30, CAST(128.53 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10291, N'S12_1666', 41, CAST(155.80 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10291, N'S18_1097', 41, CAST(114.34 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10291, N'S18_2432', 26, CAST(57.73 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10291, N'S18_2949', 47, CAST(121.57 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10291, N'S18_2957', 37, CAST(50.59 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10291, N'S18_3136', 23, CAST(124.62 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10291, N'S18_4600', 48, CAST(110.18 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10291, N'S18_4668', 29, CAST(51.82 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10291, N'S24_2300', 48, CAST(112.46 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10291, N'S32_1268', 26, CAST(83.79 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10291, N'S32_3522', 32, CAST(71.75 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10291, N'S700_2824', 28, CAST(116.32 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10292, N'S12_4473', 21, CAST(105.47 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10292, N'S18_2238', 26, CAST(175.19 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10292, N'S18_2319', 41, CAST(110.46 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10292, N'S18_3232', 21, CAST(135.47 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10292, N'S18_4027', 44, CAST(162.29 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10292, N'S24_1444', 40, CAST(53.75 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10292, N'S24_2840', 39, CAST(30.06 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10292, N'S24_4048', 27, CAST(141.94 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10292, N'S32_2509', 50, CAST(46.53 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10292, N'S32_3207', 31, CAST(67.73 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10292, N'S50_1392', 41, CAST(121.54 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10292, N'S50_1514', 35, CAST(55.07 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10293, N'S12_1108', 46, CAST(182.86 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10293, N'S12_3148', 24, CAST(176.76 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10293, N'S12_3891', 45, CAST(183.40 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10293, N'S18_3140', 24, CAST(117.47 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10293, N'S18_3259', 22, CAST(109.92 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10293, N'S18_4522', 49, CAST(100.94 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10293, N'S24_2011', 21, CAST(140.09 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10293, N'S700_1938', 29, CAST(71.89 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10293, N'S72_3212', 32, CAST(60.06 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10294, N'S700_3962', 45, CAST(104.28 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10295, N'S10_4757', 24, CAST(142.80 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10295, N'S24_3151', 46, CAST(84.97 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10295, N'S700_1138', 26, CAST(75.34 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10295, N'S700_2610', 44, CAST(58.55 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10295, N'S700_3505', 34, CAST(102.17 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10296, N'S18_1662', 36, CAST(157.69 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10296, N'S18_3029', 21, CAST(96.34 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10296, N'S18_3856', 22, CAST(84.70 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10296, N'S24_2841', 21, CAST(71.25 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10296, N'S24_3420', 31, CAST(53.92 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10296, N'S24_3816', 22, CAST(77.15 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10296, N'S24_3949', 32, CAST(71.65 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10296, N'S50_1341', 26, CAST(48.44 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10296, N'S700_1691', 42, CAST(102.30 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10296, N'S700_2047', 34, CAST(102.29 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10296, N'S700_2466', 24, CAST(101.71 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10296, N'S700_3167', 22, CAST(80.80 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10296, N'S700_4002', 47, CAST(86.62 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10296, N'S72_1253', 21, CAST(45.19 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10297, N'S18_2581', 25, CAST(82.79 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10297, N'S24_1785', 32, CAST(126.93 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10297, N'S24_2000', 32, CAST(65.51 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10297, N'S24_4278', 23, CAST(72.45 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10297, N'S32_1374', 26, CAST(109.88 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10297, N'S32_4289', 28, CAST(79.80 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10297, N'S700_2834', 35, CAST(113.90 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10298, N'S10_2016', 39, CAST(96.34 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10298, N'S18_2625', 32, CAST(48.46 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10299, N'S10_1678', 23, CAST(112.93 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10299, N'S10_4698', 29, CAST(230.46 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10299, N'S12_2823', 24, CAST(173.21 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10299, N'S18_3782', 39, CAST(55.95 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10299, N'S18_4721', 49, CAST(162.19 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10299, N'S24_1578', 47, CAST(116.08 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10299, N'S24_2360', 33, CAST(66.49 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10299, N'S24_4620', 32, CAST(80.84 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10299, N'S32_2206', 24, CAST(42.24 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10299, N'S32_4485', 38, CAST(115.32 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10299, N'S50_4713', 44, CAST(80.55 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10300, N'S12_1099', 33, CAST(167.33 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10300, N'S12_3380', 29, CAST(137.40 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10300, N'S12_3990', 22, CAST(76.61 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10300, N'S12_4675', 23, CAST(122.07 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10300, N'S18_1889', 41, CAST(92.40 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10300, N'S18_3278', 49, CAST(78.80 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10300, N'S18_3482', 23, CAST(164.63 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10300, N'S24_3371', 31, CAST(58.78 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10301, N'S18_1129', 37, CAST(159.94 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10301, N'S18_1589', 32, CAST(107.02 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10301, N'S18_1984', 47, CAST(159.32 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10301, N'S18_2870', 22, CAST(146.52 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10301, N'S18_3232', 23, CAST(174.42 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10301, N'S18_3685', 39, CAST(165.30 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10301, N'S24_1046', 27, CAST(72.02 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10301, N'S24_1628', 22, CAST(51.32 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10301, N'S24_2972', 48, CAST(34.36 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10301, N'S24_3432', 22, CAST(96.37 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10301, N'S24_3856', 50, CAST(154.47 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10302, N'S18_1749', 43, CAST(170.00 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10302, N'S18_4409', 38, CAST(89.27 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10302, N'S18_4933', 23, CAST(72.70 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10302, N'S24_2766', 49, CAST(108.14 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10302, N'S24_2887', 45, CAST(123.31 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10302, N'S24_3191', 48, CAST(74.48 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10303, N'S18_2248', 46, CAST(49.04 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10303, N'S24_3969', 24, CAST(40.21 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10304, N'S10_1949', 47, CAST(216.44 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10304, N'S12_1666', 39, CAST(164.00 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10304, N'S18_1097', 46, CAST(98.00 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10304, N'S18_1342', 37, CAST(95.55 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10304, N'S18_1367', 37, CAST(48.52 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10304, N'S18_2325', 24, CAST(101.70 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10304, N'S18_2795', 20, CAST(178.88 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10304, N'S18_2949', 46, CAST(100.30 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10304, N'S18_2957', 24, CAST(64.96 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10304, N'S18_3136', 26, CAST(85.87 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10304, N'S18_3320', 38, CAST(104.17 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10304, N'S18_4668', 34, CAST(49.30 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10304, N'S24_1937', 23, CAST(30.20 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10304, N'S24_2022', 44, CAST(39.42 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10304, N'S24_4258', 33, CAST(101.29 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10304, N'S32_3522', 36, CAST(73.04 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10304, N'S700_2824', 40, CAST(105.20 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10305, N'S10_4962', 38, CAST(175.81 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10305, N'S12_4473', 38, CAST(125.61 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10305, N'S18_2238', 27, CAST(145.72 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10305, N'S18_2319', 36, CAST(133.78 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10305, N'S18_2432', 41, CAST(53.48 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10305, N'S18_3232', 37, CAST(201.51 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10305, N'S18_4600', 22, CAST(99.29 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10305, N'S24_1444', 45, CAST(61.85 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10305, N'S24_2300', 24, CAST(132.90 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10305, N'S24_2840', 48, CAST(31.47 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10305, N'S24_4048', 36, CAST(128.93 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10305, N'S32_1268', 28, CAST(112.68 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10305, N'S32_2509', 40, CAST(57.90 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10305, N'S50_1392', 42, CAST(109.96 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10306, N'S12_1108', 31, CAST(211.96 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10306, N'S12_3148', 34, CAST(146.55 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10306, N'S12_3891', 20, CAST(181.67 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10306, N'S18_3140', 32, CAST(117.47 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10306, N'S18_3259', 40, CAST(91.76 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10306, N'S18_4027', 23, CAST(156.55 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10306, N'S18_4522', 39, CAST(90.40 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10306, N'S24_2011', 29, CAST(110.60 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10306, N'S24_3151', 31, CAST(84.08 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10306, N'S32_3207', 46, CAST(50.33 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10306, N'S50_1514', 34, CAST(60.34 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10306, N'S700_1138', 50, CAST(54.00 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10306, N'S700_1938', 38, CAST(91.81 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10306, N'S700_2610', 43, CAST(75.17 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10306, N'S700_3505', 32, CAST(90.15 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10306, N'S700_3962', 30, CAST(117.19 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10306, N'S72_3212', 35, CAST(59.51 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10307, N'S10_4757', 22, CAST(122.40 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10307, N'S18_1662', 39, CAST(189.23 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10307, N'S18_3029', 31, CAST(83.44 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10307, N'S18_3856', 48, CAST(86.81 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10307, N'S24_2841', 25, CAST(75.36 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10307, N'S24_3420', 22, CAST(71.67 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10307, N'S24_3816', 22, CAST(91.41 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10307, N'S700_2047', 34, CAST(97.76 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10307, N'S72_1253', 34, CAST(53.63 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10308, N'S10_2016', 34, CAST(118.94 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10308, N'S10_4698', 20, CAST(228.52 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10308, N'S18_2581', 27, CAST(82.79 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10308, N'S18_2625', 34, CAST(52.09 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10308, N'S24_1785', 31, CAST(112.70 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10308, N'S24_2000', 47, CAST(63.22 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10308, N'S24_3949', 43, CAST(76.43 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10308, N'S24_4278', 44, CAST(83.32 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10308, N'S32_1374', 24, CAST(79.91 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10308, N'S32_4289', 46, CAST(66.04 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10308, N'S50_1341', 47, CAST(43.64 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10308, N'S700_1691', 21, CAST(105.95 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10308, N'S700_2466', 35, CAST(88.75 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10308, N'S700_2834', 31, CAST(129.33 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10308, N'S700_3167', 21, CAST(87.20 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10308, N'S700_4002', 39, CAST(68.11 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10309, N'S10_1678', 41, CAST(107.18 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10309, N'S12_2823', 26, CAST(179.24 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10309, N'S24_1578', 21, CAST(126.22 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10309, N'S24_2360', 24, CAST(56.10 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10309, N'S32_4485', 50, CAST(84.70 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10309, N'S50_4713', 28, CAST(88.68 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10310, N'S12_1099', 33, CAST(210.14 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10310, N'S12_3380', 24, CAST(129.18 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10310, N'S12_3990', 49, CAST(81.40 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10310, N'S12_4675', 25, CAST(100.19 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10310, N'S18_1129', 37, CAST(168.43 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10310, N'S18_1889', 20, CAST(91.63 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10310, N'S18_1984', 24, CAST(143.67 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10310, N'S18_3232', 48, CAST(186.27 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10310, N'S18_3278', 27, CAST(80.41 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10310, N'S18_3482', 49, CAST(127.88 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10310, N'S18_3782', 42, CAST(67.14 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10310, N'S18_4721', 40, CAST(133.92 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10310, N'S24_2972', 33, CAST(41.91 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10310, N'S24_3371', 38, CAST(56.94 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10310, N'S24_3856', 45, CAST(122.17 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10310, N'S24_4620', 49, CAST(97.01 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10310, N'S32_2206', 36, CAST(43.05 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10311, N'S18_1589', 29, CAST(100.80 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10311, N'S18_2870', 43, CAST(122.76 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10311, N'S18_3685', 32, CAST(113.02 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10311, N'S18_4409', 41, CAST(81.91 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10311, N'S18_4933', 25, CAST(66.99 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10311, N'S24_1046', 26, CAST(87.45 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10311, N'S24_1628', 45, CAST(49.30 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10311, N'S24_2766', 28, CAST(93.60 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10311, N'S24_2887', 43, CAST(106.87 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10311, N'S24_3191', 25, CAST(83.04 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10311, N'S24_3432', 46, CAST(92.09 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10312, N'S10_1949', 48, CAST(242.16 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10312, N'S18_1097', 32, CAST(130.67 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10312, N'S18_1342', 43, CAST(89.38 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10312, N'S18_1367', 25, CAST(44.21 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10312, N'S18_1749', 48, CAST(168.30 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10312, N'S18_2248', 30, CAST(61.15 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10312, N'S18_2325', 31, CAST(152.56 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10312, N'S18_2795', 25, CAST(155.25 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10312, N'S18_2949', 37, CAST(100.30 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10312, N'S18_2957', 35, CAST(53.72 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10312, N'S18_3136', 38, CAST(117.29 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10312, N'S18_3320', 33, CAST(107.15 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10312, N'S18_4668', 39, CAST(56.85 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10312, N'S24_1937', 39, CAST(29.54 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10312, N'S24_2022', 23, CAST(37.63 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10312, N'S24_3969', 31, CAST(35.29 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10312, N'S24_4258', 44, CAST(111.02 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10313, N'S10_4962', 40, CAST(166.95 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10313, N'S12_1666', 21, CAST(127.10 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10313, N'S18_2319', 29, CAST(117.82 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10313, N'S18_2432', 34, CAST(52.87 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10313, N'S18_3232', 25, CAST(182.89 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10313, N'S18_4600', 28, CAST(102.92 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10313, N'S24_2300', 42, CAST(132.90 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10313, N'S32_1268', 27, CAST(87.64 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10313, N'S32_2509', 38, CAST(45.45 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10313, N'S32_3522', 34, CAST(56.24 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10313, N'S700_2824', 30, CAST(99.13 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10314, N'S12_1108', 38, CAST(209.88 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10314, N'S12_3148', 46, CAST(138.99 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10314, N'S12_3891', 36, CAST(192.05 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10314, N'S12_4473', 45, CAST(137.46 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10314, N'S18_2238', 42, CAST(137.53 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10314, N'S18_3140', 20, CAST(136.59 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10314, N'S18_3259', 23, CAST(107.90 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10314, N'S18_4027', 29, CAST(145.06 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10314, N'S24_1444', 44, CAST(53.18 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10314, N'S24_2840', 39, CAST(37.13 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10314, N'S24_4048', 38, CAST(105.27 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10314, N'S32_3207', 35, CAST(66.49 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10314, N'S50_1392', 28, CAST(121.54 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10314, N'S50_1514', 38, CAST(61.51 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10314, N'S700_1938', 23, CAST(76.22 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10315, N'S18_4522', 36, CAST(100.06 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10315, N'S24_2011', 35, CAST(120.43 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10315, N'S24_3151', 24, CAST(86.74 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10315, N'S700_1138', 41, CAST(62.00 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10315, N'S700_3505', 31, CAST(86.15 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10315, N'S700_3962', 37, CAST(91.37 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10315, N'S72_3212', 40, CAST(55.69 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10316, N'S10_4757', 33, CAST(125.12 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10316, N'S18_1662', 27, CAST(137.19 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10316, N'S18_3029', 21, CAST(94.62 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10316, N'S18_3856', 47, CAST(86.81 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10316, N'S24_1785', 25, CAST(114.89 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10316, N'S24_2841', 34, CAST(63.71 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10316, N'S24_3420', 47, CAST(76.93 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10316, N'S24_3816', 25, CAST(92.25 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10316, N'S24_3949', 30, CAST(77.79 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10316, N'S32_4289', 24, CAST(59.16 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10316, N'S50_1341', 34, CAST(47.57 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10316, N'S700_1691', 34, CAST(82.21 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10316, N'S700_2047', 45, CAST(93.24 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10316, N'S700_2466', 23, CAST(117.67 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10316, N'S700_2610', 48, CAST(74.45 AS Decimal(20, 2)), 18)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10316, N'S700_3167', 48, CAST(75.20 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10316, N'S700_4002', 44, CAST(62.19 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10316, N'S72_1253', 34, CAST(43.70 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10317, N'S24_4278', 35, CAST(83.32 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10318, N'S10_1678', 46, CAST(94.74 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10318, N'S10_2016', 45, CAST(123.70 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10318, N'S10_4698', 37, CAST(207.22 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10318, N'S18_2581', 31, CAST(100.53 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10318, N'S18_2625', 42, CAST(52.70 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10318, N'S24_1578', 48, CAST(134.11 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10318, N'S24_2000', 26, CAST(86.83 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10318, N'S32_1374', 47, CAST(112.88 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10318, N'S700_2834', 50, CAST(142.38 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10319, N'S12_2823', 30, CAST(137.06 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10319, N'S18_3278', 46, CAST(73.98 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10319, N'S18_3782', 44, CAST(59.06 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10319, N'S18_4721', 45, CAST(175.58 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10319, N'S24_2360', 31, CAST(81.73 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10319, N'S24_4620', 43, CAST(85.69 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10319, N'S32_2206', 29, CAST(38.22 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10319, N'S32_4485', 22, CAST(119.40 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10319, N'S50_4713', 45, CAST(77.29 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10320, N'S12_1099', 31, CAST(221.81 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10320, N'S12_3380', 35, CAST(138.58 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10320, N'S12_3990', 38, CAST(73.42 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10320, N'S18_3482', 25, CAST(139.64 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10320, N'S24_3371', 26, CAST(61.23 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10321, N'S12_4675', 24, CAST(124.37 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10321, N'S18_1129', 41, CAST(141.54 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10321, N'S18_1589', 44, CAST(102.04 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10321, N'S18_1889', 37, CAST(78.54 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10321, N'S18_1984', 25, CAST(149.36 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10321, N'S18_2870', 27, CAST(105.60 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10321, N'S18_3232', 33, CAST(172.73 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10321, N'S18_3685', 28, CAST(151.17 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10321, N'S24_1046', 30, CAST(70.55 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10321, N'S24_1628', 48, CAST(42.26 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10321, N'S24_2766', 30, CAST(72.70 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10321, N'S24_2972', 37, CAST(33.23 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10321, N'S24_3191', 39, CAST(84.75 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10321, N'S24_3432', 21, CAST(89.95 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10321, N'S24_3856', 26, CAST(155.88 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10322, N'S10_1949', 40, CAST(150.01 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10322, N'S10_4962', 46, CAST(61.99 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10322, N'S12_1666', 27, CAST(177.19 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10322, N'S18_1097', 22, CAST(102.32 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10322, N'S18_1342', 43, CAST(86.30 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10322, N'S18_1367', 41, CAST(57.68 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10322, N'S18_2325', 50, CAST(250.73 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10322, N'S18_2432', 35, CAST(61.21 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10322, N'S18_2795', 36, CAST(161.04 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10322, N'S18_2949', 33, CAST(106.81 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10322, N'S18_2957', 41, CAST(29.87 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10322, N'S18_3136', 48, CAST(47.04 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10322, N'S24_1937', 20, CAST(131.20 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10322, N'S24_2022', 30, CAST(116.67 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10323, N'S18_3320', 33, CAST(91.27 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10323, N'S18_4600', 47, CAST(131.98 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10324, N'S12_3148', 27, CAST(54.33 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10324, N'S12_4473', 26, CAST(58.38 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10324, N'S18_2238', 47, CAST(153.35 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10324, N'S18_2319', 33, CAST(37.48 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10324, N'S18_3232', 27, CAST(116.87 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10324, N'S18_4027', 49, CAST(109.79 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10324, N'S18_4668', 38, CAST(179.79 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10324, N'S24_1444', 25, CAST(69.16 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10324, N'S24_2300', 31, CAST(123.24 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10324, N'S24_2840', 30, CAST(111.27 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10324, N'S24_4258', 33, CAST(189.93 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10324, N'S32_1268', 20, CAST(98.18 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10324, N'S32_3522', 48, CAST(171.03 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10324, N'S700_2824', 34, CAST(124.95 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10325, N'S10_4757', 47, CAST(64.93 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10325, N'S12_1108', 42, CAST(64.00 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10325, N'S12_3891', 24, CAST(107.65 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10325, N'S18_3140', 24, CAST(69.12 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10325, N'S24_4048', 44, CAST(121.04 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10325, N'S32_2509', 38, CAST(232.74 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10325, N'S32_3207', 28, CAST(192.05 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10325, N'S50_1392', 38, CAST(136.59 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10325, N'S50_1514', 44, CAST(134.84 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10326, N'S18_3259', 32, CAST(118.99 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10326, N'S18_4522', 50, CAST(86.01 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10326, N'S24_2011', 41, CAST(105.69 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10326, N'S24_3151', 41, CAST(85.85 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10326, N'S24_3816', 20, CAST(92.25 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10326, N'S700_1138', 39, CAST(60.00 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10327, N'S18_1662', 25, CAST(112.19 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10327, N'S18_2581', 45, CAST(106.26 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10327, N'S18_3029', 25, CAST(45.86 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10327, N'S700_1938', 20, CAST(173.46 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10327, N'S700_2610', 21, CAST(96.31 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10327, N'S700_3505', 43, CAST(80.00 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10327, N'S700_3962', 37, CAST(86.61 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10327, N'S72_3212', 37, CAST(86.74 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10328, N'S18_3856', 34, CAST(112.22 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10328, N'S24_1785', 47, CAST(87.54 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10328, N'S24_2841', 48, CAST(58.92 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10328, N'S24_3420', 20, CAST(72.98 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10328, N'S24_3949', 35, CAST(76.43 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10328, N'S24_4278', 43, CAST(60.86 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10328, N'S32_4289', 24, CAST(81.17 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10328, N'S50_1341', 34, CAST(51.93 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10328, N'S700_1691', 27, CAST(102.30 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10328, N'S700_2047', 41, CAST(101.38 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10328, N'S700_2466', 37, CAST(108.69 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10328, N'S700_2834', 33, CAST(123.40 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10328, N'S700_3167', 33, CAST(64.00 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10328, N'S700_4002', 39, CAST(85.87 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10329, N'S10_1678', 42, CAST(104.67 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10329, N'S10_2016', 20, CAST(158.80 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10329, N'S10_4698', 26, CAST(225.70 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10329, N'S12_1099', 41, CAST(71.47 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10329, N'S12_2823', 24, CAST(147.61 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10329, N'S12_3380', 46, CAST(83.63 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10329, N'S12_3990', 33, CAST(109.32 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10329, N'S12_4675', 39, CAST(64.74 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10329, N'S18_1889', 29, CAST(101.89 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10329, N'S18_2625', 38, CAST(138.58 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10329, N'S18_3278', 38, CAST(59.10 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10329, N'S24_1578', 30, CAST(87.78 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10329, N'S24_2000', 37, CAST(94.43 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10329, N'S32_1374', 45, CAST(63.91 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10329, N'S72_1253', 44, CAST(86.13 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10330, N'S18_3482', 37, CAST(119.06 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10330, N'S18_3782', 29, CAST(69.63 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10330, N'S18_4721', 50, CAST(122.02 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10330, N'S24_2360', 42, CAST(81.03 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10331, N'S18_1129', 46, CAST(139.87 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10331, N'S18_1589', 44, CAST(110.21 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10331, N'S18_1749', 44, CAST(74.04 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10331, N'S18_1984', 30, CAST(32.47 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10331, N'S18_2870', 26, CAST(64.90 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10331, N'S18_3232', 27, CAST(154.47 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10331, N'S18_3685', 26, CAST(67.91 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10331, N'S24_2972', 27, CAST(42.24 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10331, N'S24_3371', 25, CAST(123.14 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10331, N'S24_3856', 21, CAST(149.33 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10331, N'S24_4620', 41, CAST(139.40 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10331, N'S32_2206', 28, CAST(146.52 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10331, N'S32_4485', 32, CAST(157.08 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10331, N'S50_4713', 20, CAST(182.89 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10332, N'S18_1342', 46, CAST(95.13 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10332, N'S18_1367', 27, CAST(89.89 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10332, N'S18_2248', 38, CAST(84.25 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10332, N'S18_2325', 35, CAST(64.69 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10332, N'S18_2795', 24, CAST(52.67 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10332, N'S18_2957', 26, CAST(114.58 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10332, N'S18_3136', 40, CAST(39.80 AS Decimal(20, 2)), 18)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10332, N'S18_4409', 50, CAST(146.20 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10332, N'S18_4933', 21, CAST(165.38 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10332, N'S24_1046', 23, CAST(56.84 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10332, N'S24_1628', 20, CAST(87.96 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10332, N'S24_1937', 45, CAST(81.91 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10332, N'S24_2022', 26, CAST(85.52 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10332, N'S24_2766', 39, CAST(86.72 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10332, N'S24_2887', 44, CAST(42.26 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10332, N'S24_3191', 45, CAST(34.19 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10332, N'S24_3432', 31, CAST(37.18 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10332, N'S24_3969', 41, CAST(77.24 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10333, N'S10_1949', 26, CAST(115.50 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10333, N'S12_1666', 33, CAST(99.21 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10333, N'S18_1097', 29, CAST(40.25 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10333, N'S18_2949', 31, CAST(90.17 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10333, N'S18_3320', 46, CAST(246.45 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10333, N'S18_4668', 24, CAST(79.86 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10333, N'S24_4258', 39, CAST(113.44 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10333, N'S32_3522', 33, CAST(73.69 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10334, N'S10_4962', 26, CAST(122.62 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10334, N'S18_2319', 46, CAST(126.41 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10334, N'S18_2432', 34, CAST(61.38 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10334, N'S18_3232', 20, CAST(143.94 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10334, N'S18_4600', 49, CAST(138.03 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10334, N'S24_2300', 42, CAST(131.62 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10335, N'S24_2840', 33, CAST(37.13 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10335, N'S32_1268', 44, CAST(107.87 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10335, N'S32_2509', 40, CAST(60.60 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10336, N'S12_1108', 33, CAST(57.22 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10336, N'S12_3148', 33, CAST(123.01 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10336, N'S12_3891', 49, CAST(63.38 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10336, N'S12_4473', 38, CAST(167.70 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10336, N'S18_2238', 49, CAST(152.26 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10336, N'S18_3140', 48, CAST(120.38 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10336, N'S18_3259', 21, CAST(106.21 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10336, N'S24_1444', 45, CAST(132.72 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10336, N'S24_4048', 31, CAST(148.99 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10336, N'S32_3207', 31, CAST(84.71 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10336, N'S50_1392', 23, CAST(136.59 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10336, N'S700_2824', 46, CAST(207.80 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10337, N'S10_4757', 25, CAST(48.05 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10337, N'S18_4027', 36, CAST(157.76 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10337, N'S18_4522', 29, CAST(155.11 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10337, N'S24_2011', 29, CAST(71.97 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10337, N'S50_1514', 21, CAST(109.37 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10337, N'S700_1938', 36, CAST(70.30 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10337, N'S700_3505', 31, CAST(89.38 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10337, N'S700_3962', 36, CAST(71.89 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10337, N'S72_3212', 42, CAST(97.16 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10338, N'S18_1662', 41, CAST(137.19 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10338, N'S18_3029', 28, CAST(82.58 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10338, N'S18_3856', 45, CAST(122.81 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10339, N'S10_2016', 40, CAST(68.92 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10339, N'S10_4698', 39, CAST(76.67 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10339, N'S18_2581', 27, CAST(104.10 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10339, N'S18_2625', 30, CAST(62.16 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10339, N'S24_1578', 27, CAST(84.39 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10339, N'S24_1785', 21, CAST(50.65 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10339, N'S24_2841', 55, CAST(112.99 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10339, N'S24_3151', 55, CAST(195.60 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10339, N'S24_3420', 29, CAST(99.69 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10339, N'S24_3816', 42, CAST(59.36 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10339, N'S24_3949', 45, CAST(96.92 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10339, N'S700_1138', 22, CAST(128.02 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10339, N'S700_2047', 55, CAST(71.25 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10339, N'S700_2610', 50, CAST(74.35 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10339, N'S700_4002', 50, CAST(57.86 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10339, N'S72_1253', 27, CAST(76.31 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10340, N'S24_2000', 55, CAST(79.98 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10340, N'S24_4278', 40, CAST(84.77 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10340, N'S32_1374', 55, CAST(117.87 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10340, N'S32_4289', 39, CAST(59.16 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10340, N'S50_1341', 40, CAST(50.62 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10340, N'S700_1691', 30, CAST(88.60 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10340, N'S700_2466', 55, CAST(87.75 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10340, N'S700_2834', 29, CAST(141.19 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10341, N'S10_1678', 41, CAST(188.73 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10341, N'S12_1099', 45, CAST(79.65 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10341, N'S12_2823', 55, CAST(147.61 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10341, N'S12_3380', 44, CAST(95.93 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10341, N'S12_3990', 36, CAST(93.56 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10341, N'S12_4675', 55, CAST(75.20 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10341, N'S24_2360', 32, CAST(103.35 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10341, N'S32_4485', 31, CAST(71.02 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10341, N'S50_4713', 38, CAST(123.22 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10341, N'S700_3167', 34, CAST(107.18 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10342, N'S18_1129', 40, CAST(161.36 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10342, N'S18_1889', 55, CAST(65.45 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10342, N'S18_1984', 22, CAST(143.67 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10342, N'S18_3232', 30, CAST(167.65 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10342, N'S18_3278', 25, CAST(66.74 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10342, N'S18_3482', 55, CAST(119.06 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10342, N'S18_3782', 26, CAST(55.95 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10342, N'S18_4721', 38, CAST(165.17 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10342, N'S24_2972', 39, CAST(40.40 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10342, N'S24_3371', 48, CAST(62.45 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10342, N'S24_3856', 42, CAST(119.37 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10343, N'S18_1589', 36, CAST(162.47 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10343, N'S18_2870', 25, CAST(52.32 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10343, N'S18_3685', 44, CAST(84.88 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10343, N'S24_1628', 27, CAST(36.21 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10343, N'S24_4620', 30, CAST(103.29 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10343, N'S32_2206', 29, CAST(128.04 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10344, N'S18_1749', 45, CAST(170.00 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10344, N'S18_2248', 40, CAST(56.91 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10344, N'S18_2325', 30, CAST(130.94 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10344, N'S18_4409', 21, CAST(104.91 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10344, N'S18_4933', 26, CAST(63.43 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10344, N'S24_1046', 29, CAST(59.53 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10344, N'S24_1937', 20, CAST(35.18 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10345, N'S24_2022', 43, CAST(53.76 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10346, N'S18_1342', 42, CAST(36.11 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10346, N'S24_2766', 25, CAST(115.07 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10346, N'S24_2887', 24, CAST(87.24 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10346, N'S24_3191', 24, CAST(138.58 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10346, N'S24_3432', 26, CAST(95.88 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10346, N'S24_3969', 22, CAST(97.44 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10347, N'S10_1949', 30, CAST(131.49 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10347, N'S10_4962', 27, CAST(164.00 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10347, N'S12_1666', 29, CAST(123.67 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10347, N'S18_1097', 42, CAST(49.60 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10347, N'S18_1367', 21, CAST(58.95 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10347, N'S18_2432', 50, CAST(136.69 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10347, N'S18_2795', 21, CAST(229.30 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10347, N'S18_2949', 48, CAST(100.30 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10347, N'S18_2957', 34, CAST(64.96 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10347, N'S18_3136', 45, CAST(109.96 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10347, N'S18_3320', 26, CAST(102.19 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10347, N'S18_4600', 45, CAST(130.77 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10348, N'S12_1108', 48, CAST(52.36 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10348, N'S12_3148', 47, CAST(102.16 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10348, N'S18_4668', 29, CAST(245.20 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10348, N'S24_2300', 37, CAST(161.66 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10348, N'S24_4258', 39, CAST(50.31 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10348, N'S32_1268', 42, CAST(152.07 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10348, N'S32_3522', 31, CAST(101.29 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10348, N'S700_2824', 32, CAST(82.83 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10349, N'S12_3891', 26, CAST(169.56 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10349, N'S12_4473', 48, CAST(109.02 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10349, N'S18_2238', 38, CAST(176.83 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10349, N'S18_2319', 38, CAST(137.46 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10349, N'S18_3232', 48, CAST(154.10 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10349, N'S18_4027', 34, CAST(129.26 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10349, N'S24_1444', 48, CAST(47.40 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10349, N'S24_2840', 36, CAST(37.13 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10349, N'S24_4048', 23, CAST(138.39 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10349, N'S32_2509', 33, CAST(46.53 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10350, N'S10_4757', 26, CAST(75.47 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10350, N'S18_3029', 43, CAST(64.97 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10350, N'S18_3140', 44, CAST(117.98 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10350, N'S18_3259', 41, CAST(93.04 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10350, N'S18_4522', 30, CAST(100.77 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10350, N'S24_2011', 34, CAST(50.33 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10350, N'S24_3151', 30, CAST(100.70 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10350, N'S24_3816', 25, CAST(60.34 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10350, N'S32_3207', 27, CAST(163.20 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10350, N'S50_1392', 31, CAST(71.40 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10350, N'S50_1514', 44, CAST(147.52 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10350, N'S700_1138', 46, CAST(76.67 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10350, N'S700_1938', 28, CAST(104.44 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10350, N'S700_2610', 29, CAST(75.35 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10350, N'S700_3505', 31, CAST(77.34 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10350, N'S700_3962', 25, CAST(114.19 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10350, N'S72_3212', 20, CAST(112.22 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10351, N'S18_1662', 39, CAST(99.52 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10351, N'S18_3856', 20, CAST(168.73 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10351, N'S24_2841', 25, CAST(74.68 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10351, N'S24_3420', 38, CAST(68.38 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10351, N'S24_3949', 34, CAST(59.37 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10352, N'S700_2047', 23, CAST(102.29 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10352, N'S700_2466', 49, CAST(100.72 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10352, N'S700_4002', 22, CAST(75.51 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10352, N'S72_1253', 49, CAST(52.64 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10353, N'S18_2581', 27, CAST(130.21 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10353, N'S24_1785', 28, CAST(71.73 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10353, N'S24_4278', 35, CAST(89.90 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10353, N'S32_1374', 46, CAST(81.17 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10353, N'S32_4289', 40, CAST(44.51 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10353, N'S50_1341', 40, CAST(82.21 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10353, N'S700_1691', 39, CAST(129.33 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10353, N'S700_2834', 48, CAST(68.80 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10353, N'S700_3167', 43, CAST(81.95 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10354, N'S10_1678', 42, CAST(86.13 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10354, N'S10_2016', 20, CAST(104.67 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10354, N'S10_4698', 42, CAST(213.03 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10354, N'S12_1099', 31, CAST(93.28 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10354, N'S12_2823', 35, CAST(182.90 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10354, N'S12_3380', 29, CAST(73.15 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10354, N'S12_3990', 23, CAST(50.88 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10354, N'S12_4675', 28, CAST(86.84 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10354, N'S18_1889', 21, CAST(110.45 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10354, N'S18_2625', 28, CAST(165.68 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10354, N'S18_3278', 36, CAST(82.26 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10354, N'S24_1578', 21, CAST(113.92 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10354, N'S24_2000', 28, CAST(69.43 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10355, N'S18_3482', 23, CAST(138.17 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10355, N'S18_3782', 31, CAST(53.47 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10355, N'S18_4721', 25, CAST(168.14 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10355, N'S24_2360', 41, CAST(70.65 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10355, N'S24_2972', 36, CAST(38.52 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10355, N'S24_3371', 44, CAST(62.45 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10355, N'S24_3856', 32, CAST(165.71 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10355, N'S24_4620', 28, CAST(95.39 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10355, N'S32_2206', 38, CAST(39.83 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10355, N'S32_4485', 40, CAST(108.17 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10356, N'S18_1129', 43, CAST(97.60 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10356, N'S18_1342', 50, CAST(50.18 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10356, N'S18_1367', 22, CAST(72.41 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10356, N'S18_1984', 27, CAST(64.69 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10356, N'S18_2325', 29, CAST(125.18 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10356, N'S18_2795', 30, CAST(148.74 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10356, N'S24_1937', 48, CAST(202.50 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10356, N'S24_2022', 26, CAST(31.86 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10356, N'S50_4713', 26, CAST(151.45 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10357, N'S10_1949', 32, CAST(177.87 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10357, N'S10_4962', 43, CAST(134.44 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10357, N'S12_1666', 49, CAST(121.64 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10357, N'S18_1097', 39, CAST(98.00 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10357, N'S18_2432', 41, CAST(61.99 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10357, N'S18_2949', 41, CAST(87.13 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10357, N'S18_2957', 49, CAST(70.58 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10357, N'S18_3136', 44, CAST(117.29 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10357, N'S18_3320', 25, CAST(104.17 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10357, N'S18_4600', 28, CAST(127.13 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10358, N'S12_3148', 49, CAST(55.34 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10358, N'S12_4473', 42, CAST(64.16 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10358, N'S18_2238', 20, CAST(121.40 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10358, N'S18_2319', 20, CAST(36.42 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10358, N'S18_3232', 32, CAST(93.49 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10358, N'S18_4027', 25, CAST(101.13 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10358, N'S18_4668', 30, CAST(176.76 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10358, N'S24_1444', 44, CAST(60.76 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10358, N'S24_2300', 41, CAST(138.65 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10358, N'S24_2840', 36, CAST(82.94 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10358, N'S24_4258', 41, CAST(167.00 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10358, N'S32_1268', 41, CAST(108.00 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10358, N'S32_3522', 36, CAST(157.49 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10358, N'S700_2824', 27, CAST(139.31 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10359, N'S10_4757', 48, CAST(54.68 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10359, N'S12_1108', 42, CAST(113.44 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10359, N'S12_3891', 49, CAST(62.09 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10359, N'S24_4048', 22, CAST(118.32 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10359, N'S32_2509', 36, CAST(176.63 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10359, N'S32_3207', 22, CAST(195.51 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10359, N'S50_1392', 46, CAST(106.45 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10359, N'S50_1514', 25, CAST(64.93 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10360, N'S18_1662', 50, CAST(58.67 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10360, N'S18_2581', 41, CAST(87.48 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10360, N'S18_3029', 46, CAST(77.34 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10360, N'S18_3140', 29, CAST(175.04 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10360, N'S18_3259', 29, CAST(101.38 AS Decimal(20, 2)), 18)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10360, N'S18_3856', 40, CAST(87.15 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10360, N'S18_4522', 40, CAST(86.02 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10360, N'S24_1785', 22, CAST(115.20 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10360, N'S24_2011', 31, CAST(118.83 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10360, N'S24_2841', 49, CAST(56.78 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10360, N'S24_3151', 36, CAST(113.95 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10360, N'S24_3816', 22, CAST(111.16 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10360, N'S700_1138', 32, CAST(100.94 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10360, N'S700_1938', 26, CAST(97.38 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10360, N'S700_2610', 30, CAST(125.35 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10360, N'S700_3505', 35, CAST(65.77 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10360, N'S700_3962', 31, CAST(103.56 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10360, N'S72_3212', 31, CAST(96.44 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10361, N'S10_1678', 20, CAST(72.55 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10361, N'S10_2016', 26, CAST(51.15 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10361, N'S24_3420', 34, CAST(113.88 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10361, N'S24_3949', 26, CAST(142.73 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10361, N'S24_4278', 25, CAST(62.46 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10361, N'S32_4289', 49, CAST(72.33 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10361, N'S50_1341', 33, CAST(82.59 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10361, N'S700_1691', 20, CAST(60.54 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10361, N'S700_2047', 24, CAST(45.39 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10361, N'S700_2466', 26, CAST(105.95 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10361, N'S700_2834', 44, CAST(72.42 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10361, N'S700_3167', 44, CAST(113.68 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10361, N'S700_4002', 35, CAST(122.21 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10361, N'S72_1253', 23, CAST(95.20 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10362, N'S10_4698', 22, CAST(166.55 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10362, N'S12_2823', 22, CAST(176.23 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10362, N'S18_2625', 23, CAST(49.67 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10362, N'S24_1578', 50, CAST(96.92 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10363, N'S12_1099', 33, CAST(85.39 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10363, N'S12_3380', 34, CAST(96.73 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10363, N'S12_3990', 34, CAST(81.62 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10363, N'S12_4675', 46, CAST(88.45 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10363, N'S18_1889', 22, CAST(167.57 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10363, N'S18_3278', 46, CAST(60.30 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10363, N'S18_3482', 24, CAST(172.61 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10363, N'S18_3782', 32, CAST(89.12 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10363, N'S18_4721', 28, CAST(58.18 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10363, N'S24_2000', 21, CAST(171.22 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10363, N'S24_2360', 43, CAST(61.23 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10363, N'S24_3371', 21, CAST(116.56 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10363, N'S24_3856', 31, CAST(94.58 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10363, N'S24_4620', 43, CAST(119.87 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10363, N'S32_1374', 50, CAST(131.53 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10364, N'S32_2206', 48, CAST(48.28 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10365, N'S18_1129', 30, CAST(87.06 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10365, N'S32_4485', 22, CAST(155.69 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10365, N'S50_4713', 44, CAST(113.28 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10366, N'S18_1984', 34, CAST(123.76 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10366, N'S18_2870', 49, CAST(125.40 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10366, N'S18_3232', 34, CAST(184.58 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10367, N'S18_1589', 49, CAST(56.30 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10367, N'S18_1749', 37, CAST(127.13 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10367, N'S18_2248', 45, CAST(197.44 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10367, N'S18_2325', 27, CAST(155.41 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10367, N'S18_2795', 32, CAST(94.79 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10367, N'S18_3685', 46, CAST(104.53 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10367, N'S18_4409', 43, CAST(62.72 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10367, N'S18_4933', 44, CAST(85.25 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10367, N'S24_1046', 21, CAST(60.37 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10367, N'S24_1628', 38, CAST(38.50 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10367, N'S24_1937', 23, CAST(36.29 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10367, N'S24_2022', 28, CAST(30.59 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10367, N'S24_2972', 36, CAST(139.40 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10368, N'S24_2766', 40, CAST(102.68 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10368, N'S24_2887', 31, CAST(136.23 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10368, N'S24_3191', 46, CAST(79.62 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10368, N'S24_3432', 20, CAST(99.58 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10368, N'S24_3969', 46, CAST(37.34 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10369, N'S10_1949', 41, CAST(110.12 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10369, N'S18_1342', 44, CAST(210.01 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10369, N'S18_1367', 32, CAST(98.63 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10369, N'S18_2949', 42, CAST(109.08 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10369, N'S18_2957', 28, CAST(44.21 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10369, N'S18_3136', 21, CAST(94.22 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10369, N'S18_3320', 45, CAST(73.08 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10369, N'S24_4258', 40, CAST(86.92 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10370, N'S10_4962', 35, CAST(65.63 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10370, N'S12_1666', 49, CAST(172.86 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10370, N'S18_1097', 27, CAST(144.87 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10370, N'S18_2319', 22, CAST(179.50 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10370, N'S18_2432', 22, CAST(96.86 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10370, N'S18_3232', 27, CAST(56.85 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10370, N'S18_4600', 29, CAST(57.53 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10370, N'S18_4668', 20, CAST(136.50 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10370, N'S32_3522', 25, CAST(126.41 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10371, N'S12_1108', 32, CAST(111.27 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10371, N'S12_4473', 49, CAST(35.71 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10371, N'S18_2238', 25, CAST(104.09 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10371, N'S24_1444', 25, CAST(97.27 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10371, N'S24_2300', 20, CAST(172.47 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10371, N'S24_2840', 45, CAST(123.24 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10371, N'S24_4048', 28, CAST(50.32 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10371, N'S32_1268', 26, CAST(155.54 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10371, N'S32_2509', 20, CAST(66.47 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10371, N'S32_3207', 30, CAST(99.55 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10371, N'S50_1392', 48, CAST(56.55 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10371, N'S700_2824', 34, CAST(126.51 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10372, N'S12_3148', 40, CAST(146.55 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10372, N'S12_3891', 34, CAST(174.75 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10372, N'S18_3140', 28, CAST(137.96 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10372, N'S18_3259', 25, CAST(84.71 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10372, N'S18_4027', 48, CAST(146.49 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10372, N'S18_4522', 41, CAST(86.89 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10372, N'S24_2011', 37, CAST(105.69 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10372, N'S50_1514', 24, CAST(58.58 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10372, N'S700_1938', 44, CAST(102.20 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10373, N'S10_4757', 39, CAST(103.75 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10373, N'S18_1662', 28, CAST(57.55 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10373, N'S18_3029', 22, CAST(86.74 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10373, N'S18_3856', 50, CAST(60.49 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10373, N'S24_2841', 38, CAST(70.44 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10373, N'S24_3151', 33, CAST(57.32 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10373, N'S24_3420', 46, CAST(66.00 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10373, N'S24_3816', 23, CAST(104.10 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10373, N'S24_3949', 39, CAST(73.00 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10373, N'S700_1138', 44, CAST(105.18 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10373, N'S700_2047', 32, CAST(84.41 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10373, N'S700_2610', 41, CAST(70.33 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10373, N'S700_3505', 34, CAST(96.34 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10373, N'S700_3962', 37, CAST(108.80 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10373, N'S700_4002', 45, CAST(55.62 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10373, N'S72_1253', 25, CAST(64.97 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10373, N'S72_3212', 29, CAST(137.19 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10374, N'S10_2016', 39, CAST(135.59 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10374, N'S10_4698', 22, CAST(174.29 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10374, N'S18_2581', 42, CAST(69.27 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10374, N'S18_2625', 22, CAST(53.30 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10374, N'S24_1578', 38, CAST(110.45 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10374, N'S24_1785', 46, CAST(94.10 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10375, N'S10_1678', 21, CAST(34.91 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10375, N'S12_1099', 45, CAST(76.00 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10375, N'S12_2823', 49, CAST(78.92 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10375, N'S24_2000', 23, CAST(106.23 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10375, N'S24_2360', 20, CAST(102.30 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10375, N'S24_4278', 43, CAST(233.48 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10375, N'S32_1374', 37, CAST(171.71 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10375, N'S32_4289', 44, CAST(82.26 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10375, N'S32_4485', 41, CAST(114.68 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10375, N'S50_1341', 49, CAST(65.80 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10375, N'S50_4713', 49, CAST(110.34 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10375, N'S700_1691', 37, CAST(81.87 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10375, N'S700_2466', 33, CAST(116.87 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10375, N'S700_2834', 25, CAST(66.73 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10375, N'S700_3167', 44, CAST(118.38 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10376, N'S12_3380', 35, CAST(113.92 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10377, N'S12_3990', 24, CAST(67.83 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10377, N'S12_4675', 50, CAST(103.64 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10377, N'S18_1129', 35, CAST(168.43 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10377, N'S18_1889', 31, CAST(67.76 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10377, N'S18_1984', 36, CAST(120.91 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10377, N'S18_3232', 39, CAST(186.27 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10378, N'S18_1589', 34, CAST(42.64 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10378, N'S18_3278', 22, CAST(112.00 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10378, N'S18_3482', 43, CAST(96.49 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10378, N'S18_3782', 28, CAST(164.63 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10378, N'S18_4721', 49, CAST(67.14 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10378, N'S24_2972', 41, CAST(142.85 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10378, N'S24_3371', 46, CAST(41.54 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10378, N'S24_3856', 33, CAST(53.27 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10378, N'S24_4620', 41, CAST(119.37 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10378, N'S32_2206', 40, CAST(82.46 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10379, N'S18_1749', 39, CAST(138.45 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10379, N'S18_2248', 27, CAST(49.30 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10379, N'S18_2870', 29, CAST(176.80 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10379, N'S18_3685', 32, CAST(70.83 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10379, N'S24_1628', 32, CAST(124.08 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10380, N'S18_1342', 27, CAST(93.16 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10380, N'S18_2325', 40, CAST(123.29 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10380, N'S18_2795', 21, CAST(47.18 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10380, N'S18_4409', 32, CAST(105.52 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10380, N'S18_4933', 24, CAST(189.00 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10380, N'S24_1046', 34, CAST(101.23 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10380, N'S24_1937', 32, CAST(70.56 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10380, N'S24_2022', 27, CAST(68.35 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10380, N'S24_2766', 36, CAST(37.50 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10380, N'S24_2887', 44, CAST(36.29 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10380, N'S24_3191', 44, CAST(79.06 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10380, N'S24_3432', 34, CAST(116.27 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10380, N'S24_3969', 43, CAST(95.03 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10381, N'S10_1949', 36, CAST(229.30 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10381, N'S10_4962', 37, CAST(168.42 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10381, N'S12_1666', 20, CAST(147.60 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10381, N'S18_1097', 48, CAST(98.00 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10381, N'S18_1367', 25, CAST(52.83 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10381, N'S18_2432', 35, CAST(48.62 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10381, N'S18_2949', 41, CAST(105.36 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10381, N'S18_2957', 40, CAST(68.08 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10381, N'S18_3136', 35, CAST(122.52 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10382, N'S12_1108', 34, CAST(112.46 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10382, N'S12_3148', 37, CAST(110.05 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10382, N'S12_3891', 34, CAST(95.35 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10382, N'S12_4473', 32, CAST(66.58 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10382, N'S18_2238', 25, CAST(88.00 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10382, N'S18_3320', 50, CAST(178.71 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10382, N'S18_4600', 39, CAST(125.40 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10382, N'S18_4668', 39, CAST(200.70 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10382, N'S24_2300', 20, CAST(132.72 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10382, N'S24_4258', 33, CAST(139.17 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10382, N'S32_1268', 26, CAST(104.17 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10382, N'S32_3522', 48, CAST(141.66 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10382, N'S700_2824', 34, CAST(54.84 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10383, N'S18_2319', 27, CAST(142.37 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10383, N'S18_3140', 24, CAST(61.52 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10383, N'S18_3232', 47, CAST(146.15 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10383, N'S18_3259', 26, CAST(128.48 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10383, N'S18_4027', 38, CAST(140.55 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10383, N'S18_4522', 28, CAST(58.58 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10383, N'S24_1444', 22, CAST(91.76 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10383, N'S24_2840', 40, CAST(152.24 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10383, N'S24_4048', 21, CAST(93.91 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10383, N'S32_2509', 32, CAST(53.18 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10383, N'S32_3207', 44, CAST(36.07 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10383, N'S50_1392', 29, CAST(106.45 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10383, N'S50_1514', 38, CAST(60.06 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10384, N'S10_4757', 34, CAST(142.55 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10384, N'S24_2011', 28, CAST(80.54 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10384, N'S24_3151', 43, CAST(97.87 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10384, N'S700_1938', 49, CAST(130.56 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10385, N'S24_3816', 37, CAST(85.54 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10385, N'S700_1138', 25, CAST(77.34 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10386, N'S18_1662', 25, CAST(54.57 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10386, N'S18_2581', 21, CAST(74.77 AS Decimal(20, 2)), 18)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10386, N'S18_3029', 37, CAST(93.01 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10386, N'S18_3856', 22, CAST(57.55 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10386, N'S24_1785', 33, CAST(41.71 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10386, N'S24_2841', 39, CAST(55.96 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10386, N'S24_3420', 35, CAST(63.76 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10386, N'S24_3949', 41, CAST(73.32 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10386, N'S24_4278', 50, CAST(63.34 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10386, N'S700_2047', 29, CAST(85.76 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10386, N'S700_2466', 37, CAST(83.84 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10386, N'S700_2610', 37, CAST(135.61 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10386, N'S700_3167', 32, CAST(94.34 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10386, N'S700_3505', 45, CAST(92.08 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10386, N'S700_3962', 30, CAST(95.48 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10386, N'S700_4002', 44, CAST(86.40 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10386, N'S72_1253', 50, CAST(87.15 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10386, N'S72_3212', 43, CAST(125.99 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10387, N'S32_1374', 44, CAST(94.90 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10388, N'S10_1678', 42, CAST(76.36 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10388, N'S10_2016', 50, CAST(44.51 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10388, N'S10_4698', 21, CAST(86.77 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10388, N'S12_2823', 44, CAST(135.26 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10388, N'S32_4289', 35, CAST(111.97 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10388, N'S50_1341', 27, CAST(118.94 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10388, N'S700_1691', 46, CAST(218.84 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10388, N'S700_2834', 50, CAST(143.09 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10389, N'S12_1099', 26, CAST(99.04 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10389, N'S12_3380', 25, CAST(72.38 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10389, N'S12_3990', 36, CAST(70.26 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10389, N'S12_4675', 47, CAST(111.57 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10389, N'S18_1889', 49, CAST(79.22 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10389, N'S18_2625', 39, CAST(179.00 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10389, N'S24_1578', 45, CAST(102.17 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10389, N'S24_2000', 49, CAST(81.40 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10390, N'S18_1129', 36, CAST(93.77 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10390, N'S18_1984', 34, CAST(43.05 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10390, N'S18_2325', 31, CAST(98.99 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10390, N'S18_2795', 26, CAST(78.11 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10390, N'S18_3278', 40, CAST(137.29 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10390, N'S18_3482', 50, CAST(147.94 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10390, N'S18_3782', 36, CAST(141.11 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10390, N'S18_4721', 49, CAST(140.06 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10390, N'S24_2360', 35, CAST(65.13 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10390, N'S24_2972', 37, CAST(132.29 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10390, N'S24_3371', 46, CAST(52.84 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10390, N'S24_3856', 45, CAST(150.29 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10390, N'S24_4620', 30, CAST(82.42 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10390, N'S32_2206', 41, CAST(44.56 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10390, N'S32_4485', 45, CAST(48.98 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10390, N'S50_4713', 22, CAST(158.69 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10391, N'S10_1949', 24, CAST(100.69 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10391, N'S10_4962', 37, CAST(46.90 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10391, N'S12_1666', 39, CAST(63.20 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10391, N'S18_1097', 29, CAST(85.10 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10391, N'S18_1342', 35, CAST(158.54 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10391, N'S18_1367', 42, CAST(119.00 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10391, N'S18_2432', 44, CAST(38.50 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10391, N'S18_2949', 32, CAST(45.25 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10391, N'S24_1937', 33, CAST(252.87 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10391, N'S24_2022', 24, CAST(168.42 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10392, N'S18_2957', 37, CAST(59.96 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10392, N'S18_3136', 29, CAST(86.92 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10392, N'S18_3320', 36, CAST(112.11 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10393, N'S12_3148', 35, CAST(109.08 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10393, N'S12_4473', 32, CAST(101.13 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10393, N'S18_2238', 20, CAST(69.81 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10393, N'S18_2319', 38, CAST(100.14 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10393, N'S18_4600', 30, CAST(120.86 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10393, N'S18_4668', 44, CAST(110.21 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10393, N'S24_2300', 33, CAST(176.83 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10393, N'S24_4258', 33, CAST(98.18 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10393, N'S32_1268', 38, CAST(145.30 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10393, N'S32_3522', 31, CAST(57.86 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10393, N'S700_2824', 21, CAST(102.23 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10394, N'S18_3232', 22, CAST(152.41 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10394, N'S18_4027', 37, CAST(172.34 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10394, N'S24_1444', 31, CAST(50.29 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10394, N'S24_2840', 46, CAST(38.90 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10394, N'S24_4048', 37, CAST(140.75 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10394, N'S32_2509', 36, CAST(62.77 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10394, N'S32_3207', 30, CAST(60.28 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10395, N'S10_4757', 32, CAST(105.33 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10395, N'S12_1108', 33, CAST(69.12 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10395, N'S50_1392', 46, CAST(123.76 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10395, N'S50_1514', 45, CAST(199.49 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10396, N'S12_3891', 33, CAST(185.13 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10396, N'S18_3140', 33, CAST(159.81 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10396, N'S18_3259', 24, CAST(89.75 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10396, N'S18_4522', 45, CAST(105.32 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10396, N'S24_2011', 49, CAST(116.75 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10396, N'S24_3151', 27, CAST(83.20 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10396, N'S24_3816', 37, CAST(90.57 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10396, N'S700_1138', 39, CAST(66.67 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10397, N'S700_1938', 32, CAST(80.55 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10397, N'S700_2610', 22, CAST(66.50 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10397, N'S700_3505', 48, CAST(108.18 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10397, N'S700_3962', 36, CAST(105.27 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10397, N'S72_3212', 34, CAST(62.24 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10398, N'S18_1662', 33, CAST(127.73 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10398, N'S18_2581', 34, CAST(76.88 AS Decimal(20, 2)), 15)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10398, N'S18_3029', 28, CAST(72.26 AS Decimal(20, 2)), 18)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10398, N'S18_3856', 45, CAST(106.93 AS Decimal(20, 2)), 17)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10398, N'S24_1785', 43, CAST(129.12 AS Decimal(20, 2)), 16)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10398, N'S24_2841', 28, CAST(57.55 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10398, N'S24_3420', 34, CAST(71.67 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10398, N'S24_3949', 41, CAST(68.24 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10398, N'S24_4278', 45, CAST(78.25 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10398, N'S32_4289', 22, CAST(67.41 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10398, N'S50_1341', 49, CAST(36.66 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10398, N'S700_1691', 47, CAST(87.69 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10398, N'S700_2047', 36, CAST(108.62 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10398, N'S700_2466', 22, CAST(86.76 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10398, N'S700_2834', 23, CAST(122.21 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10398, N'S700_3167', 29, CAST(65.60 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10398, N'S700_4002', 36, CAST(87.36 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10398, N'S72_1253', 34, CAST(40.22 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10399, N'S10_1678', 40, CAST(113.88 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10399, N'S10_2016', 51, CAST(123.70 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10399, N'S10_4698', 22, CAST(158.80 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10399, N'S12_2823', 29, CAST(164.18 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10399, N'S18_2625', 30, CAST(68.44 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10399, N'S24_1578', 57, CAST(105.94 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10399, N'S24_2000', 58, CAST(89.12 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10399, N'S32_1374', 32, CAST(99.89 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10400, N'S10_4757', 64, CAST(150.96 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10400, N'S18_1662', 34, CAST(189.23 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10400, N'S18_3029', 30, CAST(74.84 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10400, N'S18_3856', 58, CAST(125.99 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10400, N'S24_2841', 24, CAST(61.66 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10400, N'S24_3420', 38, CAST(57.20 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10400, N'S24_3816', 42, CAST(72.96 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10400, N'S700_2047', 46, CAST(87.80 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10400, N'S72_1253', 20, CAST(56.12 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10401, N'S18_2581', 42, CAST(76.03 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10401, N'S24_1785', 38, CAST(96.29 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10401, N'S24_3949', 64, CAST(60.05 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10401, N'S24_4278', 52, CAST(81.14 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10401, N'S32_1374', 49, CAST(101.89 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10401, N'S32_4289', 62, CAST(77.73 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10401, N'S50_1341', 56, CAST(35.35 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10401, N'S700_1691', 11, CAST(103.21 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10401, N'S700_2466', 85, CAST(88.75 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10401, N'S700_2834', 21, CAST(96.11 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10401, N'S700_3167', 77, CAST(92.00 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10401, N'S700_4002', 28, CAST(72.55 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10402, N'S10_2016', 45, CAST(129.64 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10402, N'S18_2625', 55, CAST(55.72 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10402, N'S24_2000', 59, CAST(87.60 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10403, N'S10_1678', 24, CAST(101.44 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10403, N'S10_4698', 66, CAST(180.10 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10403, N'S12_2823', 66, CAST(131.04 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10403, N'S18_3782', 36, CAST(52.22 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10403, N'S24_1578', 46, CAST(114.95 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10403, N'S24_2360', 27, CAST(79.65 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10403, N'S32_2206', 30, CAST(40.23 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10403, N'S32_4485', 45, CAST(115.32 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10403, N'S50_4713', 31, CAST(68.34 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10404, N'S12_1099', 64, CAST(206.24 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10404, N'S12_3380', 43, CAST(109.22 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10404, N'S12_3990', 77, CAST(74.21 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10404, N'S18_3278', 90, CAST(73.17 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10404, N'S18_3482', 28, CAST(133.76 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10404, N'S18_4721', 48, CAST(144.34 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10404, N'S24_3371', 49, CAST(62.45 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10404, N'S24_4620', 48, CAST(93.77 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10405, N'S12_4675', 97, CAST(93.28 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10405, N'S18_1889', 61, CAST(73.92 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10405, N'S18_3232', 55, CAST(150.71 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10405, N'S24_2972', 47, CAST(44.56 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10405, N'S24_3856', 76, CAST(154.47 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10406, N'S18_1129', 61, CAST(137.29 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10406, N'S18_1984', 48, CAST(149.36 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10406, N'S18_3685', 65, CAST(161.06 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10407, N'S18_1589', 59, CAST(119.46 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10407, N'S18_1749', 76, CAST(185.30 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10407, N'S18_2248', 42, CAST(72.65 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10407, N'S18_2870', 41, CAST(155.76 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10407, N'S18_4409', 6, CAST(90.19 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10407, N'S18_4933', 66, CAST(66.99 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10407, N'S24_1046', 26, CAST(76.43 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10407, N'S24_1628', 64, CAST(40.25 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10407, N'S24_2766', 76, CAST(94.50 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10407, N'S24_2887', 59, CAST(98.65 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10407, N'S24_3191', 13, CAST(81.33 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10407, N'S24_3432', 43, CAST(86.73 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10408, N'S24_3969', 15, CAST(36.93 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10409, N'S18_2325', 6, CAST(130.94 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10409, N'S24_1937', 61, CAST(29.54 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10410, N'S18_1342', 65, CAST(117.12 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10410, N'S18_1367', 44, CAST(58.22 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10410, N'S18_2795', 56, CAST(138.38 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10410, N'S18_2949', 47, CAST(117.52 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10410, N'S18_2957', 53, CAST(58.09 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10410, N'S18_3136', 34, CAST(115.19 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10410, N'S18_3320', 44, CAST(84.33 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10410, N'S24_2022', 31, CAST(45.25 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10410, N'S24_4258', 50, CAST(86.68 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10411, N'S10_1949', 23, CAST(180.01 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10411, N'S10_4962', 27, CAST(163.99 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10411, N'S12_1666', 40, CAST(155.80 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10411, N'S18_1097', 27, CAST(119.00 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10411, N'S18_4600', 46, CAST(113.82 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10411, N'S18_4668', 35, CAST(59.87 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10411, N'S32_1268', 26, CAST(111.72 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10411, N'S32_3522', 27, CAST(69.16 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10411, N'S700_2824', 34, CAST(105.20 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10412, N'S12_4473', 54, CAST(110.21 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10412, N'S18_2238', 41, CAST(163.73 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10412, N'S18_2319', 56, CAST(98.18 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10412, N'S18_2432', 47, CAST(61.99 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10412, N'S18_3232', 60, CAST(198.13 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10412, N'S24_1444', 21, CAST(52.60 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10412, N'S24_2300', 70, CAST(121.40 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10412, N'S24_2840', 30, CAST(36.07 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10412, N'S24_4048', 31, CAST(137.20 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10412, N'S32_2509', 19, CAST(48.70 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10412, N'S50_1392', 26, CAST(133.11 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10413, N'S12_1108', 36, CAST(241.05 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10413, N'S12_3148', 47, CAST(175.25 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10413, N'S12_3891', 22, CAST(153.99 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10413, N'S18_4027', 49, CAST(140.75 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10413, N'S32_3207', 24, CAST(49.71 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10413, N'S50_1514', 51, CAST(63.85 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10414, N'S10_4757', 19, CAST(145.52 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10414, N'S18_3029', 44, CAST(73.98 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10414, N'S18_3140', 41, CAST(118.83 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10414, N'S18_3259', 48, CAST(121.01 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10414, N'S18_4522', 16, CAST(75.48 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10414, N'S24_2011', 23, CAST(145.01 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10414, N'S24_3151', 60, CAST(101.79 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10414, N'S24_3816', 51, CAST(76.31 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10414, N'S700_1138', 37, CAST(71.34 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10414, N'S700_1938', 34, CAST(103.93 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10414, N'S700_2610', 31, CAST(75.89 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10414, N'S700_3505', 28, CAST(108.18 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10414, N'S700_3962', 27, CAST(90.37 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10414, N'S72_3212', 47, CAST(65.52 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10415, N'S18_3856', 51, CAST(121.75 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10415, N'S24_2841', 21, CAST(67.82 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10415, N'S24_3420', 18, CAST(69.70 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10415, N'S700_2047', 32, CAST(95.95 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10415, N'S72_1253', 42, CAST(57.61 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10416, N'S18_1662', 24, CAST(181.34 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10416, N'S18_2581', 15, CAST(98.84 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10416, N'S24_1785', 47, CAST(88.63 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10416, N'S24_2000', 32, CAST(87.60 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10416, N'S24_3949', 18, CAST(75.06 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10416, N'S24_4278', 48, CAST(74.62 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10416, N'S32_1374', 45, CAST(105.88 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10416, N'S32_4289', 26, CAST(61.22 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10416, N'S50_1341', 37, CAST(51.93 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10416, N'S700_1691', 23, CAST(91.34 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10416, N'S700_2466', 22, CAST(111.69 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10416, N'S700_2834', 41, CAST(137.63 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10416, N'S700_3167', 39, CAST(67.20 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10416, N'S700_4002', 43, CAST(62.19 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10417, N'S10_1678', 66, CAST(113.88 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10417, N'S10_2016', 45, CAST(130.83 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10417, N'S10_4698', 56, CAST(164.61 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10417, N'S12_2823', 21, CAST(164.18 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10417, N'S18_2625', 36, CAST(61.18 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10417, N'S24_1578', 35, CAST(101.43 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10418, N'S18_3278', 16, CAST(76.39 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10418, N'S18_3482', 27, CAST(164.63 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10418, N'S18_3782', 33, CAST(52.84 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10418, N'S18_4721', 28, CAST(136.90 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10418, N'S24_2360', 52, CAST(65.80 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10418, N'S24_4620', 10, CAST(87.31 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10418, N'S32_2206', 43, CAST(48.28 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10418, N'S32_4485', 50, CAST(113.28 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10418, N'S50_4713', 40, CAST(72.41 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10419, N'S12_1099', 12, CAST(163.44 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10419, N'S12_3380', 10, CAST(109.22 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10419, N'S12_3990', 34, CAST(90.17 AS Decimal(20, 2)), 14)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10419, N'S12_4675', 32, CAST(119.77 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10419, N'S18_1129', 38, CAST(117.48 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10419, N'S18_1589', 37, CAST(140.62 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10419, N'S18_1889', 39, CAST(83.93 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10419, N'S18_1984', 34, CAST(135.14 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10419, N'S18_2870', 55, CAST(139.92 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10419, N'S18_3232', 35, CAST(169.34 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10419, N'S18_3685', 43, CAST(129.98 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10419, N'S24_2972', 15, CAST(42.67 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10419, N'S24_3371', 55, CAST(52.66 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10419, N'S24_3856', 70, CAST(132.00 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10420, N'S18_1749', 37, CAST(142.80 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10420, N'S18_2248', 36, CAST(63.57 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10420, N'S18_2325', 45, CAST(110.60 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10420, N'S18_4409', 66, CAST(92.95 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10420, N'S18_4933', 36, CAST(57.73 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10420, N'S24_1046', 60, CAST(64.67 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10420, N'S24_1628', 37, CAST(60.37 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10420, N'S24_1937', 45, CAST(26.88 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10420, N'S24_2766', 39, CAST(100.87 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10420, N'S24_2887', 55, CAST(96.30 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10420, N'S24_3191', 35, CAST(96.74 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10420, N'S24_3432', 26, CAST(100.66 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10420, N'S24_3969', 15, CAST(43.49 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10421, N'S18_2795', 35, CAST(155.25 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10421, N'S24_2022', 40, CAST(45.70 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10422, N'S18_1342', 51, CAST(95.55 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10422, N'S18_1367', 25, CAST(51.75 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10423, N'S18_2949', 10, CAST(88.14 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10423, N'S18_2957', 31, CAST(53.72 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10423, N'S18_3136', 21, CAST(84.82 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10423, N'S18_3320', 21, CAST(89.29 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10423, N'S24_4258', 28, CAST(78.89 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10424, N'S10_1949', 50, CAST(240.02 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10424, N'S12_1666', 49, CAST(162.64 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10424, N'S18_1097', 54, CAST(133.00 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10424, N'S18_4668', 26, CAST(59.87 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10424, N'S32_3522', 44, CAST(61.41 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10424, N'S700_2824', 46, CAST(80.92 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10425, N'S10_4962', 38, CAST(155.13 AS Decimal(20, 2)), 12)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10425, N'S12_4473', 33, CAST(142.20 AS Decimal(20, 2)), 4)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10425, N'S18_2238', 28, CAST(189.93 AS Decimal(20, 2)), 3)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10425, N'S18_2319', 38, CAST(99.41 AS Decimal(20, 2)), 7)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10425, N'S18_2432', 19, CAST(49.22 AS Decimal(20, 2)), 10)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10425, N'S18_3232', 28, CAST(135.47 AS Decimal(20, 2)), 8)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10425, N'S18_4600', 38, CAST(113.82 AS Decimal(20, 2)), 13)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10425, N'S24_1444', 55, CAST(46.82 AS Decimal(20, 2)), 1)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10425, N'S24_2300', 49, CAST(112.46 AS Decimal(20, 2)), 9)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10425, N'S24_2840', 31, CAST(33.24 AS Decimal(20, 2)), 5)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10425, N'S32_1268', 41, CAST(86.68 AS Decimal(20, 2)), 11)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10425, N'S32_2509', 11, CAST(43.83 AS Decimal(20, 2)), 6)
GO
INSERT [dbo].[orderdetails] ([orderNumber], [productCode], [quantityOrdered], [priceEach], [orderLineNumber]) VALUES (10425, N'S50_1392', 18, CAST(105.33 AS Decimal(20, 2)), 2)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10100, CAST(N'2003-01-06T00:00:00.000' AS DateTime), CAST(N'2003-01-13T00:00:00.000' AS DateTime), CAST(N'2003-01-10T00:00:00.000' AS DateTime), N'Shipped', NULL, 363)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10101, CAST(N'2003-01-09T00:00:00.000' AS DateTime), CAST(N'2003-01-18T00:00:00.000' AS DateTime), CAST(N'2003-01-11T00:00:00.000' AS DateTime), N'Shipped', N'Check on availability.', 128)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10102, CAST(N'2003-01-10T00:00:00.000' AS DateTime), CAST(N'2003-01-18T00:00:00.000' AS DateTime), CAST(N'2003-01-14T00:00:00.000' AS DateTime), N'Shipped', NULL, 181)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10103, CAST(N'2003-01-29T00:00:00.000' AS DateTime), CAST(N'2003-02-07T00:00:00.000' AS DateTime), CAST(N'2003-02-02T00:00:00.000' AS DateTime), N'Shipped', NULL, 121)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10104, CAST(N'2003-01-31T00:00:00.000' AS DateTime), CAST(N'2003-02-09T00:00:00.000' AS DateTime), CAST(N'2003-02-01T00:00:00.000' AS DateTime), N'Shipped', NULL, 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10105, CAST(N'2003-02-11T00:00:00.000' AS DateTime), CAST(N'2003-02-21T00:00:00.000' AS DateTime), CAST(N'2003-02-12T00:00:00.000' AS DateTime), N'Shipped', NULL, 145)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10106, CAST(N'2003-02-17T00:00:00.000' AS DateTime), CAST(N'2003-02-24T00:00:00.000' AS DateTime), CAST(N'2003-02-21T00:00:00.000' AS DateTime), N'Shipped', NULL, 278)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10107, CAST(N'2003-02-24T00:00:00.000' AS DateTime), CAST(N'2003-03-03T00:00:00.000' AS DateTime), CAST(N'2003-02-26T00:00:00.000' AS DateTime), N'Shipped', N'Difficult to negotiate with customer. We need more marketing materials', 131)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10108, CAST(N'2003-03-03T00:00:00.000' AS DateTime), CAST(N'2003-03-12T00:00:00.000' AS DateTime), CAST(N'2003-03-08T00:00:00.000' AS DateTime), N'Shipped', NULL, 385)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10109, CAST(N'2003-03-10T00:00:00.000' AS DateTime), CAST(N'2003-03-19T00:00:00.000' AS DateTime), CAST(N'2003-03-11T00:00:00.000' AS DateTime), N'Shipped', N'Customer requested that FedEx Ground is used for this shipping', 486)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10110, CAST(N'2003-03-18T00:00:00.000' AS DateTime), CAST(N'2003-03-24T00:00:00.000' AS DateTime), CAST(N'2003-03-20T00:00:00.000' AS DateTime), N'Shipped', NULL, 187)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10111, CAST(N'2003-03-25T00:00:00.000' AS DateTime), CAST(N'2003-03-31T00:00:00.000' AS DateTime), CAST(N'2003-03-30T00:00:00.000' AS DateTime), N'Shipped', NULL, 129)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10112, CAST(N'2003-03-24T00:00:00.000' AS DateTime), CAST(N'2003-04-03T00:00:00.000' AS DateTime), CAST(N'2003-03-29T00:00:00.000' AS DateTime), N'Shipped', N'Customer requested that ad materials (such as posters, pamphlets) be included in the shippment', 144)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10113, CAST(N'2003-03-26T00:00:00.000' AS DateTime), CAST(N'2003-04-02T00:00:00.000' AS DateTime), CAST(N'2003-03-27T00:00:00.000' AS DateTime), N'Shipped', NULL, 124)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10114, CAST(N'2003-04-01T00:00:00.000' AS DateTime), CAST(N'2003-04-07T00:00:00.000' AS DateTime), CAST(N'2003-04-02T00:00:00.000' AS DateTime), N'Shipped', NULL, 172)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10115, CAST(N'2003-04-04T00:00:00.000' AS DateTime), CAST(N'2003-04-12T00:00:00.000' AS DateTime), CAST(N'2003-04-07T00:00:00.000' AS DateTime), N'Shipped', NULL, 424)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10116, CAST(N'2003-04-11T00:00:00.000' AS DateTime), CAST(N'2003-04-19T00:00:00.000' AS DateTime), CAST(N'2003-04-13T00:00:00.000' AS DateTime), N'Shipped', NULL, 381)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10117, CAST(N'2003-04-16T00:00:00.000' AS DateTime), CAST(N'2003-04-24T00:00:00.000' AS DateTime), CAST(N'2003-04-17T00:00:00.000' AS DateTime), N'Shipped', NULL, 148)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10118, CAST(N'2003-04-21T00:00:00.000' AS DateTime), CAST(N'2003-04-29T00:00:00.000' AS DateTime), CAST(N'2003-04-26T00:00:00.000' AS DateTime), N'Shipped', N'Customer has worked with some of our vendors in the past and is aware of their MSRP', 216)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10119, CAST(N'2003-04-28T00:00:00.000' AS DateTime), CAST(N'2003-05-05T00:00:00.000' AS DateTime), CAST(N'2003-05-02T00:00:00.000' AS DateTime), N'Shipped', NULL, 382)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10120, CAST(N'2003-04-29T00:00:00.000' AS DateTime), CAST(N'2003-05-08T00:00:00.000' AS DateTime), CAST(N'2003-05-01T00:00:00.000' AS DateTime), N'Shipped', NULL, 114)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10121, CAST(N'2003-05-07T00:00:00.000' AS DateTime), CAST(N'2003-05-13T00:00:00.000' AS DateTime), CAST(N'2003-05-13T00:00:00.000' AS DateTime), N'Shipped', NULL, 353)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10122, CAST(N'2003-05-08T00:00:00.000' AS DateTime), CAST(N'2003-05-16T00:00:00.000' AS DateTime), CAST(N'2003-05-13T00:00:00.000' AS DateTime), N'Shipped', NULL, 350)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10123, CAST(N'2003-05-20T00:00:00.000' AS DateTime), CAST(N'2003-05-29T00:00:00.000' AS DateTime), CAST(N'2003-05-22T00:00:00.000' AS DateTime), N'Shipped', NULL, 103)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10124, CAST(N'2003-05-21T00:00:00.000' AS DateTime), CAST(N'2003-05-29T00:00:00.000' AS DateTime), CAST(N'2003-05-25T00:00:00.000' AS DateTime), N'Shipped', N'Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch', 112)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10125, CAST(N'2003-05-21T00:00:00.000' AS DateTime), CAST(N'2003-05-27T00:00:00.000' AS DateTime), CAST(N'2003-05-24T00:00:00.000' AS DateTime), N'Shipped', NULL, 114)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10126, CAST(N'2003-05-28T00:00:00.000' AS DateTime), CAST(N'2003-06-07T00:00:00.000' AS DateTime), CAST(N'2003-06-02T00:00:00.000' AS DateTime), N'Shipped', NULL, 458)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10127, CAST(N'2003-06-03T00:00:00.000' AS DateTime), CAST(N'2003-06-09T00:00:00.000' AS DateTime), CAST(N'2003-06-06T00:00:00.000' AS DateTime), N'Shipped', N'Customer requested special shippment. The instructions were passed along to the warehouse', 151)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10128, CAST(N'2003-06-06T00:00:00.000' AS DateTime), CAST(N'2003-06-12T00:00:00.000' AS DateTime), CAST(N'2003-06-11T00:00:00.000' AS DateTime), N'Shipped', NULL, 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10129, CAST(N'2003-06-12T00:00:00.000' AS DateTime), CAST(N'2003-06-18T00:00:00.000' AS DateTime), CAST(N'2003-06-14T00:00:00.000' AS DateTime), N'Shipped', NULL, 324)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10130, CAST(N'2003-06-16T00:00:00.000' AS DateTime), CAST(N'2003-06-24T00:00:00.000' AS DateTime), CAST(N'2003-06-21T00:00:00.000' AS DateTime), N'Shipped', NULL, 198)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10131, CAST(N'2003-06-16T00:00:00.000' AS DateTime), CAST(N'2003-06-25T00:00:00.000' AS DateTime), CAST(N'2003-06-21T00:00:00.000' AS DateTime), N'Shipped', NULL, 447)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10132, CAST(N'2003-06-25T00:00:00.000' AS DateTime), CAST(N'2003-07-01T00:00:00.000' AS DateTime), CAST(N'2003-06-28T00:00:00.000' AS DateTime), N'Shipped', NULL, 323)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10133, CAST(N'2003-06-27T00:00:00.000' AS DateTime), CAST(N'2003-07-04T00:00:00.000' AS DateTime), CAST(N'2003-07-03T00:00:00.000' AS DateTime), N'Shipped', NULL, 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10134, CAST(N'2003-07-01T00:00:00.000' AS DateTime), CAST(N'2003-07-10T00:00:00.000' AS DateTime), CAST(N'2003-07-05T00:00:00.000' AS DateTime), N'Shipped', NULL, 250)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10135, CAST(N'2003-07-02T00:00:00.000' AS DateTime), CAST(N'2003-07-12T00:00:00.000' AS DateTime), CAST(N'2003-07-03T00:00:00.000' AS DateTime), N'Shipped', NULL, 124)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10136, CAST(N'2003-07-04T00:00:00.000' AS DateTime), CAST(N'2003-07-14T00:00:00.000' AS DateTime), CAST(N'2003-07-06T00:00:00.000' AS DateTime), N'Shipped', N'Customer is interested in buying more Ferrari models', 242)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10137, CAST(N'2003-07-10T00:00:00.000' AS DateTime), CAST(N'2003-07-20T00:00:00.000' AS DateTime), CAST(N'2003-07-14T00:00:00.000' AS DateTime), N'Shipped', NULL, 353)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10138, CAST(N'2003-07-07T00:00:00.000' AS DateTime), CAST(N'2003-07-16T00:00:00.000' AS DateTime), CAST(N'2003-07-13T00:00:00.000' AS DateTime), N'Shipped', NULL, 496)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10139, CAST(N'2003-07-16T00:00:00.000' AS DateTime), CAST(N'2003-07-23T00:00:00.000' AS DateTime), CAST(N'2003-07-21T00:00:00.000' AS DateTime), N'Shipped', NULL, 282)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10140, CAST(N'2003-07-24T00:00:00.000' AS DateTime), CAST(N'2003-08-02T00:00:00.000' AS DateTime), CAST(N'2003-07-30T00:00:00.000' AS DateTime), N'Shipped', NULL, 161)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10141, CAST(N'2003-08-01T00:00:00.000' AS DateTime), CAST(N'2003-08-09T00:00:00.000' AS DateTime), CAST(N'2003-08-04T00:00:00.000' AS DateTime), N'Shipped', NULL, 334)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10142, CAST(N'2003-08-08T00:00:00.000' AS DateTime), CAST(N'2003-08-16T00:00:00.000' AS DateTime), CAST(N'2003-08-13T00:00:00.000' AS DateTime), N'Shipped', NULL, 124)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10143, CAST(N'2003-08-10T00:00:00.000' AS DateTime), CAST(N'2003-08-18T00:00:00.000' AS DateTime), CAST(N'2003-08-12T00:00:00.000' AS DateTime), N'Shipped', N'Can we deliver the new Ford Mustang models by end-of-quarter?', 320)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10144, CAST(N'2003-08-13T00:00:00.000' AS DateTime), CAST(N'2003-08-21T00:00:00.000' AS DateTime), CAST(N'2003-08-14T00:00:00.000' AS DateTime), N'Shipped', NULL, 381)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10145, CAST(N'2003-08-25T00:00:00.000' AS DateTime), CAST(N'2003-09-02T00:00:00.000' AS DateTime), CAST(N'2003-08-31T00:00:00.000' AS DateTime), N'Shipped', NULL, 205)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10146, CAST(N'2003-09-03T00:00:00.000' AS DateTime), CAST(N'2003-09-13T00:00:00.000' AS DateTime), CAST(N'2003-09-06T00:00:00.000' AS DateTime), N'Shipped', NULL, 447)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10147, CAST(N'2003-09-05T00:00:00.000' AS DateTime), CAST(N'2003-09-12T00:00:00.000' AS DateTime), CAST(N'2003-09-09T00:00:00.000' AS DateTime), N'Shipped', NULL, 379)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10148, CAST(N'2003-09-11T00:00:00.000' AS DateTime), CAST(N'2003-09-21T00:00:00.000' AS DateTime), CAST(N'2003-09-15T00:00:00.000' AS DateTime), N'Shipped', N'They want to reevaluate their terms agreement with Finance.', 276)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10149, CAST(N'2003-09-12T00:00:00.000' AS DateTime), CAST(N'2003-09-18T00:00:00.000' AS DateTime), CAST(N'2003-09-17T00:00:00.000' AS DateTime), N'Shipped', NULL, 487)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10150, CAST(N'2003-09-19T00:00:00.000' AS DateTime), CAST(N'2003-09-27T00:00:00.000' AS DateTime), CAST(N'2003-09-21T00:00:00.000' AS DateTime), N'Shipped', N'They want to reevaluate their terms agreement with Finance.', 148)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10151, CAST(N'2003-09-21T00:00:00.000' AS DateTime), CAST(N'2003-09-30T00:00:00.000' AS DateTime), CAST(N'2003-09-24T00:00:00.000' AS DateTime), N'Shipped', NULL, 311)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10152, CAST(N'2003-09-25T00:00:00.000' AS DateTime), CAST(N'2003-10-03T00:00:00.000' AS DateTime), CAST(N'2003-10-01T00:00:00.000' AS DateTime), N'Shipped', NULL, 333)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10153, CAST(N'2003-09-28T00:00:00.000' AS DateTime), CAST(N'2003-10-05T00:00:00.000' AS DateTime), CAST(N'2003-10-03T00:00:00.000' AS DateTime), N'Shipped', NULL, 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10154, CAST(N'2003-10-02T00:00:00.000' AS DateTime), CAST(N'2003-10-12T00:00:00.000' AS DateTime), CAST(N'2003-10-08T00:00:00.000' AS DateTime), N'Shipped', NULL, 219)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10155, CAST(N'2003-10-06T00:00:00.000' AS DateTime), CAST(N'2003-10-13T00:00:00.000' AS DateTime), CAST(N'2003-10-07T00:00:00.000' AS DateTime), N'Shipped', NULL, 186)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10156, CAST(N'2003-10-08T00:00:00.000' AS DateTime), CAST(N'2003-10-17T00:00:00.000' AS DateTime), CAST(N'2003-10-11T00:00:00.000' AS DateTime), N'Shipped', NULL, 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10157, CAST(N'2003-10-09T00:00:00.000' AS DateTime), CAST(N'2003-10-15T00:00:00.000' AS DateTime), CAST(N'2003-10-14T00:00:00.000' AS DateTime), N'Shipped', NULL, 473)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10158, CAST(N'2003-10-10T00:00:00.000' AS DateTime), CAST(N'2003-10-18T00:00:00.000' AS DateTime), CAST(N'2003-10-15T00:00:00.000' AS DateTime), N'Shipped', NULL, 121)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10159, CAST(N'2003-10-10T00:00:00.000' AS DateTime), CAST(N'2003-10-19T00:00:00.000' AS DateTime), CAST(N'2003-10-16T00:00:00.000' AS DateTime), N'Shipped', NULL, 321)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10160, CAST(N'2003-10-11T00:00:00.000' AS DateTime), CAST(N'2003-10-17T00:00:00.000' AS DateTime), CAST(N'2003-10-17T00:00:00.000' AS DateTime), N'Shipped', NULL, 347)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10161, CAST(N'2003-10-17T00:00:00.000' AS DateTime), CAST(N'2003-10-25T00:00:00.000' AS DateTime), CAST(N'2003-10-20T00:00:00.000' AS DateTime), N'Shipped', NULL, 227)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10162, CAST(N'2003-10-18T00:00:00.000' AS DateTime), CAST(N'2003-10-26T00:00:00.000' AS DateTime), CAST(N'2003-10-19T00:00:00.000' AS DateTime), N'Shipped', NULL, 321)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10163, CAST(N'2003-10-20T00:00:00.000' AS DateTime), CAST(N'2003-10-27T00:00:00.000' AS DateTime), CAST(N'2003-10-24T00:00:00.000' AS DateTime), N'Shipped', NULL, 424)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10164, CAST(N'2003-10-21T00:00:00.000' AS DateTime), CAST(N'2003-10-30T00:00:00.000' AS DateTime), CAST(N'2003-10-23T00:00:00.000' AS DateTime), N'Resolved', N'This order was disputed, but resolved on 11/1/2003; Customer doesn''t like the colors and precision of the models.', 452)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10165, CAST(N'2003-10-22T00:00:00.000' AS DateTime), CAST(N'2003-10-31T00:00:00.000' AS DateTime), CAST(N'2003-12-26T00:00:00.000' AS DateTime), N'Shipped', N'This order was on hold because customers''s credit limit had been exceeded. Order will ship when payment is received', 148)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10166, CAST(N'2003-10-21T00:00:00.000' AS DateTime), CAST(N'2003-10-30T00:00:00.000' AS DateTime), CAST(N'2003-10-27T00:00:00.000' AS DateTime), N'Shipped', NULL, 462)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10167, CAST(N'2003-10-23T00:00:00.000' AS DateTime), CAST(N'2003-10-30T00:00:00.000' AS DateTime), NULL, N'Cancelled', N'Customer called to cancel. The warehouse was notified in time and the order didn''t ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them.', 448)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10168, CAST(N'2003-10-28T00:00:00.000' AS DateTime), CAST(N'2003-11-03T00:00:00.000' AS DateTime), CAST(N'2003-11-01T00:00:00.000' AS DateTime), N'Shipped', NULL, 161)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10169, CAST(N'2003-11-04T00:00:00.000' AS DateTime), CAST(N'2003-11-14T00:00:00.000' AS DateTime), CAST(N'2003-11-09T00:00:00.000' AS DateTime), N'Shipped', NULL, 276)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10170, CAST(N'2003-11-04T00:00:00.000' AS DateTime), CAST(N'2003-11-12T00:00:00.000' AS DateTime), CAST(N'2003-11-07T00:00:00.000' AS DateTime), N'Shipped', NULL, 452)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10171, CAST(N'2003-11-05T00:00:00.000' AS DateTime), CAST(N'2003-11-13T00:00:00.000' AS DateTime), CAST(N'2003-11-07T00:00:00.000' AS DateTime), N'Shipped', NULL, 233)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10172, CAST(N'2003-11-05T00:00:00.000' AS DateTime), CAST(N'2003-11-14T00:00:00.000' AS DateTime), CAST(N'2003-11-11T00:00:00.000' AS DateTime), N'Shipped', NULL, 175)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10173, CAST(N'2003-11-05T00:00:00.000' AS DateTime), CAST(N'2003-11-15T00:00:00.000' AS DateTime), CAST(N'2003-11-09T00:00:00.000' AS DateTime), N'Shipped', N'Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches', 278)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10174, CAST(N'2003-11-06T00:00:00.000' AS DateTime), CAST(N'2003-11-15T00:00:00.000' AS DateTime), CAST(N'2003-11-10T00:00:00.000' AS DateTime), N'Shipped', NULL, 333)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10175, CAST(N'2003-11-06T00:00:00.000' AS DateTime), CAST(N'2003-11-14T00:00:00.000' AS DateTime), CAST(N'2003-11-09T00:00:00.000' AS DateTime), N'Shipped', NULL, 324)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10176, CAST(N'2003-11-06T00:00:00.000' AS DateTime), CAST(N'2003-11-15T00:00:00.000' AS DateTime), CAST(N'2003-11-12T00:00:00.000' AS DateTime), N'Shipped', NULL, 386)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10177, CAST(N'2003-11-07T00:00:00.000' AS DateTime), CAST(N'2003-11-17T00:00:00.000' AS DateTime), CAST(N'2003-11-12T00:00:00.000' AS DateTime), N'Shipped', NULL, 344)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10178, CAST(N'2003-11-08T00:00:00.000' AS DateTime), CAST(N'2003-11-16T00:00:00.000' AS DateTime), CAST(N'2003-11-10T00:00:00.000' AS DateTime), N'Shipped', N'Custom shipping instructions sent to warehouse', 242)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10179, CAST(N'2003-11-11T00:00:00.000' AS DateTime), CAST(N'2003-11-17T00:00:00.000' AS DateTime), CAST(N'2003-11-13T00:00:00.000' AS DateTime), N'Cancelled', N'Customer cancelled due to urgent budgeting issues. Must be cautious when dealing with them in the future. Since order shipped already we must discuss who would cover the shipping charges.', 496)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10180, CAST(N'2003-11-11T00:00:00.000' AS DateTime), CAST(N'2003-11-19T00:00:00.000' AS DateTime), CAST(N'2003-11-14T00:00:00.000' AS DateTime), N'Shipped', NULL, 171)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10181, CAST(N'2003-11-12T00:00:00.000' AS DateTime), CAST(N'2003-11-19T00:00:00.000' AS DateTime), CAST(N'2003-11-15T00:00:00.000' AS DateTime), N'Shipped', NULL, 167)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10182, CAST(N'2003-11-12T00:00:00.000' AS DateTime), CAST(N'2003-11-21T00:00:00.000' AS DateTime), CAST(N'2003-11-18T00:00:00.000' AS DateTime), N'Shipped', NULL, 124)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10183, CAST(N'2003-11-13T00:00:00.000' AS DateTime), CAST(N'2003-11-22T00:00:00.000' AS DateTime), CAST(N'2003-11-15T00:00:00.000' AS DateTime), N'Shipped', N'We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.', 339)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10184, CAST(N'2003-11-14T00:00:00.000' AS DateTime), CAST(N'2003-11-22T00:00:00.000' AS DateTime), CAST(N'2003-11-20T00:00:00.000' AS DateTime), N'Shipped', NULL, 484)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10185, CAST(N'2003-11-14T00:00:00.000' AS DateTime), CAST(N'2003-11-21T00:00:00.000' AS DateTime), CAST(N'2003-11-20T00:00:00.000' AS DateTime), N'Shipped', NULL, 320)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10186, CAST(N'2003-11-14T00:00:00.000' AS DateTime), CAST(N'2003-11-20T00:00:00.000' AS DateTime), CAST(N'2003-11-18T00:00:00.000' AS DateTime), N'Shipped', N'They want to reevaluate their terms agreement with the VP of Sales', 489)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10187, CAST(N'2003-11-15T00:00:00.000' AS DateTime), CAST(N'2003-11-24T00:00:00.000' AS DateTime), CAST(N'2003-11-16T00:00:00.000' AS DateTime), N'Shipped', NULL, 211)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10188, CAST(N'2003-11-18T00:00:00.000' AS DateTime), CAST(N'2003-11-26T00:00:00.000' AS DateTime), CAST(N'2003-11-24T00:00:00.000' AS DateTime), N'Shipped', NULL, 167)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10189, CAST(N'2003-11-18T00:00:00.000' AS DateTime), CAST(N'2003-11-25T00:00:00.000' AS DateTime), CAST(N'2003-11-24T00:00:00.000' AS DateTime), N'Shipped', N'They want to reevaluate their terms agreement with Finance.', 205)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10190, CAST(N'2003-11-19T00:00:00.000' AS DateTime), CAST(N'2003-11-29T00:00:00.000' AS DateTime), CAST(N'2003-11-20T00:00:00.000' AS DateTime), N'Shipped', NULL, 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10191, CAST(N'2003-11-20T00:00:00.000' AS DateTime), CAST(N'2003-11-30T00:00:00.000' AS DateTime), CAST(N'2003-11-24T00:00:00.000' AS DateTime), N'Shipped', N'We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.', 259)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10192, CAST(N'2003-11-20T00:00:00.000' AS DateTime), CAST(N'2003-11-29T00:00:00.000' AS DateTime), CAST(N'2003-11-25T00:00:00.000' AS DateTime), N'Shipped', NULL, 363)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10193, CAST(N'2003-11-21T00:00:00.000' AS DateTime), CAST(N'2003-11-28T00:00:00.000' AS DateTime), CAST(N'2003-11-27T00:00:00.000' AS DateTime), N'Shipped', NULL, 471)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10194, CAST(N'2003-11-25T00:00:00.000' AS DateTime), CAST(N'2003-12-02T00:00:00.000' AS DateTime), CAST(N'2003-11-26T00:00:00.000' AS DateTime), N'Shipped', NULL, 146)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10195, CAST(N'2003-11-25T00:00:00.000' AS DateTime), CAST(N'2003-12-01T00:00:00.000' AS DateTime), CAST(N'2003-11-28T00:00:00.000' AS DateTime), N'Shipped', NULL, 319)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10196, CAST(N'2003-11-26T00:00:00.000' AS DateTime), CAST(N'2003-12-03T00:00:00.000' AS DateTime), CAST(N'2003-12-01T00:00:00.000' AS DateTime), N'Shipped', NULL, 455)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10197, CAST(N'2003-11-26T00:00:00.000' AS DateTime), CAST(N'2003-12-02T00:00:00.000' AS DateTime), CAST(N'2003-12-01T00:00:00.000' AS DateTime), N'Shipped', N'Customer inquired about remote controlled models and gold models.', 216)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10198, CAST(N'2003-11-27T00:00:00.000' AS DateTime), CAST(N'2003-12-06T00:00:00.000' AS DateTime), CAST(N'2003-12-03T00:00:00.000' AS DateTime), N'Shipped', NULL, 385)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10199, CAST(N'2003-12-01T00:00:00.000' AS DateTime), CAST(N'2003-12-10T00:00:00.000' AS DateTime), CAST(N'2003-12-06T00:00:00.000' AS DateTime), N'Shipped', NULL, 475)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10200, CAST(N'2003-12-01T00:00:00.000' AS DateTime), CAST(N'2003-12-09T00:00:00.000' AS DateTime), CAST(N'2003-12-06T00:00:00.000' AS DateTime), N'Shipped', NULL, 211)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10201, CAST(N'2003-12-01T00:00:00.000' AS DateTime), CAST(N'2003-12-11T00:00:00.000' AS DateTime), CAST(N'2003-12-02T00:00:00.000' AS DateTime), N'Shipped', NULL, 129)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10202, CAST(N'2003-12-02T00:00:00.000' AS DateTime), CAST(N'2003-12-09T00:00:00.000' AS DateTime), CAST(N'2003-12-06T00:00:00.000' AS DateTime), N'Shipped', NULL, 357)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10203, CAST(N'2003-12-02T00:00:00.000' AS DateTime), CAST(N'2003-12-11T00:00:00.000' AS DateTime), CAST(N'2003-12-07T00:00:00.000' AS DateTime), N'Shipped', NULL, 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10204, CAST(N'2003-12-02T00:00:00.000' AS DateTime), CAST(N'2003-12-10T00:00:00.000' AS DateTime), CAST(N'2003-12-04T00:00:00.000' AS DateTime), N'Shipped', NULL, 151)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10205, CAST(N'2003-12-03T00:00:00.000' AS DateTime), CAST(N'2003-12-09T00:00:00.000' AS DateTime), CAST(N'2003-12-07T00:00:00.000' AS DateTime), N'Shipped', N' I need all the information I can get on our competitors.', 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10206, CAST(N'2003-12-05T00:00:00.000' AS DateTime), CAST(N'2003-12-13T00:00:00.000' AS DateTime), CAST(N'2003-12-08T00:00:00.000' AS DateTime), N'Shipped', N'Can we renegotiate this one?', 202)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10207, CAST(N'2003-12-09T00:00:00.000' AS DateTime), CAST(N'2003-12-17T00:00:00.000' AS DateTime), CAST(N'2003-12-11T00:00:00.000' AS DateTime), N'Shipped', N'Check on availability.', 495)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10208, CAST(N'2004-01-02T00:00:00.000' AS DateTime), CAST(N'2004-01-11T00:00:00.000' AS DateTime), CAST(N'2004-01-04T00:00:00.000' AS DateTime), N'Shipped', NULL, 146)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10209, CAST(N'2004-01-09T00:00:00.000' AS DateTime), CAST(N'2004-01-15T00:00:00.000' AS DateTime), CAST(N'2004-01-12T00:00:00.000' AS DateTime), N'Shipped', NULL, 347)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10210, CAST(N'2004-01-12T00:00:00.000' AS DateTime), CAST(N'2004-01-22T00:00:00.000' AS DateTime), CAST(N'2004-01-20T00:00:00.000' AS DateTime), N'Shipped', NULL, 177)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10211, CAST(N'2004-01-15T00:00:00.000' AS DateTime), CAST(N'2004-01-25T00:00:00.000' AS DateTime), CAST(N'2004-01-18T00:00:00.000' AS DateTime), N'Shipped', NULL, 406)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10212, CAST(N'2004-01-16T00:00:00.000' AS DateTime), CAST(N'2004-01-24T00:00:00.000' AS DateTime), CAST(N'2004-01-18T00:00:00.000' AS DateTime), N'Shipped', NULL, 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10213, CAST(N'2004-01-22T00:00:00.000' AS DateTime), CAST(N'2004-01-28T00:00:00.000' AS DateTime), CAST(N'2004-01-27T00:00:00.000' AS DateTime), N'Shipped', N'Difficult to negotiate with customer. We need more marketing materials', 489)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10214, CAST(N'2004-01-26T00:00:00.000' AS DateTime), CAST(N'2004-02-04T00:00:00.000' AS DateTime), CAST(N'2004-01-29T00:00:00.000' AS DateTime), N'Shipped', NULL, 458)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10215, CAST(N'2004-01-29T00:00:00.000' AS DateTime), CAST(N'2004-02-08T00:00:00.000' AS DateTime), CAST(N'2004-02-01T00:00:00.000' AS DateTime), N'Shipped', N'Customer requested that FedEx Ground is used for this shipping', 475)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10216, CAST(N'2004-02-02T00:00:00.000' AS DateTime), CAST(N'2004-02-10T00:00:00.000' AS DateTime), CAST(N'2004-02-04T00:00:00.000' AS DateTime), N'Shipped', NULL, 256)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10217, CAST(N'2004-02-04T00:00:00.000' AS DateTime), CAST(N'2004-02-14T00:00:00.000' AS DateTime), CAST(N'2004-02-06T00:00:00.000' AS DateTime), N'Shipped', NULL, 166)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10218, CAST(N'2004-02-09T00:00:00.000' AS DateTime), CAST(N'2004-02-16T00:00:00.000' AS DateTime), CAST(N'2004-02-11T00:00:00.000' AS DateTime), N'Shipped', N'Customer requested that ad materials (such as posters, pamphlets) be included in the shippment', 473)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10219, CAST(N'2004-02-10T00:00:00.000' AS DateTime), CAST(N'2004-02-17T00:00:00.000' AS DateTime), CAST(N'2004-02-12T00:00:00.000' AS DateTime), N'Shipped', NULL, 487)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10220, CAST(N'2004-02-12T00:00:00.000' AS DateTime), CAST(N'2004-02-19T00:00:00.000' AS DateTime), CAST(N'2004-02-16T00:00:00.000' AS DateTime), N'Shipped', NULL, 189)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10221, CAST(N'2004-02-18T00:00:00.000' AS DateTime), CAST(N'2004-02-26T00:00:00.000' AS DateTime), CAST(N'2004-02-19T00:00:00.000' AS DateTime), N'Shipped', NULL, 314)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10222, CAST(N'2004-02-19T00:00:00.000' AS DateTime), CAST(N'2004-02-27T00:00:00.000' AS DateTime), CAST(N'2004-02-20T00:00:00.000' AS DateTime), N'Shipped', NULL, 239)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10223, CAST(N'2004-02-20T00:00:00.000' AS DateTime), CAST(N'2004-02-29T00:00:00.000' AS DateTime), CAST(N'2004-02-24T00:00:00.000' AS DateTime), N'Shipped', NULL, 114)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10224, CAST(N'2004-02-21T00:00:00.000' AS DateTime), CAST(N'2004-03-02T00:00:00.000' AS DateTime), CAST(N'2004-02-26T00:00:00.000' AS DateTime), N'Shipped', N'Customer has worked with some of our vendors in the past and is aware of their MSRP', 171)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10225, CAST(N'2004-02-22T00:00:00.000' AS DateTime), CAST(N'2004-03-01T00:00:00.000' AS DateTime), CAST(N'2004-02-24T00:00:00.000' AS DateTime), N'Shipped', NULL, 298)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10226, CAST(N'2004-02-26T00:00:00.000' AS DateTime), CAST(N'2004-03-06T00:00:00.000' AS DateTime), CAST(N'2004-03-02T00:00:00.000' AS DateTime), N'Shipped', NULL, 239)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10227, CAST(N'2004-03-02T00:00:00.000' AS DateTime), CAST(N'2004-03-12T00:00:00.000' AS DateTime), CAST(N'2004-03-08T00:00:00.000' AS DateTime), N'Shipped', NULL, 146)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10228, CAST(N'2004-03-10T00:00:00.000' AS DateTime), CAST(N'2004-03-18T00:00:00.000' AS DateTime), CAST(N'2004-03-13T00:00:00.000' AS DateTime), N'Shipped', NULL, 173)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10229, CAST(N'2004-03-11T00:00:00.000' AS DateTime), CAST(N'2004-03-20T00:00:00.000' AS DateTime), CAST(N'2004-03-12T00:00:00.000' AS DateTime), N'Shipped', NULL, 124)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10230, CAST(N'2004-03-15T00:00:00.000' AS DateTime), CAST(N'2004-03-24T00:00:00.000' AS DateTime), CAST(N'2004-03-20T00:00:00.000' AS DateTime), N'Shipped', N'Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch', 128)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10231, CAST(N'2004-03-19T00:00:00.000' AS DateTime), CAST(N'2004-03-26T00:00:00.000' AS DateTime), CAST(N'2004-03-25T00:00:00.000' AS DateTime), N'Shipped', NULL, 344)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10232, CAST(N'2004-03-20T00:00:00.000' AS DateTime), CAST(N'2004-03-30T00:00:00.000' AS DateTime), CAST(N'2004-03-25T00:00:00.000' AS DateTime), N'Shipped', NULL, 240)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10233, CAST(N'2004-03-29T00:00:00.000' AS DateTime), CAST(N'2004-04-04T00:00:00.000' AS DateTime), CAST(N'2004-04-02T00:00:00.000' AS DateTime), N'Shipped', N'Customer requested special shippment. The instructions were passed along to the warehouse', 328)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10234, CAST(N'2004-03-30T00:00:00.000' AS DateTime), CAST(N'2004-04-05T00:00:00.000' AS DateTime), CAST(N'2004-04-02T00:00:00.000' AS DateTime), N'Shipped', NULL, 412)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10235, CAST(N'2004-04-02T00:00:00.000' AS DateTime), CAST(N'2004-04-12T00:00:00.000' AS DateTime), CAST(N'2004-04-06T00:00:00.000' AS DateTime), N'Shipped', NULL, 260)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10236, CAST(N'2004-04-03T00:00:00.000' AS DateTime), CAST(N'2004-04-11T00:00:00.000' AS DateTime), CAST(N'2004-04-08T00:00:00.000' AS DateTime), N'Shipped', NULL, 486)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10237, CAST(N'2004-04-05T00:00:00.000' AS DateTime), CAST(N'2004-04-12T00:00:00.000' AS DateTime), CAST(N'2004-04-10T00:00:00.000' AS DateTime), N'Shipped', NULL, 181)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10238, CAST(N'2004-04-09T00:00:00.000' AS DateTime), CAST(N'2004-04-16T00:00:00.000' AS DateTime), CAST(N'2004-04-10T00:00:00.000' AS DateTime), N'Shipped', NULL, 145)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10239, CAST(N'2004-04-12T00:00:00.000' AS DateTime), CAST(N'2004-04-21T00:00:00.000' AS DateTime), CAST(N'2004-04-17T00:00:00.000' AS DateTime), N'Shipped', NULL, 311)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10240, CAST(N'2004-04-13T00:00:00.000' AS DateTime), CAST(N'2004-04-20T00:00:00.000' AS DateTime), CAST(N'2004-04-20T00:00:00.000' AS DateTime), N'Shipped', NULL, 177)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10241, CAST(N'2004-04-13T00:00:00.000' AS DateTime), CAST(N'2004-04-20T00:00:00.000' AS DateTime), CAST(N'2004-04-19T00:00:00.000' AS DateTime), N'Shipped', NULL, 209)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10242, CAST(N'2004-04-20T00:00:00.000' AS DateTime), CAST(N'2004-04-28T00:00:00.000' AS DateTime), CAST(N'2004-04-25T00:00:00.000' AS DateTime), N'Shipped', N'Customer is interested in buying more Ferrari models', 456)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10243, CAST(N'2004-04-26T00:00:00.000' AS DateTime), CAST(N'2004-05-03T00:00:00.000' AS DateTime), CAST(N'2004-04-28T00:00:00.000' AS DateTime), N'Shipped', NULL, 495)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10244, CAST(N'2004-04-29T00:00:00.000' AS DateTime), CAST(N'2004-05-09T00:00:00.000' AS DateTime), CAST(N'2004-05-04T00:00:00.000' AS DateTime), N'Shipped', NULL, 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10245, CAST(N'2004-05-04T00:00:00.000' AS DateTime), CAST(N'2004-05-12T00:00:00.000' AS DateTime), CAST(N'2004-05-09T00:00:00.000' AS DateTime), N'Shipped', NULL, 455)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10246, CAST(N'2004-05-05T00:00:00.000' AS DateTime), CAST(N'2004-05-13T00:00:00.000' AS DateTime), CAST(N'2004-05-06T00:00:00.000' AS DateTime), N'Shipped', NULL, 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10247, CAST(N'2004-05-05T00:00:00.000' AS DateTime), CAST(N'2004-05-11T00:00:00.000' AS DateTime), CAST(N'2004-05-08T00:00:00.000' AS DateTime), N'Shipped', NULL, 334)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10248, CAST(N'2004-05-07T00:00:00.000' AS DateTime), CAST(N'2004-05-14T00:00:00.000' AS DateTime), NULL, N'Cancelled', N'Order was mistakenly placed. The warehouse noticed the lack of documentation.', 131)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10249, CAST(N'2004-05-08T00:00:00.000' AS DateTime), CAST(N'2004-05-17T00:00:00.000' AS DateTime), CAST(N'2004-05-11T00:00:00.000' AS DateTime), N'Shipped', N'Can we deliver the new Ford Mustang models by end-of-quarter?', 173)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10250, CAST(N'2004-05-11T00:00:00.000' AS DateTime), CAST(N'2004-05-19T00:00:00.000' AS DateTime), CAST(N'2004-05-15T00:00:00.000' AS DateTime), N'Shipped', NULL, 450)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10251, CAST(N'2004-05-18T00:00:00.000' AS DateTime), CAST(N'2004-05-24T00:00:00.000' AS DateTime), CAST(N'2004-05-24T00:00:00.000' AS DateTime), N'Shipped', NULL, 328)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10252, CAST(N'2004-05-26T00:00:00.000' AS DateTime), CAST(N'2004-06-04T00:00:00.000' AS DateTime), CAST(N'2004-05-29T00:00:00.000' AS DateTime), N'Shipped', NULL, 406)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10253, CAST(N'2004-06-01T00:00:00.000' AS DateTime), CAST(N'2004-06-09T00:00:00.000' AS DateTime), CAST(N'2004-06-02T00:00:00.000' AS DateTime), N'Cancelled', N'Customer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees.', 201)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10254, CAST(N'2004-06-03T00:00:00.000' AS DateTime), CAST(N'2004-06-13T00:00:00.000' AS DateTime), CAST(N'2004-06-04T00:00:00.000' AS DateTime), N'Shipped', N'Customer requested that DHL is used for this shipping', 323)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10255, CAST(N'2004-06-04T00:00:00.000' AS DateTime), CAST(N'2004-06-12T00:00:00.000' AS DateTime), CAST(N'2004-06-09T00:00:00.000' AS DateTime), N'Shipped', NULL, 209)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10256, CAST(N'2004-06-08T00:00:00.000' AS DateTime), CAST(N'2004-06-16T00:00:00.000' AS DateTime), CAST(N'2004-06-10T00:00:00.000' AS DateTime), N'Shipped', NULL, 145)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10257, CAST(N'2004-06-14T00:00:00.000' AS DateTime), CAST(N'2004-06-24T00:00:00.000' AS DateTime), CAST(N'2004-06-15T00:00:00.000' AS DateTime), N'Shipped', NULL, 450)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10258, CAST(N'2004-06-15T00:00:00.000' AS DateTime), CAST(N'2004-06-25T00:00:00.000' AS DateTime), CAST(N'2004-06-23T00:00:00.000' AS DateTime), N'Shipped', NULL, 398)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10259, CAST(N'2004-06-15T00:00:00.000' AS DateTime), CAST(N'2004-06-22T00:00:00.000' AS DateTime), CAST(N'2004-06-17T00:00:00.000' AS DateTime), N'Shipped', NULL, 166)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10260, CAST(N'2004-06-16T00:00:00.000' AS DateTime), CAST(N'2004-06-22T00:00:00.000' AS DateTime), NULL, N'Cancelled', N'Customer heard complaints from their customers and called to cancel this order. Will notify the Sales Manager.', 357)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10261, CAST(N'2004-06-17T00:00:00.000' AS DateTime), CAST(N'2004-06-25T00:00:00.000' AS DateTime), CAST(N'2004-06-22T00:00:00.000' AS DateTime), N'Shipped', NULL, 233)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10262, CAST(N'2004-06-24T00:00:00.000' AS DateTime), CAST(N'2004-07-01T00:00:00.000' AS DateTime), NULL, N'Cancelled', N'This customer found a better offer from one of our competitors. Will call back to renegotiate.', 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10263, CAST(N'2004-06-28T00:00:00.000' AS DateTime), CAST(N'2004-07-04T00:00:00.000' AS DateTime), CAST(N'2004-07-02T00:00:00.000' AS DateTime), N'Shipped', NULL, 175)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10264, CAST(N'2004-06-30T00:00:00.000' AS DateTime), CAST(N'2004-07-06T00:00:00.000' AS DateTime), CAST(N'2004-07-01T00:00:00.000' AS DateTime), N'Shipped', N'Customer will send a truck to our local warehouse on 7/1/2004', 362)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10265, CAST(N'2004-07-02T00:00:00.000' AS DateTime), CAST(N'2004-07-09T00:00:00.000' AS DateTime), CAST(N'2004-07-07T00:00:00.000' AS DateTime), N'Shipped', NULL, 471)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10266, CAST(N'2004-07-06T00:00:00.000' AS DateTime), CAST(N'2004-07-14T00:00:00.000' AS DateTime), CAST(N'2004-07-10T00:00:00.000' AS DateTime), N'Shipped', NULL, 386)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10267, CAST(N'2004-07-07T00:00:00.000' AS DateTime), CAST(N'2004-07-17T00:00:00.000' AS DateTime), CAST(N'2004-07-09T00:00:00.000' AS DateTime), N'Shipped', NULL, 151)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10268, CAST(N'2004-07-12T00:00:00.000' AS DateTime), CAST(N'2004-07-18T00:00:00.000' AS DateTime), CAST(N'2004-07-14T00:00:00.000' AS DateTime), N'Shipped', NULL, 412)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10269, CAST(N'2004-07-16T00:00:00.000' AS DateTime), CAST(N'2004-07-22T00:00:00.000' AS DateTime), CAST(N'2004-07-18T00:00:00.000' AS DateTime), N'Shipped', NULL, 382)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10270, CAST(N'2004-07-19T00:00:00.000' AS DateTime), CAST(N'2004-07-27T00:00:00.000' AS DateTime), CAST(N'2004-07-24T00:00:00.000' AS DateTime), N'Shipped', N'Can we renegotiate this one?', 282)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10271, CAST(N'2004-07-20T00:00:00.000' AS DateTime), CAST(N'2004-07-29T00:00:00.000' AS DateTime), CAST(N'2004-07-23T00:00:00.000' AS DateTime), N'Shipped', NULL, 124)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10272, CAST(N'2004-07-20T00:00:00.000' AS DateTime), CAST(N'2004-07-26T00:00:00.000' AS DateTime), CAST(N'2004-07-22T00:00:00.000' AS DateTime), N'Shipped', NULL, 157)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10273, CAST(N'2004-07-21T00:00:00.000' AS DateTime), CAST(N'2004-07-28T00:00:00.000' AS DateTime), CAST(N'2004-07-22T00:00:00.000' AS DateTime), N'Shipped', NULL, 314)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10274, CAST(N'2004-07-21T00:00:00.000' AS DateTime), CAST(N'2004-07-29T00:00:00.000' AS DateTime), CAST(N'2004-07-22T00:00:00.000' AS DateTime), N'Shipped', NULL, 379)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10275, CAST(N'2004-07-23T00:00:00.000' AS DateTime), CAST(N'2004-08-02T00:00:00.000' AS DateTime), CAST(N'2004-07-29T00:00:00.000' AS DateTime), N'Shipped', NULL, 119)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10276, CAST(N'2004-08-02T00:00:00.000' AS DateTime), CAST(N'2004-08-11T00:00:00.000' AS DateTime), CAST(N'2004-08-08T00:00:00.000' AS DateTime), N'Shipped', NULL, 204)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10277, CAST(N'2004-08-04T00:00:00.000' AS DateTime), CAST(N'2004-08-12T00:00:00.000' AS DateTime), CAST(N'2004-08-05T00:00:00.000' AS DateTime), N'Shipped', NULL, 148)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10278, CAST(N'2004-08-06T00:00:00.000' AS DateTime), CAST(N'2004-08-16T00:00:00.000' AS DateTime), CAST(N'2004-08-09T00:00:00.000' AS DateTime), N'Shipped', NULL, 112)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10279, CAST(N'2004-08-09T00:00:00.000' AS DateTime), CAST(N'2004-08-19T00:00:00.000' AS DateTime), CAST(N'2004-08-15T00:00:00.000' AS DateTime), N'Shipped', N'Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches', 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10280, CAST(N'2004-08-17T00:00:00.000' AS DateTime), CAST(N'2004-08-27T00:00:00.000' AS DateTime), CAST(N'2004-08-19T00:00:00.000' AS DateTime), N'Shipped', NULL, 249)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10281, CAST(N'2004-08-19T00:00:00.000' AS DateTime), CAST(N'2004-08-28T00:00:00.000' AS DateTime), CAST(N'2004-08-23T00:00:00.000' AS DateTime), N'Shipped', NULL, 157)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10282, CAST(N'2004-08-20T00:00:00.000' AS DateTime), CAST(N'2004-08-26T00:00:00.000' AS DateTime), CAST(N'2004-08-22T00:00:00.000' AS DateTime), N'Shipped', NULL, 124)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10283, CAST(N'2004-08-20T00:00:00.000' AS DateTime), CAST(N'2004-08-30T00:00:00.000' AS DateTime), CAST(N'2004-08-23T00:00:00.000' AS DateTime), N'Shipped', NULL, 260)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10284, CAST(N'2004-08-21T00:00:00.000' AS DateTime), CAST(N'2004-08-29T00:00:00.000' AS DateTime), CAST(N'2004-08-26T00:00:00.000' AS DateTime), N'Shipped', N'Custom shipping instructions sent to warehouse', 299)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10285, CAST(N'2004-08-27T00:00:00.000' AS DateTime), CAST(N'2004-09-04T00:00:00.000' AS DateTime), CAST(N'2004-08-31T00:00:00.000' AS DateTime), N'Shipped', NULL, 286)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10286, CAST(N'2004-08-28T00:00:00.000' AS DateTime), CAST(N'2004-09-06T00:00:00.000' AS DateTime), CAST(N'2004-09-01T00:00:00.000' AS DateTime), N'Shipped', NULL, 172)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10287, CAST(N'2004-08-30T00:00:00.000' AS DateTime), CAST(N'2004-09-06T00:00:00.000' AS DateTime), CAST(N'2004-09-01T00:00:00.000' AS DateTime), N'Shipped', NULL, 298)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10288, CAST(N'2004-09-01T00:00:00.000' AS DateTime), CAST(N'2004-09-11T00:00:00.000' AS DateTime), CAST(N'2004-09-05T00:00:00.000' AS DateTime), N'Shipped', NULL, 166)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10289, CAST(N'2004-09-03T00:00:00.000' AS DateTime), CAST(N'2004-09-13T00:00:00.000' AS DateTime), CAST(N'2004-09-04T00:00:00.000' AS DateTime), N'Shipped', N'We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.', 167)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10290, CAST(N'2004-09-07T00:00:00.000' AS DateTime), CAST(N'2004-09-15T00:00:00.000' AS DateTime), CAST(N'2004-09-13T00:00:00.000' AS DateTime), N'Shipped', NULL, 198)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10291, CAST(N'2004-09-08T00:00:00.000' AS DateTime), CAST(N'2004-09-17T00:00:00.000' AS DateTime), CAST(N'2004-09-14T00:00:00.000' AS DateTime), N'Shipped', NULL, 448)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10292, CAST(N'2004-09-08T00:00:00.000' AS DateTime), CAST(N'2004-09-18T00:00:00.000' AS DateTime), CAST(N'2004-09-11T00:00:00.000' AS DateTime), N'Shipped', N'They want to reevaluate their terms agreement with Finance.', 131)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10293, CAST(N'2004-09-09T00:00:00.000' AS DateTime), CAST(N'2004-09-18T00:00:00.000' AS DateTime), CAST(N'2004-09-14T00:00:00.000' AS DateTime), N'Shipped', NULL, 249)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10294, CAST(N'2004-09-10T00:00:00.000' AS DateTime), CAST(N'2004-09-17T00:00:00.000' AS DateTime), CAST(N'2004-09-14T00:00:00.000' AS DateTime), N'Shipped', NULL, 204)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10295, CAST(N'2004-09-10T00:00:00.000' AS DateTime), CAST(N'2004-09-17T00:00:00.000' AS DateTime), CAST(N'2004-09-14T00:00:00.000' AS DateTime), N'Shipped', N'They want to reevaluate their terms agreement with Finance.', 362)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10296, CAST(N'2004-09-15T00:00:00.000' AS DateTime), CAST(N'2004-09-22T00:00:00.000' AS DateTime), CAST(N'2004-09-16T00:00:00.000' AS DateTime), N'Shipped', NULL, 415)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10297, CAST(N'2004-09-16T00:00:00.000' AS DateTime), CAST(N'2004-09-22T00:00:00.000' AS DateTime), CAST(N'2004-09-21T00:00:00.000' AS DateTime), N'Shipped', N'We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.', 189)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10298, CAST(N'2004-09-27T00:00:00.000' AS DateTime), CAST(N'2004-10-05T00:00:00.000' AS DateTime), CAST(N'2004-10-01T00:00:00.000' AS DateTime), N'Shipped', NULL, 103)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10299, CAST(N'2004-09-30T00:00:00.000' AS DateTime), CAST(N'2004-10-10T00:00:00.000' AS DateTime), CAST(N'2004-10-01T00:00:00.000' AS DateTime), N'Shipped', NULL, 186)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10300, CAST(N'2003-10-04T00:00:00.000' AS DateTime), CAST(N'2003-10-13T00:00:00.000' AS DateTime), CAST(N'2003-10-09T00:00:00.000' AS DateTime), N'Shipped', NULL, 128)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10301, CAST(N'2003-10-05T00:00:00.000' AS DateTime), CAST(N'2003-10-15T00:00:00.000' AS DateTime), CAST(N'2003-10-08T00:00:00.000' AS DateTime), N'Shipped', NULL, 299)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10302, CAST(N'2003-10-06T00:00:00.000' AS DateTime), CAST(N'2003-10-16T00:00:00.000' AS DateTime), CAST(N'2003-10-07T00:00:00.000' AS DateTime), N'Shipped', NULL, 201)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10303, CAST(N'2004-10-06T00:00:00.000' AS DateTime), CAST(N'2004-10-14T00:00:00.000' AS DateTime), CAST(N'2004-10-09T00:00:00.000' AS DateTime), N'Shipped', N'Customer inquired about remote controlled models and gold models.', 484)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10304, CAST(N'2004-10-11T00:00:00.000' AS DateTime), CAST(N'2004-10-20T00:00:00.000' AS DateTime), CAST(N'2004-10-17T00:00:00.000' AS DateTime), N'Shipped', NULL, 256)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10305, CAST(N'2004-10-13T00:00:00.000' AS DateTime), CAST(N'2004-10-22T00:00:00.000' AS DateTime), CAST(N'2004-10-15T00:00:00.000' AS DateTime), N'Shipped', N'Check on availability.', 286)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10306, CAST(N'2004-10-14T00:00:00.000' AS DateTime), CAST(N'2004-10-21T00:00:00.000' AS DateTime), CAST(N'2004-10-17T00:00:00.000' AS DateTime), N'Shipped', NULL, 187)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10307, CAST(N'2004-10-14T00:00:00.000' AS DateTime), CAST(N'2004-10-23T00:00:00.000' AS DateTime), CAST(N'2004-10-20T00:00:00.000' AS DateTime), N'Shipped', NULL, 339)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10308, CAST(N'2004-10-15T00:00:00.000' AS DateTime), CAST(N'2004-10-24T00:00:00.000' AS DateTime), CAST(N'2004-10-20T00:00:00.000' AS DateTime), N'Shipped', N'Customer requested that FedEx Ground is used for this shipping', 319)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10309, CAST(N'2004-10-15T00:00:00.000' AS DateTime), CAST(N'2004-10-24T00:00:00.000' AS DateTime), CAST(N'2004-10-18T00:00:00.000' AS DateTime), N'Shipped', NULL, 121)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10310, CAST(N'2004-10-16T00:00:00.000' AS DateTime), CAST(N'2004-10-24T00:00:00.000' AS DateTime), CAST(N'2004-10-18T00:00:00.000' AS DateTime), N'Shipped', NULL, 259)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10311, CAST(N'2004-10-16T00:00:00.000' AS DateTime), CAST(N'2004-10-23T00:00:00.000' AS DateTime), CAST(N'2004-10-20T00:00:00.000' AS DateTime), N'Shipped', N'Difficult to negotiate with customer. We need more marketing materials', 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10312, CAST(N'2004-10-21T00:00:00.000' AS DateTime), CAST(N'2004-10-27T00:00:00.000' AS DateTime), CAST(N'2004-10-23T00:00:00.000' AS DateTime), N'Shipped', NULL, 124)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10313, CAST(N'2004-10-22T00:00:00.000' AS DateTime), CAST(N'2004-10-28T00:00:00.000' AS DateTime), CAST(N'2004-10-25T00:00:00.000' AS DateTime), N'Shipped', N'Customer requested that FedEx Ground is used for this shipping', 202)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10314, CAST(N'2004-10-22T00:00:00.000' AS DateTime), CAST(N'2004-11-01T00:00:00.000' AS DateTime), CAST(N'2004-10-23T00:00:00.000' AS DateTime), N'Shipped', NULL, 227)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10315, CAST(N'2004-10-29T00:00:00.000' AS DateTime), CAST(N'2004-11-08T00:00:00.000' AS DateTime), CAST(N'2004-10-30T00:00:00.000' AS DateTime), N'Shipped', NULL, 119)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10316, CAST(N'2004-11-01T00:00:00.000' AS DateTime), CAST(N'2004-11-09T00:00:00.000' AS DateTime), CAST(N'2004-11-07T00:00:00.000' AS DateTime), N'Shipped', N'Customer requested that ad materials (such as posters, pamphlets) be included in the shippment', 240)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10317, CAST(N'2004-11-02T00:00:00.000' AS DateTime), CAST(N'2004-11-12T00:00:00.000' AS DateTime), CAST(N'2004-11-08T00:00:00.000' AS DateTime), N'Shipped', NULL, 161)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10318, CAST(N'2004-11-02T00:00:00.000' AS DateTime), CAST(N'2004-11-09T00:00:00.000' AS DateTime), CAST(N'2004-11-07T00:00:00.000' AS DateTime), N'Shipped', NULL, 157)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10319, CAST(N'2004-11-03T00:00:00.000' AS DateTime), CAST(N'2004-11-11T00:00:00.000' AS DateTime), CAST(N'2004-11-06T00:00:00.000' AS DateTime), N'Shipped', N'Customer requested that DHL is used for this shipping', 456)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10320, CAST(N'2004-11-03T00:00:00.000' AS DateTime), CAST(N'2004-11-13T00:00:00.000' AS DateTime), CAST(N'2004-11-07T00:00:00.000' AS DateTime), N'Shipped', NULL, 144)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10321, CAST(N'2004-11-04T00:00:00.000' AS DateTime), CAST(N'2004-11-12T00:00:00.000' AS DateTime), CAST(N'2004-11-07T00:00:00.000' AS DateTime), N'Shipped', NULL, 462)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10322, CAST(N'2004-11-04T00:00:00.000' AS DateTime), CAST(N'2004-11-12T00:00:00.000' AS DateTime), CAST(N'2004-11-10T00:00:00.000' AS DateTime), N'Shipped', N'Customer has worked with some of our vendors in the past and is aware of their MSRP', 363)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10323, CAST(N'2004-11-05T00:00:00.000' AS DateTime), CAST(N'2004-11-12T00:00:00.000' AS DateTime), CAST(N'2004-11-09T00:00:00.000' AS DateTime), N'Shipped', NULL, 128)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10324, CAST(N'2004-11-05T00:00:00.000' AS DateTime), CAST(N'2004-11-11T00:00:00.000' AS DateTime), CAST(N'2004-11-08T00:00:00.000' AS DateTime), N'Shipped', NULL, 181)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10325, CAST(N'2004-11-05T00:00:00.000' AS DateTime), CAST(N'2004-11-13T00:00:00.000' AS DateTime), CAST(N'2004-11-08T00:00:00.000' AS DateTime), N'Shipped', NULL, 121)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10326, CAST(N'2004-11-09T00:00:00.000' AS DateTime), CAST(N'2004-11-16T00:00:00.000' AS DateTime), CAST(N'2004-11-10T00:00:00.000' AS DateTime), N'Shipped', NULL, 144)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10327, CAST(N'2004-11-10T00:00:00.000' AS DateTime), CAST(N'2004-11-19T00:00:00.000' AS DateTime), CAST(N'2004-11-13T00:00:00.000' AS DateTime), N'Resolved', N'Order was disputed and resolved on 12/1/04. The Sales Manager was involved. Customer claims the scales of the models don''t match what was discussed.', 145)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10328, CAST(N'2004-11-12T00:00:00.000' AS DateTime), CAST(N'2004-11-21T00:00:00.000' AS DateTime), CAST(N'2004-11-18T00:00:00.000' AS DateTime), N'Shipped', N'Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch', 278)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10329, CAST(N'2004-11-15T00:00:00.000' AS DateTime), CAST(N'2004-11-24T00:00:00.000' AS DateTime), CAST(N'2004-11-16T00:00:00.000' AS DateTime), N'Shipped', NULL, 131)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10330, CAST(N'2004-11-16T00:00:00.000' AS DateTime), CAST(N'2004-11-25T00:00:00.000' AS DateTime), CAST(N'2004-11-21T00:00:00.000' AS DateTime), N'Shipped', NULL, 385)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10331, CAST(N'2004-11-17T00:00:00.000' AS DateTime), CAST(N'2004-11-23T00:00:00.000' AS DateTime), CAST(N'2004-11-23T00:00:00.000' AS DateTime), N'Shipped', N'Customer requested special shippment. The instructions were passed along to the warehouse', 486)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10332, CAST(N'2004-11-17T00:00:00.000' AS DateTime), CAST(N'2004-11-25T00:00:00.000' AS DateTime), CAST(N'2004-11-18T00:00:00.000' AS DateTime), N'Shipped', NULL, 187)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10333, CAST(N'2004-11-18T00:00:00.000' AS DateTime), CAST(N'2004-11-27T00:00:00.000' AS DateTime), CAST(N'2004-11-20T00:00:00.000' AS DateTime), N'Shipped', NULL, 129)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10334, CAST(N'2004-11-19T00:00:00.000' AS DateTime), CAST(N'2004-11-28T00:00:00.000' AS DateTime), NULL, N'On Hold', N'The outstaniding balance for this customer exceeds their credit limit. Order will be shipped when a payment is received.', 144)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10335, CAST(N'2004-11-19T00:00:00.000' AS DateTime), CAST(N'2004-11-29T00:00:00.000' AS DateTime), CAST(N'2004-11-23T00:00:00.000' AS DateTime), N'Shipped', NULL, 124)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10336, CAST(N'2004-11-20T00:00:00.000' AS DateTime), CAST(N'2004-11-26T00:00:00.000' AS DateTime), CAST(N'2004-11-24T00:00:00.000' AS DateTime), N'Shipped', N'Customer requested that DHL is used for this shipping', 172)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10337, CAST(N'2004-11-21T00:00:00.000' AS DateTime), CAST(N'2004-11-30T00:00:00.000' AS DateTime), CAST(N'2004-11-26T00:00:00.000' AS DateTime), N'Shipped', NULL, 424)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10338, CAST(N'2004-11-22T00:00:00.000' AS DateTime), CAST(N'2004-12-02T00:00:00.000' AS DateTime), CAST(N'2004-11-27T00:00:00.000' AS DateTime), N'Shipped', NULL, 381)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10339, CAST(N'2004-11-23T00:00:00.000' AS DateTime), CAST(N'2004-11-30T00:00:00.000' AS DateTime), CAST(N'2004-11-30T00:00:00.000' AS DateTime), N'Shipped', NULL, 398)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10340, CAST(N'2004-11-24T00:00:00.000' AS DateTime), CAST(N'2004-12-01T00:00:00.000' AS DateTime), CAST(N'2004-11-25T00:00:00.000' AS DateTime), N'Shipped', N'Customer is interested in buying more Ferrari models', 216)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10341, CAST(N'2004-11-24T00:00:00.000' AS DateTime), CAST(N'2004-12-01T00:00:00.000' AS DateTime), CAST(N'2004-11-29T00:00:00.000' AS DateTime), N'Shipped', NULL, 382)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10342, CAST(N'2004-11-24T00:00:00.000' AS DateTime), CAST(N'2004-12-01T00:00:00.000' AS DateTime), CAST(N'2004-11-29T00:00:00.000' AS DateTime), N'Shipped', NULL, 114)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10343, CAST(N'2004-11-24T00:00:00.000' AS DateTime), CAST(N'2004-12-01T00:00:00.000' AS DateTime), CAST(N'2004-11-26T00:00:00.000' AS DateTime), N'Shipped', NULL, 353)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10344, CAST(N'2004-11-25T00:00:00.000' AS DateTime), CAST(N'2004-12-02T00:00:00.000' AS DateTime), CAST(N'2004-11-29T00:00:00.000' AS DateTime), N'Shipped', NULL, 350)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10345, CAST(N'2004-11-25T00:00:00.000' AS DateTime), CAST(N'2004-12-01T00:00:00.000' AS DateTime), CAST(N'2004-11-26T00:00:00.000' AS DateTime), N'Shipped', NULL, 103)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10346, CAST(N'2004-11-29T00:00:00.000' AS DateTime), CAST(N'2004-12-05T00:00:00.000' AS DateTime), CAST(N'2004-11-30T00:00:00.000' AS DateTime), N'Shipped', NULL, 112)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10347, CAST(N'2004-11-29T00:00:00.000' AS DateTime), CAST(N'2004-12-07T00:00:00.000' AS DateTime), CAST(N'2004-11-30T00:00:00.000' AS DateTime), N'Shipped', N'Can we deliver the new Ford Mustang models by end-of-quarter?', 114)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10348, CAST(N'2004-11-01T00:00:00.000' AS DateTime), CAST(N'2004-11-08T00:00:00.000' AS DateTime), CAST(N'2004-11-05T00:00:00.000' AS DateTime), N'Shipped', NULL, 458)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10349, CAST(N'2004-12-01T00:00:00.000' AS DateTime), CAST(N'2004-12-07T00:00:00.000' AS DateTime), CAST(N'2004-12-03T00:00:00.000' AS DateTime), N'Shipped', NULL, 151)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10350, CAST(N'2004-12-02T00:00:00.000' AS DateTime), CAST(N'2004-12-08T00:00:00.000' AS DateTime), CAST(N'2004-12-05T00:00:00.000' AS DateTime), N'Shipped', NULL, 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10351, CAST(N'2004-12-03T00:00:00.000' AS DateTime), CAST(N'2004-12-11T00:00:00.000' AS DateTime), CAST(N'2004-12-07T00:00:00.000' AS DateTime), N'Shipped', NULL, 324)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10352, CAST(N'2004-12-03T00:00:00.000' AS DateTime), CAST(N'2004-12-12T00:00:00.000' AS DateTime), CAST(N'2004-12-09T00:00:00.000' AS DateTime), N'Shipped', NULL, 198)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10353, CAST(N'2004-12-04T00:00:00.000' AS DateTime), CAST(N'2004-12-11T00:00:00.000' AS DateTime), CAST(N'2004-12-05T00:00:00.000' AS DateTime), N'Shipped', NULL, 447)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10354, CAST(N'2004-12-04T00:00:00.000' AS DateTime), CAST(N'2004-12-10T00:00:00.000' AS DateTime), CAST(N'2004-12-05T00:00:00.000' AS DateTime), N'Shipped', NULL, 323)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10355, CAST(N'2004-12-07T00:00:00.000' AS DateTime), CAST(N'2004-12-14T00:00:00.000' AS DateTime), CAST(N'2004-12-13T00:00:00.000' AS DateTime), N'Shipped', NULL, 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10356, CAST(N'2004-12-09T00:00:00.000' AS DateTime), CAST(N'2004-12-15T00:00:00.000' AS DateTime), CAST(N'2004-12-12T00:00:00.000' AS DateTime), N'Shipped', NULL, 250)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10357, CAST(N'2004-12-10T00:00:00.000' AS DateTime), CAST(N'2004-12-16T00:00:00.000' AS DateTime), CAST(N'2004-12-14T00:00:00.000' AS DateTime), N'Shipped', NULL, 124)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10358, CAST(N'2004-12-10T00:00:00.000' AS DateTime), CAST(N'2004-12-16T00:00:00.000' AS DateTime), CAST(N'2004-12-16T00:00:00.000' AS DateTime), N'Shipped', N'Customer requested that DHL is used for this shipping', 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10359, CAST(N'2004-12-15T00:00:00.000' AS DateTime), CAST(N'2004-12-23T00:00:00.000' AS DateTime), CAST(N'2004-12-18T00:00:00.000' AS DateTime), N'Shipped', NULL, 353)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10360, CAST(N'2004-12-16T00:00:00.000' AS DateTime), CAST(N'2004-12-22T00:00:00.000' AS DateTime), CAST(N'2004-12-18T00:00:00.000' AS DateTime), N'Shipped', NULL, 496)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10361, CAST(N'2004-12-17T00:00:00.000' AS DateTime), CAST(N'2004-12-24T00:00:00.000' AS DateTime), CAST(N'2004-12-20T00:00:00.000' AS DateTime), N'Shipped', NULL, 282)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10362, CAST(N'2005-01-05T00:00:00.000' AS DateTime), CAST(N'2005-01-16T00:00:00.000' AS DateTime), CAST(N'2005-01-10T00:00:00.000' AS DateTime), N'Shipped', NULL, 161)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10363, CAST(N'2005-01-06T00:00:00.000' AS DateTime), CAST(N'2005-01-12T00:00:00.000' AS DateTime), CAST(N'2005-01-10T00:00:00.000' AS DateTime), N'Shipped', NULL, 334)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10364, CAST(N'2005-01-06T00:00:00.000' AS DateTime), CAST(N'2005-01-17T00:00:00.000' AS DateTime), CAST(N'2005-01-09T00:00:00.000' AS DateTime), N'Shipped', NULL, 350)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10365, CAST(N'2005-01-07T00:00:00.000' AS DateTime), CAST(N'2005-01-18T00:00:00.000' AS DateTime), CAST(N'2005-01-11T00:00:00.000' AS DateTime), N'Shipped', NULL, 320)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10366, CAST(N'2005-01-10T00:00:00.000' AS DateTime), CAST(N'2005-01-19T00:00:00.000' AS DateTime), CAST(N'2005-01-12T00:00:00.000' AS DateTime), N'Shipped', NULL, 381)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10367, CAST(N'2005-01-12T00:00:00.000' AS DateTime), CAST(N'2005-01-21T00:00:00.000' AS DateTime), CAST(N'2005-01-16T00:00:00.000' AS DateTime), N'Resolved', N'This order was disputed and resolved on 2/1/2005. Customer claimed that container with shipment was damaged. FedEx''s investigation proved this wrong.', 205)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10368, CAST(N'2005-01-19T00:00:00.000' AS DateTime), CAST(N'2005-01-27T00:00:00.000' AS DateTime), CAST(N'2005-01-24T00:00:00.000' AS DateTime), N'Shipped', N'Can we renegotiate this one?', 124)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10369, CAST(N'2005-01-20T00:00:00.000' AS DateTime), CAST(N'2005-01-28T00:00:00.000' AS DateTime), CAST(N'2005-01-24T00:00:00.000' AS DateTime), N'Shipped', NULL, 379)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10370, CAST(N'2005-01-20T00:00:00.000' AS DateTime), CAST(N'2005-02-01T00:00:00.000' AS DateTime), CAST(N'2005-01-25T00:00:00.000' AS DateTime), N'Shipped', NULL, 276)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10371, CAST(N'2005-01-23T00:00:00.000' AS DateTime), CAST(N'2005-02-03T00:00:00.000' AS DateTime), CAST(N'2005-01-25T00:00:00.000' AS DateTime), N'Shipped', NULL, 124)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10372, CAST(N'2005-01-26T00:00:00.000' AS DateTime), CAST(N'2005-02-05T00:00:00.000' AS DateTime), CAST(N'2005-01-28T00:00:00.000' AS DateTime), N'Shipped', NULL, 398)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10373, CAST(N'2005-01-31T00:00:00.000' AS DateTime), CAST(N'2005-02-08T00:00:00.000' AS DateTime), CAST(N'2005-02-06T00:00:00.000' AS DateTime), N'Shipped', NULL, 311)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10374, CAST(N'2005-02-02T00:00:00.000' AS DateTime), CAST(N'2005-02-09T00:00:00.000' AS DateTime), CAST(N'2005-02-03T00:00:00.000' AS DateTime), N'Shipped', NULL, 333)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10375, CAST(N'2005-02-03T00:00:00.000' AS DateTime), CAST(N'2005-02-10T00:00:00.000' AS DateTime), CAST(N'2005-02-06T00:00:00.000' AS DateTime), N'Shipped', NULL, 119)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10376, CAST(N'2005-02-08T00:00:00.000' AS DateTime), CAST(N'2005-02-18T00:00:00.000' AS DateTime), CAST(N'2005-02-13T00:00:00.000' AS DateTime), N'Shipped', NULL, 219)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10377, CAST(N'2005-02-09T00:00:00.000' AS DateTime), CAST(N'2005-02-21T00:00:00.000' AS DateTime), CAST(N'2005-02-12T00:00:00.000' AS DateTime), N'Shipped', N'Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches', 186)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10378, CAST(N'2005-02-10T00:00:00.000' AS DateTime), CAST(N'2005-02-18T00:00:00.000' AS DateTime), CAST(N'2005-02-11T00:00:00.000' AS DateTime), N'Shipped', NULL, 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10379, CAST(N'2005-02-10T00:00:00.000' AS DateTime), CAST(N'2005-02-18T00:00:00.000' AS DateTime), CAST(N'2005-02-11T00:00:00.000' AS DateTime), N'Shipped', NULL, 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10380, CAST(N'2005-02-16T00:00:00.000' AS DateTime), CAST(N'2005-02-24T00:00:00.000' AS DateTime), CAST(N'2005-02-18T00:00:00.000' AS DateTime), N'Shipped', NULL, 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10381, CAST(N'2005-02-17T00:00:00.000' AS DateTime), CAST(N'2005-02-25T00:00:00.000' AS DateTime), CAST(N'2005-02-18T00:00:00.000' AS DateTime), N'Shipped', NULL, 321)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10382, CAST(N'2005-02-17T00:00:00.000' AS DateTime), CAST(N'2005-02-23T00:00:00.000' AS DateTime), CAST(N'2005-02-18T00:00:00.000' AS DateTime), N'Shipped', N'Custom shipping instructions sent to warehouse', 124)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10383, CAST(N'2005-02-22T00:00:00.000' AS DateTime), CAST(N'2005-03-02T00:00:00.000' AS DateTime), CAST(N'2005-02-25T00:00:00.000' AS DateTime), N'Shipped', NULL, 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10384, CAST(N'2005-02-23T00:00:00.000' AS DateTime), CAST(N'2005-03-06T00:00:00.000' AS DateTime), CAST(N'2005-02-27T00:00:00.000' AS DateTime), N'Shipped', NULL, 321)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10385, CAST(N'2005-02-28T00:00:00.000' AS DateTime), CAST(N'2005-03-09T00:00:00.000' AS DateTime), CAST(N'2005-03-01T00:00:00.000' AS DateTime), N'Shipped', NULL, 124)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10386, CAST(N'2005-03-01T00:00:00.000' AS DateTime), CAST(N'2005-03-09T00:00:00.000' AS DateTime), CAST(N'2005-03-06T00:00:00.000' AS DateTime), N'Resolved', N'Disputed then Resolved on 3/15/2005. Customer doesn''t like the craftsmaship of the models.', 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10387, CAST(N'2005-03-02T00:00:00.000' AS DateTime), CAST(N'2005-03-09T00:00:00.000' AS DateTime), CAST(N'2005-03-06T00:00:00.000' AS DateTime), N'Shipped', N'We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.', 148)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10388, CAST(N'2005-03-03T00:00:00.000' AS DateTime), CAST(N'2005-03-11T00:00:00.000' AS DateTime), CAST(N'2005-03-09T00:00:00.000' AS DateTime), N'Shipped', NULL, 462)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10389, CAST(N'2005-03-03T00:00:00.000' AS DateTime), CAST(N'2005-03-09T00:00:00.000' AS DateTime), CAST(N'2005-03-08T00:00:00.000' AS DateTime), N'Shipped', NULL, 448)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10390, CAST(N'2005-03-04T00:00:00.000' AS DateTime), CAST(N'2005-03-11T00:00:00.000' AS DateTime), CAST(N'2005-03-07T00:00:00.000' AS DateTime), N'Shipped', N'They want to reevaluate their terms agreement with Finance.', 124)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10391, CAST(N'2005-03-09T00:00:00.000' AS DateTime), CAST(N'2005-03-20T00:00:00.000' AS DateTime), CAST(N'2005-03-15T00:00:00.000' AS DateTime), N'Shipped', NULL, 276)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10392, CAST(N'2005-03-10T00:00:00.000' AS DateTime), CAST(N'2005-03-18T00:00:00.000' AS DateTime), CAST(N'2005-03-12T00:00:00.000' AS DateTime), N'Shipped', NULL, 452)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10393, CAST(N'2005-03-11T00:00:00.000' AS DateTime), CAST(N'2005-03-22T00:00:00.000' AS DateTime), CAST(N'2005-03-14T00:00:00.000' AS DateTime), N'Shipped', N'They want to reevaluate their terms agreement with Finance.', 323)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10394, CAST(N'2005-03-15T00:00:00.000' AS DateTime), CAST(N'2005-03-25T00:00:00.000' AS DateTime), CAST(N'2005-03-19T00:00:00.000' AS DateTime), N'Shipped', NULL, 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10395, CAST(N'2005-03-17T00:00:00.000' AS DateTime), CAST(N'2005-03-24T00:00:00.000' AS DateTime), CAST(N'2005-03-23T00:00:00.000' AS DateTime), N'Shipped', N'We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.', 250)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10396, CAST(N'2005-03-23T00:00:00.000' AS DateTime), CAST(N'2005-04-02T00:00:00.000' AS DateTime), CAST(N'2005-03-28T00:00:00.000' AS DateTime), N'Shipped', NULL, 124)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10397, CAST(N'2005-03-28T00:00:00.000' AS DateTime), CAST(N'2005-04-09T00:00:00.000' AS DateTime), CAST(N'2005-04-01T00:00:00.000' AS DateTime), N'Shipped', NULL, 242)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10398, CAST(N'2005-03-30T00:00:00.000' AS DateTime), CAST(N'2005-04-09T00:00:00.000' AS DateTime), CAST(N'2005-03-31T00:00:00.000' AS DateTime), N'Shipped', NULL, 353)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10399, CAST(N'2005-04-01T00:00:00.000' AS DateTime), CAST(N'2005-04-12T00:00:00.000' AS DateTime), CAST(N'2005-04-03T00:00:00.000' AS DateTime), N'Shipped', NULL, 496)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10400, CAST(N'2005-04-01T00:00:00.000' AS DateTime), CAST(N'2005-04-11T00:00:00.000' AS DateTime), CAST(N'2005-04-04T00:00:00.000' AS DateTime), N'Shipped', N'Customer requested that DHL is used for this shipping', 450)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10401, CAST(N'2005-04-03T00:00:00.000' AS DateTime), CAST(N'2005-04-14T00:00:00.000' AS DateTime), NULL, N'On Hold', N'Customer credit limit exceeded. Will ship when a payment is received.', 328)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10402, CAST(N'2005-04-07T00:00:00.000' AS DateTime), CAST(N'2005-04-14T00:00:00.000' AS DateTime), CAST(N'2005-04-12T00:00:00.000' AS DateTime), N'Shipped', NULL, 406)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10403, CAST(N'2005-04-08T00:00:00.000' AS DateTime), CAST(N'2005-04-18T00:00:00.000' AS DateTime), CAST(N'2005-04-11T00:00:00.000' AS DateTime), N'Shipped', NULL, 201)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10404, CAST(N'2005-04-08T00:00:00.000' AS DateTime), CAST(N'2005-04-14T00:00:00.000' AS DateTime), CAST(N'2005-04-11T00:00:00.000' AS DateTime), N'Shipped', NULL, 323)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10405, CAST(N'2005-04-14T00:00:00.000' AS DateTime), CAST(N'2005-04-24T00:00:00.000' AS DateTime), CAST(N'2005-04-20T00:00:00.000' AS DateTime), N'Shipped', NULL, 209)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10406, CAST(N'2005-04-15T00:00:00.000' AS DateTime), CAST(N'2005-04-25T00:00:00.000' AS DateTime), CAST(N'2005-04-21T00:00:00.000' AS DateTime), N'Disputed', N'Customer claims container with shipment was damaged during shipping and some items were missing. I am talking to FedEx about this.', 145)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10407, CAST(N'2005-04-22T00:00:00.000' AS DateTime), CAST(N'2005-05-04T00:00:00.000' AS DateTime), NULL, N'On Hold', N'Customer credit limit exceeded. Will ship when a payment is received.', 450)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10408, CAST(N'2005-04-22T00:00:00.000' AS DateTime), CAST(N'2005-04-29T00:00:00.000' AS DateTime), CAST(N'2005-04-27T00:00:00.000' AS DateTime), N'Shipped', NULL, 398)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10409, CAST(N'2005-04-23T00:00:00.000' AS DateTime), CAST(N'2005-05-05T00:00:00.000' AS DateTime), CAST(N'2005-04-24T00:00:00.000' AS DateTime), N'Shipped', NULL, 166)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10410, CAST(N'2005-04-29T00:00:00.000' AS DateTime), CAST(N'2005-05-10T00:00:00.000' AS DateTime), CAST(N'2005-04-30T00:00:00.000' AS DateTime), N'Shipped', NULL, 357)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10411, CAST(N'2005-05-01T00:00:00.000' AS DateTime), CAST(N'2005-05-08T00:00:00.000' AS DateTime), CAST(N'2005-05-06T00:00:00.000' AS DateTime), N'Shipped', NULL, 233)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10412, CAST(N'2005-05-03T00:00:00.000' AS DateTime), CAST(N'2005-05-13T00:00:00.000' AS DateTime), CAST(N'2005-05-05T00:00:00.000' AS DateTime), N'Shipped', NULL, 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10413, CAST(N'2005-05-05T00:00:00.000' AS DateTime), CAST(N'2005-05-14T00:00:00.000' AS DateTime), CAST(N'2005-05-09T00:00:00.000' AS DateTime), N'Shipped', N'Customer requested that DHL is used for this shipping', 175)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10414, CAST(N'2005-05-06T00:00:00.000' AS DateTime), CAST(N'2005-05-13T00:00:00.000' AS DateTime), NULL, N'On Hold', N'Customer credit limit exceeded. Will ship when a payment is received.', 362)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10415, CAST(N'2005-05-09T00:00:00.000' AS DateTime), CAST(N'2005-05-20T00:00:00.000' AS DateTime), CAST(N'2005-05-12T00:00:00.000' AS DateTime), N'Disputed', N'Customer claims the scales of the models don''t match what was discussed. I keep all the paperwork though to prove otherwise', 471)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10416, CAST(N'2005-05-10T00:00:00.000' AS DateTime), CAST(N'2005-05-16T00:00:00.000' AS DateTime), CAST(N'2005-05-14T00:00:00.000' AS DateTime), N'Shipped', NULL, 386)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10417, CAST(N'2005-05-13T00:00:00.000' AS DateTime), CAST(N'2005-05-19T00:00:00.000' AS DateTime), CAST(N'2005-05-19T00:00:00.000' AS DateTime), N'Disputed', N'Customer doesn''t like the colors and precision of the models.', 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10418, CAST(N'2005-05-16T00:00:00.000' AS DateTime), CAST(N'2005-05-24T00:00:00.000' AS DateTime), CAST(N'2005-05-20T00:00:00.000' AS DateTime), N'Shipped', NULL, 412)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10419, CAST(N'2005-05-17T00:00:00.000' AS DateTime), CAST(N'2005-05-28T00:00:00.000' AS DateTime), CAST(N'2005-05-19T00:00:00.000' AS DateTime), N'Shipped', NULL, 382)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10420, CAST(N'2005-05-29T00:00:00.000' AS DateTime), CAST(N'2005-06-07T00:00:00.000' AS DateTime), NULL, N'In Process', NULL, 282)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10421, CAST(N'2005-05-29T00:00:00.000' AS DateTime), CAST(N'2005-06-06T00:00:00.000' AS DateTime), NULL, N'In Process', N'Custom shipping instructions were sent to warehouse', 124)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10422, CAST(N'2005-05-30T00:00:00.000' AS DateTime), CAST(N'2005-06-11T00:00:00.000' AS DateTime), NULL, N'In Process', NULL, 157)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10423, CAST(N'2005-05-30T00:00:00.000' AS DateTime), CAST(N'2005-06-05T00:00:00.000' AS DateTime), NULL, N'In Process', NULL, 314)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10424, CAST(N'2005-05-31T00:00:00.000' AS DateTime), CAST(N'2005-06-08T00:00:00.000' AS DateTime), NULL, N'In Process', NULL, 141)
GO
INSERT [dbo].[orders] ([orderNumber], [orderDate], [requiredDate], [shippedDate], [status], [comments], [customerNumber]) VALUES (10425, CAST(N'2005-05-31T00:00:00.000' AS DateTime), CAST(N'2005-06-07T00:00:00.000' AS DateTime), NULL, N'In Process', NULL, 119)
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (103, N'HQ336336', CAST(N'2004-10-19T00:00:00.000' AS DateTime), CAST(5307.98 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (103, N'JM555205', CAST(N'2003-06-05T00:00:00.000' AS DateTime), CAST(16560.30 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (103, N'OM314933', CAST(N'2004-12-18T00:00:00.000' AS DateTime), CAST(2311.68 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (112, N'BO864823', CAST(N'2004-12-17T00:00:00.000' AS DateTime), CAST(14449.61 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (112, N'HQ55022', CAST(N'2003-06-06T00:00:00.000' AS DateTime), CAST(33847.62 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (112, N'ND748579', CAST(N'2004-08-20T00:00:00.000' AS DateTime), CAST(34453.85 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (114, N'GG31455', CAST(N'2003-05-20T00:00:00.000' AS DateTime), CAST(50397.66 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (114, N'MA765515', CAST(N'2004-12-15T00:00:00.000' AS DateTime), CAST(85591.32 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (114, N'NP603840', CAST(N'2003-05-31T00:00:00.000' AS DateTime), CAST(9738.18 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (114, N'NR27552', CAST(N'2004-03-10T00:00:00.000' AS DateTime), CAST(49637.57 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (119, N'DB933704', CAST(N'2004-11-14T00:00:00.000' AS DateTime), CAST(20719.91 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (119, N'LN373447', CAST(N'2004-08-08T00:00:00.000' AS DateTime), CAST(56002.90 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (119, N'NG94694', CAST(N'2005-02-22T00:00:00.000' AS DateTime), CAST(59617.44 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (121, N'DB889831', CAST(N'2003-02-16T00:00:00.000' AS DateTime), CAST(54702.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (121, N'FD317790', CAST(N'2003-10-28T00:00:00.000' AS DateTime), CAST(1474.66 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (121, N'KI831359', CAST(N'2004-11-04T00:00:00.000' AS DateTime), CAST(19769.68 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (121, N'MA302151', CAST(N'2004-11-28T00:00:00.000' AS DateTime), CAST(40652.85 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (124, N'AE215433', CAST(N'2005-02-18T00:00:00.000' AS DateTime), CAST(51826.36 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (124, N'AQ50522', CAST(N'2005-06-03T00:00:00.000' AS DateTime), CAST(32194.79 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (124, N'BG255406', CAST(N'2004-08-28T00:00:00.000' AS DateTime), CAST(93928.73 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (124, N'CQ287967', CAST(N'2003-04-11T00:00:00.000' AS DateTime), CAST(12398.56 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (124, N'ET64396', CAST(N'2005-04-16T00:00:00.000' AS DateTime), CAST(121972.78 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (124, N'HI366474', CAST(N'2004-12-27T00:00:00.000' AS DateTime), CAST(50547.68 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (124, N'HR86578', CAST(N'2004-11-02T00:00:00.000' AS DateTime), CAST(63075.06 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (124, N'KI131716', CAST(N'2003-08-15T00:00:00.000' AS DateTime), CAST(122368.67 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (124, N'LF217299', CAST(N'2004-03-26T00:00:00.000' AS DateTime), CAST(48922.77 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (124, N'NT141748', CAST(N'2003-11-25T00:00:00.000' AS DateTime), CAST(50360.89 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (128, N'DI925118', CAST(N'2003-01-28T00:00:00.000' AS DateTime), CAST(11432.34 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (128, N'FA465482', CAST(N'2003-10-18T00:00:00.000' AS DateTime), CAST(27257.79 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (128, N'FH668230', CAST(N'2004-03-24T00:00:00.000' AS DateTime), CAST(37266.49 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (128, N'IP383901', CAST(N'2004-11-18T00:00:00.000' AS DateTime), CAST(9214.97 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (129, N'DM826140', CAST(N'2004-12-08T00:00:00.000' AS DateTime), CAST(30348.72 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (129, N'ID449593', CAST(N'2003-12-11T00:00:00.000' AS DateTime), CAST(25431.88 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (129, N'PI42991', CAST(N'2003-04-09T00:00:00.000' AS DateTime), CAST(18695.58 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (131, N'CL442705', CAST(N'2003-03-12T00:00:00.000' AS DateTime), CAST(25783.76 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (131, N'KG113538', CAST(N'2004-05-22T00:00:00.000' AS DateTime), CAST(45357.66 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (131, N'MA724562', CAST(N'2004-12-02T00:00:00.000' AS DateTime), CAST(53152.28 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (131, N'NB445135', CAST(N'2004-09-11T00:00:00.000' AS DateTime), CAST(39775.74 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (141, N'AU364101', CAST(N'2003-07-19T00:00:00.000' AS DateTime), CAST(39615.82 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (141, N'DB583216', CAST(N'2004-11-01T00:00:00.000' AS DateTime), CAST(34872.13 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (141, N'DL460618', CAST(N'2005-05-19T00:00:00.000' AS DateTime), CAST(22353.86 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (141, N'HJ32686', CAST(N'2004-01-30T00:00:00.000' AS DateTime), CAST(65165.17 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (141, N'ID10962', CAST(N'2004-12-31T00:00:00.000' AS DateTime), CAST(133588.75 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (141, N'IN446258', CAST(N'2005-03-25T00:00:00.000' AS DateTime), CAST(95065.46 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (141, N'JE105477', CAST(N'2005-03-18T00:00:00.000' AS DateTime), CAST(90135.87 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (141, N'JN355280', CAST(N'2003-10-26T00:00:00.000' AS DateTime), CAST(53502.30 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (141, N'JN722010', CAST(N'2003-02-25T00:00:00.000' AS DateTime), CAST(44621.96 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (141, N'KT52578', CAST(N'2003-12-09T00:00:00.000' AS DateTime), CAST(72487.50 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (141, N'MC46946', CAST(N'2004-07-09T00:00:00.000' AS DateTime), CAST(91328.40 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (141, N'MF629602', CAST(N'2004-08-16T00:00:00.000' AS DateTime), CAST(21986.27 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (141, N'NU627706', CAST(N'2004-05-17T00:00:00.000' AS DateTime), CAST(28327.64 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (144, N'IR846303', CAST(N'2004-12-12T00:00:00.000' AS DateTime), CAST(66005.88 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (144, N'LA685678', CAST(N'2003-04-09T00:00:00.000' AS DateTime), CAST(9749.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (145, N'CN328545', CAST(N'2004-07-03T00:00:00.000' AS DateTime), CAST(4749.45 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (145, N'ED39322', CAST(N'2004-04-26T00:00:00.000' AS DateTime), CAST(31329.56 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (145, N'HR182688', CAST(N'2004-12-01T00:00:00.000' AS DateTime), CAST(24078.61 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (145, N'JJ246391', CAST(N'2003-02-20T00:00:00.000' AS DateTime), CAST(58871.11 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (146, N'FP549817', CAST(N'2004-03-18T00:00:00.000' AS DateTime), CAST(46802.27 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (146, N'FU793410', CAST(N'2004-01-16T00:00:00.000' AS DateTime), CAST(54536.87 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (146, N'LJ160635', CAST(N'2003-12-10T00:00:00.000' AS DateTime), CAST(41535.11 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (148, N'BI507030', CAST(N'2003-04-22T00:00:00.000' AS DateTime), CAST(43657.47 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (148, N'DD635282', CAST(N'2004-08-11T00:00:00.000' AS DateTime), CAST(3127.88 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (148, N'KM172879', CAST(N'2003-12-26T00:00:00.000' AS DateTime), CAST(122028.73 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (148, N'ME497970', CAST(N'2005-03-27T00:00:00.000' AS DateTime), CAST(4175.60 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (151, N'BF686658', CAST(N'2003-12-22T00:00:00.000' AS DateTime), CAST(64316.09 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (151, N'GB852215', CAST(N'2004-07-26T00:00:00.000' AS DateTime), CAST(23252.18 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (151, N'IP568906', CAST(N'2003-06-18T00:00:00.000' AS DateTime), CAST(68462.15 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (151, N'KI884577', CAST(N'2004-12-14T00:00:00.000' AS DateTime), CAST(41706.52 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (157, N'HI618861', CAST(N'2004-11-19T00:00:00.000' AS DateTime), CAST(44040.73 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (157, N'NN711988', CAST(N'2004-09-07T00:00:00.000' AS DateTime), CAST(71930.61 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (161, N'BR352384', CAST(N'2004-11-14T00:00:00.000' AS DateTime), CAST(2916.20 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (161, N'BR478494', CAST(N'2003-11-18T00:00:00.000' AS DateTime), CAST(62305.47 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (161, N'KG644125', CAST(N'2005-02-02T00:00:00.000' AS DateTime), CAST(13529.57 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (161, N'NI908214', CAST(N'2003-08-05T00:00:00.000' AS DateTime), CAST(42031.83 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (166, N'BQ327613', CAST(N'2004-09-16T00:00:00.000' AS DateTime), CAST(42902.84 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (166, N'DC979307', CAST(N'2004-07-07T00:00:00.000' AS DateTime), CAST(45788.72 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (166, N'LA318629', CAST(N'2004-02-28T00:00:00.000' AS DateTime), CAST(24219.59 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (167, N'ED743615', CAST(N'2004-09-19T00:00:00.000' AS DateTime), CAST(16363.10 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (167, N'GN228846', CAST(N'2003-12-03T00:00:00.000' AS DateTime), CAST(95277.18 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (171, N'GB878038', CAST(N'2004-03-15T00:00:00.000' AS DateTime), CAST(20178.13 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (171, N'IL104425', CAST(N'2003-11-22T00:00:00.000' AS DateTime), CAST(48874.28 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (172, N'AD832091', CAST(N'2004-09-09T00:00:00.000' AS DateTime), CAST(2173.60 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (172, N'CE51751', CAST(N'2004-12-04T00:00:00.000' AS DateTime), CAST(56812.67 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (172, N'EH208589', CAST(N'2003-04-20T00:00:00.000' AS DateTime), CAST(38217.41 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (173, N'GP545698', CAST(N'2004-05-13T00:00:00.000' AS DateTime), CAST(14380.92 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (173, N'IG462397', CAST(N'2004-03-29T00:00:00.000' AS DateTime), CAST(21782.70 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (175, N'IO448913', CAST(N'2003-11-19T00:00:00.000' AS DateTime), CAST(26115.80 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (175, N'PI15215', CAST(N'2004-07-10T00:00:00.000' AS DateTime), CAST(44130.52 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (177, N'AU750837', CAST(N'2004-04-17T00:00:00.000' AS DateTime), CAST(17114.43 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (177, N'CI381435', CAST(N'2004-01-19T00:00:00.000' AS DateTime), CAST(50490.64 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (181, N'CM564612', CAST(N'2004-04-25T00:00:00.000' AS DateTime), CAST(24804.34 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (181, N'GQ132144', CAST(N'2003-01-30T00:00:00.000' AS DateTime), CAST(6864.05 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (181, N'OH367219', CAST(N'2004-11-16T00:00:00.000' AS DateTime), CAST(56372.87 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (186, N'AE192287', CAST(N'2005-03-10T00:00:00.000' AS DateTime), CAST(26422.82 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (186, N'AK412714', CAST(N'2003-10-27T00:00:00.000' AS DateTime), CAST(42083.50 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (186, N'KA602407', CAST(N'2004-10-21T00:00:00.000' AS DateTime), CAST(42744.06 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (187, N'AM968797', CAST(N'2004-11-03T00:00:00.000' AS DateTime), CAST(57827.61 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (187, N'BQ39062', CAST(N'2004-12-08T00:00:00.000' AS DateTime), CAST(48962.28 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (187, N'KL124726', CAST(N'2003-03-27T00:00:00.000' AS DateTime), CAST(51017.92 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (189, N'BO711618', CAST(N'2004-10-03T00:00:00.000' AS DateTime), CAST(18971.96 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (189, N'NM916675', CAST(N'2004-03-01T00:00:00.000' AS DateTime), CAST(38784.47 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (198, N'FI192930', CAST(N'2004-12-06T00:00:00.000' AS DateTime), CAST(11528.53 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (198, N'HQ920205', CAST(N'2003-07-06T00:00:00.000' AS DateTime), CAST(7277.35 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (198, N'IS946883', CAST(N'2004-09-21T00:00:00.000' AS DateTime), CAST(7673.38 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (201, N'DP677013', CAST(N'2003-10-20T00:00:00.000' AS DateTime), CAST(26797.21 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (201, N'OO846801', CAST(N'2004-06-15T00:00:00.000' AS DateTime), CAST(50408.25 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (202, N'HI358554', CAST(N'2003-12-18T00:00:00.000' AS DateTime), CAST(38662.21 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (202, N'IQ627690', CAST(N'2004-11-08T00:00:00.000' AS DateTime), CAST(36576.71 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (204, N'GC697638', CAST(N'2004-08-13T00:00:00.000' AS DateTime), CAST(52505.36 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (204, N'IS150005', CAST(N'2004-09-24T00:00:00.000' AS DateTime), CAST(4692.60 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (205, N'GL756480', CAST(N'2003-12-04T00:00:00.000' AS DateTime), CAST(4512.48 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (205, N'LL562733', CAST(N'2003-09-05T00:00:00.000' AS DateTime), CAST(55776.12 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (205, N'NM739638', CAST(N'2005-02-06T00:00:00.000' AS DateTime), CAST(44273.36 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (209, N'ED520529', CAST(N'2004-06-21T00:00:00.000' AS DateTime), CAST(5416.90 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (209, N'PH785937', CAST(N'2004-05-04T00:00:00.000' AS DateTime), CAST(39341.23 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (211, N'BJ535230', CAST(N'2003-12-09T00:00:00.000' AS DateTime), CAST(48784.36 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (216, N'BG407567', CAST(N'2003-05-09T00:00:00.000' AS DateTime), CAST(4219.20 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (216, N'ML780814', CAST(N'2004-12-06T00:00:00.000' AS DateTime), CAST(21249.77 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (216, N'MM342086', CAST(N'2003-12-14T00:00:00.000' AS DateTime), CAST(44009.31 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (219, N'BN17870', CAST(N'2005-03-02T00:00:00.000' AS DateTime), CAST(3987.20 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (219, N'BR941480', CAST(N'2003-10-18T00:00:00.000' AS DateTime), CAST(5142.15 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (227, N'MQ413968', CAST(N'2003-10-31T00:00:00.000' AS DateTime), CAST(40321.61 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (227, N'NU21326', CAST(N'2004-11-02T00:00:00.000' AS DateTime), CAST(60273.94 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (233, N'II180006', CAST(N'2004-07-01T00:00:00.000' AS DateTime), CAST(24564.53 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (233, N'JG981190', CAST(N'2003-11-18T00:00:00.000' AS DateTime), CAST(15947.29 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (239, N'NQ865547', CAST(N'2004-03-15T00:00:00.000' AS DateTime), CAST(87489.23 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (240, N'IF245157', CAST(N'2004-11-16T00:00:00.000' AS DateTime), CAST(51334.16 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (240, N'JO719695', CAST(N'2004-03-28T00:00:00.000' AS DateTime), CAST(26906.68 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (242, N'AF40894', CAST(N'2003-11-22T00:00:00.000' AS DateTime), CAST(38098.24 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (242, N'HR224331', CAST(N'2005-06-03T00:00:00.000' AS DateTime), CAST(15139.12 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (242, N'KI744716', CAST(N'2003-07-21T00:00:00.000' AS DateTime), CAST(17251.08 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (249, N'IJ399820', CAST(N'2004-09-19T00:00:00.000' AS DateTime), CAST(38039.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (249, N'NE404084', CAST(N'2004-09-04T00:00:00.000' AS DateTime), CAST(56078.26 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (250, N'EQ12267', CAST(N'2005-05-17T00:00:00.000' AS DateTime), CAST(20321.53 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (250, N'HD284647', CAST(N'2004-12-30T00:00:00.000' AS DateTime), CAST(32623.93 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (250, N'HN114306', CAST(N'2003-07-18T00:00:00.000' AS DateTime), CAST(25624.88 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (256, N'EP227123', CAST(N'2004-02-10T00:00:00.000' AS DateTime), CAST(5759.42 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (256, N'HE84936', CAST(N'2004-10-22T00:00:00.000' AS DateTime), CAST(59074.88 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (259, N'EU280955', CAST(N'2004-11-06T00:00:00.000' AS DateTime), CAST(68943.40 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (259, N'GB361972', CAST(N'2003-12-07T00:00:00.000' AS DateTime), CAST(31363.18 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (260, N'IO164641', CAST(N'2004-08-30T00:00:00.000' AS DateTime), CAST(43332.35 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (260, N'NH776924', CAST(N'2004-04-24T00:00:00.000' AS DateTime), CAST(31302.50 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (276, N'EM979878', CAST(N'2005-02-09T00:00:00.000' AS DateTime), CAST(29852.17 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (276, N'KM841847', CAST(N'2003-11-13T00:00:00.000' AS DateTime), CAST(41791.95 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (276, N'LE432182', CAST(N'2003-09-28T00:00:00.000' AS DateTime), CAST(47191.76 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (276, N'OJ819725', CAST(N'2005-04-30T00:00:00.000' AS DateTime), CAST(35160.25 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (278, N'BJ483870', CAST(N'2004-12-05T00:00:00.000' AS DateTime), CAST(41696.69 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (278, N'GP636783', CAST(N'2003-03-02T00:00:00.000' AS DateTime), CAST(56181.32 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (278, N'NI983021', CAST(N'2003-11-24T00:00:00.000' AS DateTime), CAST(40077.71 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (282, N'IA793562', CAST(N'2003-08-03T00:00:00.000' AS DateTime), CAST(28397.26 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (282, N'JT819493', CAST(N'2004-08-02T00:00:00.000' AS DateTime), CAST(41297.14 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (282, N'OD327378', CAST(N'2005-01-03T00:00:00.000' AS DateTime), CAST(37905.15 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (286, N'DR578578', CAST(N'2004-10-28T00:00:00.000' AS DateTime), CAST(54251.66 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (286, N'KH910279', CAST(N'2004-09-05T00:00:00.000' AS DateTime), CAST(48828.72 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (298, N'AJ574927', CAST(N'2004-03-13T00:00:00.000' AS DateTime), CAST(50432.55 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (298, N'LF501133', CAST(N'2004-09-18T00:00:00.000' AS DateTime), CAST(67281.01 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (299, N'AD304085', CAST(N'2003-10-24T00:00:00.000' AS DateTime), CAST(45078.76 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (299, N'NR157385', CAST(N'2004-09-05T00:00:00.000' AS DateTime), CAST(34145.47 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (311, N'DG336041', CAST(N'2005-02-15T00:00:00.000' AS DateTime), CAST(49055.40 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (311, N'FA728475', CAST(N'2003-10-06T00:00:00.000' AS DateTime), CAST(37501.58 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (311, N'NQ966143', CAST(N'2004-04-25T00:00:00.000' AS DateTime), CAST(17813.40 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (314, N'LQ244073', CAST(N'2004-08-09T00:00:00.000' AS DateTime), CAST(47760.48 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (314, N'MD809704', CAST(N'2004-03-03T00:00:00.000' AS DateTime), CAST(18800.09 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (319, N'HL685576', CAST(N'2004-11-06T00:00:00.000' AS DateTime), CAST(46873.04 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (319, N'OM548174', CAST(N'2003-12-07T00:00:00.000' AS DateTime), CAST(38682.95 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (320, N'GJ597719', CAST(N'2005-01-18T00:00:00.000' AS DateTime), CAST(11021.30 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (320, N'HO576374', CAST(N'2003-08-20T00:00:00.000' AS DateTime), CAST(45738.39 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (320, N'MU817160', CAST(N'2003-11-24T00:00:00.000' AS DateTime), CAST(52191.44 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (321, N'DJ15149', CAST(N'2003-11-03T00:00:00.000' AS DateTime), CAST(95678.88 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (321, N'LA556321', CAST(N'2005-03-15T00:00:00.000' AS DateTime), CAST(54203.62 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (323, N'AL493079', CAST(N'2005-05-23T00:00:00.000' AS DateTime), CAST(39267.74 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (323, N'ES347491', CAST(N'2004-06-24T00:00:00.000' AS DateTime), CAST(40034.67 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (323, N'HG738664', CAST(N'2003-07-05T00:00:00.000' AS DateTime), CAST(2476.80 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (323, N'PQ803830', CAST(N'2004-12-24T00:00:00.000' AS DateTime), CAST(43930.62 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (324, N'DQ409197', CAST(N'2004-12-13T00:00:00.000' AS DateTime), CAST(13739.90 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (324, N'FP443161', CAST(N'2003-07-07T00:00:00.000' AS DateTime), CAST(32376.29 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (324, N'HB150714', CAST(N'2003-11-23T00:00:00.000' AS DateTime), CAST(42688.31 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (328, N'EN930356', CAST(N'2004-04-16T00:00:00.000' AS DateTime), CAST(8722.12 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (328, N'NR631421', CAST(N'2004-05-30T00:00:00.000' AS DateTime), CAST(27987.07 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (333, N'HL209210', CAST(N'2003-11-15T00:00:00.000' AS DateTime), CAST(27098.80 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (333, N'JK479662', CAST(N'2003-10-17T00:00:00.000' AS DateTime), CAST(10640.29 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (333, N'NF959653', CAST(N'2005-03-01T00:00:00.000' AS DateTime), CAST(21730.03 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (334, N'CS435306', CAST(N'2005-01-27T00:00:00.000' AS DateTime), CAST(51373.49 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (334, N'HH517378', CAST(N'2003-08-16T00:00:00.000' AS DateTime), CAST(31569.43 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (334, N'LF737277', CAST(N'2004-05-22T00:00:00.000' AS DateTime), CAST(31018.23 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (339, N'AP286625', CAST(N'2004-10-24T00:00:00.000' AS DateTime), CAST(27445.31 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (339, N'DA98827', CAST(N'2003-11-28T00:00:00.000' AS DateTime), CAST(40061.66 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (344, N'AF246722', CAST(N'2003-11-24T00:00:00.000' AS DateTime), CAST(34311.35 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (344, N'NJ906924', CAST(N'2004-04-02T00:00:00.000' AS DateTime), CAST(15330.70 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (347, N'DG700707', CAST(N'2004-01-18T00:00:00.000' AS DateTime), CAST(23889.32 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (347, N'LG808674', CAST(N'2003-10-24T00:00:00.000' AS DateTime), CAST(24159.14 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (350, N'BQ602907', CAST(N'2004-12-11T00:00:00.000' AS DateTime), CAST(20136.86 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (350, N'CI471510', CAST(N'2003-05-25T00:00:00.000' AS DateTime), CAST(52481.84 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (350, N'OB648482', CAST(N'2005-01-29T00:00:00.000' AS DateTime), CAST(2317.44 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (353, N'CO351193', CAST(N'2005-01-10T00:00:00.000' AS DateTime), CAST(48895.59 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (353, N'ED878227', CAST(N'2003-07-21T00:00:00.000' AS DateTime), CAST(15146.32 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (353, N'GT878649', CAST(N'2003-05-21T00:00:00.000' AS DateTime), CAST(18971.96 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (353, N'HJ618252', CAST(N'2005-06-09T00:00:00.000' AS DateTime), CAST(52029.07 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (357, N'AG240323', CAST(N'2003-12-16T00:00:00.000' AS DateTime), CAST(23294.80 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (357, N'NB291497', CAST(N'2004-07-01T00:00:00.000' AS DateTime), CAST(41418.55 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (362, N'FP170292', CAST(N'2004-07-11T00:00:00.000' AS DateTime), CAST(19548.35 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (362, N'OG208861', CAST(N'2004-09-21T00:00:00.000' AS DateTime), CAST(15344.64 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (363, N'HL575273', CAST(N'2004-11-17T00:00:00.000' AS DateTime), CAST(55570.60 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (363, N'IS232033', CAST(N'2003-01-16T00:00:00.000' AS DateTime), CAST(12133.25 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (363, N'PN238558', CAST(N'2003-12-05T00:00:00.000' AS DateTime), CAST(63981.45 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (379, N'CA762595', CAST(N'2005-02-12T00:00:00.000' AS DateTime), CAST(31474.78 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (379, N'FR499138', CAST(N'2003-09-16T00:00:00.000' AS DateTime), CAST(34992.40 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (379, N'GB890854', CAST(N'2004-08-02T00:00:00.000' AS DateTime), CAST(15110.80 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (381, N'BC726082', CAST(N'2004-12-03T00:00:00.000' AS DateTime), CAST(13463.48 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (381, N'CC475233', CAST(N'2003-04-19T00:00:00.000' AS DateTime), CAST(1711.26 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (381, N'GB117430', CAST(N'2005-02-03T00:00:00.000' AS DateTime), CAST(16628.16 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (381, N'MS154481', CAST(N'2003-08-22T00:00:00.000' AS DateTime), CAST(1637.20 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (382, N'CC871084', CAST(N'2003-05-12T00:00:00.000' AS DateTime), CAST(38629.14 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (382, N'CT821147', CAST(N'2004-08-01T00:00:00.000' AS DateTime), CAST(6693.28 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (382, N'PH29054', CAST(N'2004-11-27T00:00:00.000' AS DateTime), CAST(37353.16 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (385, N'BN347084', CAST(N'2003-12-02T00:00:00.000' AS DateTime), CAST(22841.96 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (385, N'CP804873', CAST(N'2004-11-19T00:00:00.000' AS DateTime), CAST(15928.75 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (385, N'EK785462', CAST(N'2003-03-09T00:00:00.000' AS DateTime), CAST(55245.02 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (386, N'DO106109', CAST(N'2003-11-18T00:00:00.000' AS DateTime), CAST(44669.74 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (386, N'HG438769', CAST(N'2004-07-18T00:00:00.000' AS DateTime), CAST(56421.65 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (398, N'AJ478695', CAST(N'2005-02-14T00:00:00.000' AS DateTime), CAST(38191.39 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (398, N'DO787644', CAST(N'2004-06-21T00:00:00.000' AS DateTime), CAST(25928.75 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (398, N'KB54275', CAST(N'2004-11-29T00:00:00.000' AS DateTime), CAST(44802.04 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (406, N'HJ217687', CAST(N'2004-01-28T00:00:00.000' AS DateTime), CAST(51172.65 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (406, N'NA197101', CAST(N'2004-06-17T00:00:00.000' AS DateTime), CAST(27931.21 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (412, N'GH197075', CAST(N'2004-07-25T00:00:00.000' AS DateTime), CAST(35911.81 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (412, N'PJ434867', CAST(N'2004-04-14T00:00:00.000' AS DateTime), CAST(36409.31 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (415, N'ER54537', CAST(N'2004-09-28T00:00:00.000' AS DateTime), CAST(34993.92 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (424, N'KF480160', CAST(N'2004-12-07T00:00:00.000' AS DateTime), CAST(27733.04 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (424, N'LM271923', CAST(N'2003-04-16T00:00:00.000' AS DateTime), CAST(24777.41 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (424, N'OA595449', CAST(N'2003-10-31T00:00:00.000' AS DateTime), CAST(25284.75 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (447, N'AO757239', CAST(N'2003-09-15T00:00:00.000' AS DateTime), CAST(7600.12 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (447, N'ER615123', CAST(N'2003-06-25T00:00:00.000' AS DateTime), CAST(20350.95 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (447, N'OU516561', CAST(N'2004-12-17T00:00:00.000' AS DateTime), CAST(29343.35 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (448, N'EQ620556', CAST(N'2003-11-06T00:00:00.000' AS DateTime), CAST(48710.92 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (448, N'FS299615', CAST(N'2005-04-18T00:00:00.000' AS DateTime), CAST(31606.72 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (448, N'KR822727', CAST(N'2004-09-30T00:00:00.000' AS DateTime), CAST(53941.69 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (450, N'EF485824', CAST(N'2004-06-21T00:00:00.000' AS DateTime), CAST(64600.34 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (452, N'ED473873', CAST(N'2003-11-15T00:00:00.000' AS DateTime), CAST(28550.59 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (452, N'FN640986', CAST(N'2003-11-20T00:00:00.000' AS DateTime), CAST(14938.15 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (452, N'HG635467', CAST(N'2005-05-03T00:00:00.000' AS DateTime), CAST(8775.16 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (455, N'HA777606', CAST(N'2003-12-05T00:00:00.000' AS DateTime), CAST(42498.76 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (455, N'IR662429', CAST(N'2004-05-12T00:00:00.000' AS DateTime), CAST(36973.31 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (456, N'GJ715659', CAST(N'2004-11-13T00:00:00.000' AS DateTime), CAST(31446.15 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (456, N'MO743231', CAST(N'2004-04-30T00:00:00.000' AS DateTime), CAST(1698.78 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (458, N'DD995006', CAST(N'2004-11-15T00:00:00.000' AS DateTime), CAST(34546.60 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (458, N'NA377824', CAST(N'2004-02-06T00:00:00.000' AS DateTime), CAST(24995.47 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (458, N'OO606861', CAST(N'2003-06-13T00:00:00.000' AS DateTime), CAST(61073.21 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (462, N'ED203908', CAST(N'2005-04-15T00:00:00.000' AS DateTime), CAST(37557.70 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (462, N'GC60330', CAST(N'2003-11-08T00:00:00.000' AS DateTime), CAST(11861.69 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (462, N'PE176846', CAST(N'2004-11-27T00:00:00.000' AS DateTime), CAST(49504.38 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (471, N'AB661578', CAST(N'2004-07-28T00:00:00.000' AS DateTime), CAST(12334.82 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (471, N'CO645196', CAST(N'2003-12-10T00:00:00.000' AS DateTime), CAST(37878.55 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (473, N'LL427009', CAST(N'2004-02-17T00:00:00.000' AS DateTime), CAST(7278.98 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (473, N'PC688499', CAST(N'2003-10-27T00:00:00.000' AS DateTime), CAST(21672.93 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (475, N'JP113227', CAST(N'2003-12-09T00:00:00.000' AS DateTime), CAST(8234.56 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (475, N'PB951268', CAST(N'2004-02-13T00:00:00.000' AS DateTime), CAST(37850.08 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (484, N'GK294076', CAST(N'2004-10-26T00:00:00.000' AS DateTime), CAST(3220.88 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (484, N'JH546765', CAST(N'2003-11-29T00:00:00.000' AS DateTime), CAST(51502.74 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (486, N'BL66528', CAST(N'2004-04-14T00:00:00.000' AS DateTime), CAST(7287.24 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (486, N'HS86661', CAST(N'2004-11-23T00:00:00.000' AS DateTime), CAST(48996.10 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (486, N'JB117768', CAST(N'2003-03-20T00:00:00.000' AS DateTime), CAST(27398.82 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (487, N'AH612904', CAST(N'2003-09-28T00:00:00.000' AS DateTime), CAST(34100.03 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (487, N'PT550181', CAST(N'2004-02-29T00:00:00.000' AS DateTime), CAST(16118.48 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (489, N'OC773849', CAST(N'2003-12-04T00:00:00.000' AS DateTime), CAST(27541.82 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (489, N'PO860906', CAST(N'2004-01-31T00:00:00.000' AS DateTime), CAST(8477.22 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (495, N'BH167026', CAST(N'2003-12-26T00:00:00.000' AS DateTime), CAST(63730.78 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (495, N'FN155234', CAST(N'2004-05-14T00:00:00.000' AS DateTime), CAST(7129.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (496, N'EU531600', CAST(N'2005-06-25T00:00:00.000' AS DateTime), CAST(34332.29 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (496, N'MB342426', CAST(N'2003-07-16T00:00:00.000' AS DateTime), CAST(37754.33 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (496, N'MN89921', CAST(N'2004-12-31T00:00:00.000' AS DateTime), CAST(58593.28 AS Decimal(20, 2)))
GO
INSERT [dbo].[payments] ([customerNumber], [checkNumber], [paymentDate], [amount]) VALUES (496, N'PL783960', CAST(N'2003-11-29T00:00:00.000' AS DateTime), CAST(26421.24 AS Decimal(20, 2)))
GO
INSERT [dbo].[ProductLines] ([productLine], [textDescription], [htmlDescription]) VALUES (N'Classic Cars', N'Attention car enthusiasts: Make your wildest car ownership dreams come true. Whether you are looking for classic muscle cars, dream sports cars or movie-inspired miniatures, you will find great choices in this category. These replicas feature superb attention to detail and craftsmanship and offer features such as working steering system, opening forward compartment, opening rear trunk with removable spare wheel, 4-wheel independent spring suspension, and so on. The models range in size from 1:10 to 1:24 scale and include numerous limited edition and several out-of-production vehicles. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.', NULL)
GO
INSERT [dbo].[ProductLines] ([productLine], [textDescription], [htmlDescription]) VALUES (N'Motorcycles', N'Our motorcycles are state of the art replicas of classic as well as contemporary motorcycle legends such as Harley Davidson, Ducati and Vespa. Models contain stunning details such as official logos, rotating wheels, working kickstand, front suspension, gear-shift lever, footbrake lever, and drive chain. Materials used include diecast and plastic. The models range in size from 1:10 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. All models come fully assembled and ready for display in the home or office. Most include a certificate of authenticity.', NULL)
GO
INSERT [dbo].[ProductLines] ([productLine], [textDescription], [htmlDescription]) VALUES (N'Planes', N'Unique, diecast airplane and helicopter replicas suitable for collections, as well as home, office or classroom decorations. Models contain stunning details such as official logos and insignias, rotating jet engines and propellers, retractable wheels, and so on. Most come fully assembled and with a certificate of authenticity from their manufacturers.', NULL)
GO
INSERT [dbo].[ProductLines] ([productLine], [textDescription], [htmlDescription]) VALUES (N'Ships', N'The perfect holiday or anniversary gift for executives, clients, friends, and family. These handcrafted model ships are unique, stunning works of art that will be treasured for generations! They come fully assembled and ready for display in the home or office. We guarantee the highest quality, and best value.', NULL)
GO
INSERT [dbo].[ProductLines] ([productLine], [textDescription], [htmlDescription]) VALUES (N'Trains', N'Model trains are a rewarding hobby for enthusiasts of all ages. Whether you''re looking for collectible wooden trains, electric streetcars or locomotives, you''ll find a number of great choices for any budget within this category. The interactive aspect of trains makes toy trains perfect for young children. The wooden train sets are ideal for children under the age of 5.', NULL)
GO
INSERT [dbo].[ProductLines] ([productLine], [textDescription], [htmlDescription]) VALUES (N'Trucks and Buses', N'The Truck and Bus models are realistic replicas of buses and specialized trucks produced from the early 1920s to present. The models range in size from 1:12 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. Materials used include tin, diecast and plastic. All models include a certificate of authenticity from their manufacturers and are a perfect ornament for the home and office.', NULL)
GO
INSERT [dbo].[ProductLines] ([productLine], [textDescription], [htmlDescription]) VALUES (N'Vintage Cars', N'Our Vintage Car models realistically portray automobiles produced from the early 1900s through the 1940s. Materials used include Bakelite, diecast, plastic and wood. Most of the replicas are in the 1:18 and 1:24 scale sizes, which provide the optimum in detail and accuracy. Prices range from $30.00 up to $180.00 for some special limited edition replicas. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.', NULL)
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S10_1678', N'1969 Harley Davidson Ultimate Chopper', N'Motorcycles', N'1:10', N'Min Lin Diecast', N'This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.', 7933, CAST(48.81 AS Decimal(20, 2)), CAST(95.70 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S10_1949', N'1952 Alpine Renault 1300', N'Classic Cars', N'1:10', N'Classic Metal Creations', N'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 7305, CAST(98.58 AS Decimal(20, 2)), CAST(214.30 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S10_2016', N'1996 Moto Guzzi 1100i', N'Motorcycles', N'1:10', N'Highway 66 Mini Classics', N'Official Moto Guzzi logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.', 6625, CAST(68.99 AS Decimal(20, 2)), CAST(118.94 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S10_4698', N'2003 Harley-Davidson Eagle Drag Bike', N'Motorcycles', N'1:10', N'Red Start Diecast', N'Model features, official Harley Davidson logos and insignias, detachable rear wheelie bar, heavy diecast metal with resin parts, authentic multi-color tampo-printed graphics, separate engine drive belts, free-turning front fork, rotating tires and rear racing slick, certificate of authenticity, detailed engine, display stand
, precision diecast replica, baked enamel finish, 1:10 scale model, removable fender, seat and tank cover piece for displaying the superior detail of the v-twin engine', 5582, CAST(91.02 AS Decimal(20, 2)), CAST(193.66 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S10_4757', N'1972 Alfa Romeo GTA', N'Classic Cars', N'1:10', N'Motor City Art Classics', N'Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 3252, CAST(85.68 AS Decimal(20, 2)), CAST(136.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S10_4962', N'1962 LanciaA Delta 16V', N'Classic Cars', N'1:10', N'Second Gear Diecast', N'Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 6791, CAST(103.42 AS Decimal(20, 2)), CAST(147.74 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S12_1099', N'1968 Ford Mustang', N'Classic Cars', N'1:12', N'Autoart Studio Design', N'Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color dark green.', 68, CAST(95.34 AS Decimal(20, 2)), CAST(194.57 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S12_1108', N'2001 Ferrari Enzo', N'Classic Cars', N'1:12', N'Second Gear Diecast', N'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 3619, CAST(95.59 AS Decimal(20, 2)), CAST(207.80 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S12_1666', N'1958 Setra Bus', N'Trucks and Buses', N'1:12', N'Welly Diecast Productions', N'Model features 30 windows, skylights & glare resistant glass, working steering system, original logos', 1579, CAST(77.90 AS Decimal(20, 2)), CAST(136.67 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S12_2823', N'2002 Suzuki XREO', N'Motorcycles', N'1:12', N'Unimax Art Galleries', N'Official logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.', 9997, CAST(66.27 AS Decimal(20, 2)), CAST(150.62 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S12_3148', N'1969 Corvair Monza', N'Classic Cars', N'1:18', N'Welly Diecast Productions', N'1:18 scale die-cast about 10" long doors open, hood opens, trunk opens and wheels roll', 6906, CAST(89.14 AS Decimal(20, 2)), CAST(151.08 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S12_3380', N'1968 Dodge Charger', N'Classic Cars', N'1:12', N'Welly Diecast Productions', N'1:12 scale model of a 1968 Dodge Charger. Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color black', 9123, CAST(75.16 AS Decimal(20, 2)), CAST(117.44 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S12_3891', N'1969 Ford Falcon', N'Classic Cars', N'1:12', N'Second Gear Diecast', N'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 1049, CAST(83.05 AS Decimal(20, 2)), CAST(173.02 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S12_3990', N'1970 Plymouth Hemi Cuda', N'Classic Cars', N'1:12', N'Studio M Art Models', N'Very detailed 1970 Plymouth Cuda model in 1:12 scale. The Cuda is generally accepted as one of the fastest original muscle cars from the 1970s. This model is a reproduction of one of the orginal 652 cars built in 1970. Red color.', 5663, CAST(31.92 AS Decimal(20, 2)), CAST(79.80 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S12_4473', N'1957 Chevy Pickup', N'Trucks and Buses', N'1:12', N'Exoto Designs', N'1:12 scale die-cast about 20" long Hood opens, Rubber wheels', 6125, CAST(55.70 AS Decimal(20, 2)), CAST(118.50 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S12_4675', N'1969 Dodge Charger', N'Classic Cars', N'1:12', N'Welly Diecast Productions', N'Detailed model of the 1969 Dodge Charger. This model includes finely detailed interior and exterior features. Painted in red and white.', 7323, CAST(58.73 AS Decimal(20, 2)), CAST(115.16 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_1097', N'1940 Ford Pickup Truck', N'Trucks and Buses', N'1:18', N'Studio M Art Models', N'This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood, removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box', 2613, CAST(58.33 AS Decimal(20, 2)), CAST(116.67 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_1129', N'1993 Mazda RX-7', N'Classic Cars', N'1:18', N'Highway 66 Mini Classics', N'This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color red.', 3975, CAST(83.51 AS Decimal(20, 2)), CAST(141.54 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_1342', N'1937 Lincoln Berline', N'Vintage Cars', N'1:18', N'Motor City Art Classics', N'Features opening engine cover, doors, trunk, and fuel filler cap. Color black', 8693, CAST(60.62 AS Decimal(20, 2)), CAST(102.74 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_1367', N'1936 Mercedes-Benz 500K Special Roadster', N'Vintage Cars', N'1:18', N'Studio M Art Models', N'This 1:18 scale replica is constructed of heavy die-cast metal and has all the features of the original: working doors and rumble seat, independent spring suspension, detailed interior, working steering system, and a bifold hood that reveals an engine so accurate that it even includes the wiring. All this is topped off with a baked enamel finish. Color white.', 8635, CAST(24.26 AS Decimal(20, 2)), CAST(53.91 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_1589', N'1965 Aston Martin DB5', N'Classic Cars', N'1:18', N'Classic Metal Creations', N'Die-cast model of the silver 1965 Aston Martin DB5 in silver. This model includes full wire wheels and doors that open with fully detailed passenger compartment. In 1:18 scale, this model measures approximately 10 inches/20 cm long.', 9042, CAST(65.96 AS Decimal(20, 2)), CAST(124.44 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_1662', N'1980s Black Hawk Helicopter', N'Planes', N'1:18', N'Red Start Diecast', N'1:18 scale replica of actual Army''s UH-60L BLACK HAWK Helicopter. 100% hand-assembled. Features rotating rotor blades, propeller blades and rubber wheels.', 5330, CAST(77.27 AS Decimal(20, 2)), CAST(157.69 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_1749', N'1917 Grand Touring Sedan', N'Vintage Cars', N'1:18', N'Welly Diecast Productions', N'This 1:18 scale replica of the 1917 Grand Touring car has all the features you would expect from museum quality reproductions: all four doors and bi-fold hood opening, detailed engine and instrument panel, chrome-look trim, and tufted upholstery, all topped off with a factory baked-enamel finish.', 2724, CAST(86.70 AS Decimal(20, 2)), CAST(170.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_1889', N'1948 Porsche 356-A Roadster', N'Classic Cars', N'1:18', N'Gearbox Collectibles', N'This precision die-cast replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 8826, CAST(53.90 AS Decimal(20, 2)), CAST(77.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_1984', N'1995 Honda Civic', N'Classic Cars', N'1:18', N'Min Lin Diecast', N'This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color yellow.', 9772, CAST(93.89 AS Decimal(20, 2)), CAST(142.25 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_2238', N'1998 Chrysler Plymouth Prowler', N'Classic Cars', N'1:18', N'Gearbox Collectibles', N'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 4724, CAST(101.51 AS Decimal(20, 2)), CAST(163.73 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_2248', N'1911 Ford Town Car', N'Vintage Cars', N'1:18', N'Motor City Art Classics', N'Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system', 540, CAST(33.30 AS Decimal(20, 2)), CAST(60.54 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_2319', N'1964 Mercedec Tour Bus', N'Trucks and Buses', N'1:18', N'Unimax Art Galleries', N'Exact replica. 100+ parts. working steering system, original logos', 8258, CAST(74.86 AS Decimal(20, 2)), CAST(122.73 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_2325', N'1932 Model A Ford J-Coupe', N'Vintage Cars', N'1:18', N'Autoart Studio Design', N'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine', 9354, CAST(58.48 AS Decimal(20, 2)), CAST(127.13 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_2432', N'1926 Ford Fire Engine', N'Trucks and Buses', N'1:18', N'Carousel DieCast Legends', N'Gleaming red handsome appearance. Everything is here the fire hoses, ladder, axes, bells, lanterns, ready to fight any inferno.', 2018, CAST(24.92 AS Decimal(20, 2)), CAST(60.77 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_2581', N'P-51-D Mustang', N'Planes', N'1:72', N'Gearbox Collectibles', N'Has retractable wheels and comes with a stand', 992, CAST(49.00 AS Decimal(20, 2)), CAST(84.48 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_2625', N'1936 Harley Davidson El Knucklehead', N'Motorcycles', N'1:18', N'Welly Diecast Productions', N'Intricately detailed with chrome accents and trim, official die-struck logos and baked enamel finish.', 4357, CAST(24.23 AS Decimal(20, 2)), CAST(60.57 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_2795', N'1928 Mercedes-Benz SSK', N'Vintage Cars', N'1:18', N'Gearbox Collectibles', N'This 1:18 replica features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine. Color black.', 548, CAST(72.56 AS Decimal(20, 2)), CAST(168.75 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_2870', N'1999 Indy 500 Monte Carlo SS', N'Classic Cars', N'1:18', N'Red Start Diecast', N'Features include opening and closing doors. Color: Red', 8164, CAST(56.76 AS Decimal(20, 2)), CAST(132.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_2949', N'1913 Ford Model T Speedster', N'Vintage Cars', N'1:18', N'Carousel DieCast Legends', N'This 250 part reproduction includes moving handbrakes, clutch, throttle and foot pedals, squeezable horn, detailed wired engine, removable water, gas, and oil cans, pivoting monocle windshield, all topped with a baked enamel red finish. Each replica comes with an Owners Title and Certificate of Authenticity. Color red.', 4189, CAST(60.78 AS Decimal(20, 2)), CAST(101.31 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_2957', N'1934 Ford V8 Coupe', N'Vintage Cars', N'1:18', N'Min Lin Diecast', N'Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System', 5649, CAST(34.35 AS Decimal(20, 2)), CAST(62.46 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_3029', N'1999 Yamaha Speed Boat', N'Ships', N'1:18', N'Min Lin Diecast', N'Exact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', 4259, CAST(51.61 AS Decimal(20, 2)), CAST(86.02 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_3136', N'18th Century Vintage Horse Carriage', N'Vintage Cars', N'1:18', N'Red Start Diecast', N'Hand crafted diecast-like metal horse carriage is re-created in about 1:18 scale of antique horse carriage. This antique style metal Stagecoach is all hand-assembled with many different parts.

This collectible metal horse carriage is painted in classic Red, and features turning steering wheel and is entirely hand-finished.', 5992, CAST(60.74 AS Decimal(20, 2)), CAST(104.72 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_3140', N'1903 Ford Model A', N'Vintage Cars', N'1:18', N'Unimax Art Galleries', N'Features opening trunk, working steering system', 3913, CAST(68.30 AS Decimal(20, 2)), CAST(136.59 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_3232', N'1992 Ferrari 360 Spider red', N'Classic Cars', N'1:18', N'Unimax Art Galleries', N'his replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 8347, CAST(77.90 AS Decimal(20, 2)), CAST(169.34 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_3233', N'1985 Toyota Supra', N'Classic Cars', N'1:18', N'Highway 66 Mini Classics', N'This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood, removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box', 7733, CAST(57.01 AS Decimal(20, 2)), CAST(107.57 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_3259', N'Collectable Wooden Train', N'Trains', N'1:18', N'Carousel DieCast Legends', N'Hand crafted wooden toy train set is in about 1:18 scale, 25 inches in total length including 2 additional carts, of actual vintage train. This antique style wooden toy train model set is all hand-assembled with 100% wood.', 6450, CAST(67.56 AS Decimal(20, 2)), CAST(100.84 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_3278', N'1969 Dodge Super Bee', N'Classic Cars', N'1:18', N'Min Lin Diecast', N'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 1917, CAST(49.05 AS Decimal(20, 2)), CAST(80.41 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_3320', N'1917 Maxwell Touring Car', N'Vintage Cars', N'1:18', N'Exoto Designs', N'Features Gold Trim, Full Size Spare Tire, Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System', 7913, CAST(57.54 AS Decimal(20, 2)), CAST(99.21 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_3482', N'1976 Ford Gran Torino', N'Classic Cars', N'1:18', N'Gearbox Collectibles', N'Highly detailed 1976 Ford Gran Torino "Starsky and Hutch" diecast model. Very well constructed and painted in red and white patterns.', 9127, CAST(73.49 AS Decimal(20, 2)), CAST(146.99 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_3685', N'1948 Porsche Type 356 Roadster', N'Classic Cars', N'1:18', N'Gearbox Collectibles', N'This model features working front and rear suspension on accurately replicated and actuating shock absorbers as well as opening engine cover, rear stabilizer flap, and 4 opening doors.', 8990, CAST(62.16 AS Decimal(20, 2)), CAST(141.28 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_3782', N'1957 Vespa GS150', N'Motorcycles', N'1:18', N'Studio M Art Models', N'Features rotating wheels , working kick stand. Comes with stand.', 7689, CAST(32.95 AS Decimal(20, 2)), CAST(62.17 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_3856', N'1941 Chevrolet Special Deluxe Cabriolet', N'Vintage Cars', N'1:18', N'Exoto Designs', N'Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system, leather upholstery. Color black.', 2378, CAST(64.58 AS Decimal(20, 2)), CAST(105.87 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_4027', N'1970 Triumph Spitfire', N'Classic Cars', N'1:18', N'Min Lin Diecast', N'Features include opening and closing doors. Color: White.', 5545, CAST(91.92 AS Decimal(20, 2)), CAST(143.62 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_4409', N'1932 Alfa Romeo 8C2300 Spider Sport', N'Vintage Cars', N'1:18', N'Exoto Designs', N'This 1:18 scale precision die cast replica features the 6 front headlights of the original, plus a detailed version of the 142 horsepower straight 8 engine, dual spares and their famous comprehensive dashboard. Color black.', 6553, CAST(43.26 AS Decimal(20, 2)), CAST(92.03 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_4522', N'1904 Buick Runabout', N'Vintage Cars', N'1:18', N'Exoto Designs', N'Features opening trunk, working steering system', 8290, CAST(52.66 AS Decimal(20, 2)), CAST(87.77 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_4600', N'1940s Ford truck', N'Trucks and Buses', N'1:18', N'Motor City Art Classics', N'This 1940s Ford Pick-Up truck is re-created in 1:18 scale of original 1940s Ford truck. This antique style metal 1940s Ford Flatbed truck is all hand-assembled. This collectible 1940''s Pick-Up truck is painted in classic dark green color, and features rotating wheels.', 3128, CAST(84.76 AS Decimal(20, 2)), CAST(121.08 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_4668', N'1939 Cadillac Limousine', N'Vintage Cars', N'1:18', N'Studio M Art Models', N'Features completely detailed interior including Velvet flocked drapes,deluxe wood grain floor, and a wood grain casket with seperate chrome handles', 6645, CAST(23.14 AS Decimal(20, 2)), CAST(50.31 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_4721', N'1957 Corvette Convertible', N'Classic Cars', N'1:18', N'Classic Metal Creations', N'1957 die cast Corvette Convertible in Roman Red with white sides and whitewall tires. 1:18 scale quality die-cast with detailed engine and underbvody. Now you can own The Classic Corvette.', 1249, CAST(69.93 AS Decimal(20, 2)), CAST(148.80 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S18_4933', N'1957 Ford Thunderbird', N'Classic Cars', N'1:18', N'Studio M Art Models', N'This 1:18 scale precision die-cast replica, with its optional porthole hardtop and factory baked-enamel Thunderbird Bronze finish, is a 100% accurate rendition of this American classic.', 3209, CAST(34.21 AS Decimal(20, 2)), CAST(71.27 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_1046', N'1970 Chevy Chevelle SS 454', N'Classic Cars', N'1:24', N'Unimax Art Galleries', N'This model features rotating wheels, working streering system and opening doors. All parts are particularly delicate due to their precise scale and require special care and attention. It should not be picked up by the doors, roof, hood or trunk.', 1005, CAST(49.24 AS Decimal(20, 2)), CAST(73.49 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_1444', N'1970 Dodge Coronet', N'Classic Cars', N'1:24', N'Highway 66 Mini Classics', N'1:24 scale die-cast about 18" long doors open, hood opens and rubber wheels', 4074, CAST(32.37 AS Decimal(20, 2)), CAST(57.80 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_1578', N'1997 BMW R 1100 S', N'Motorcycles', N'1:24', N'Autoart Studio Design', N'Detailed scale replica with working suspension and constructed from over 70 parts', 7003, CAST(60.86 AS Decimal(20, 2)), CAST(112.70 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_1628', N'1966 Shelby Cobra 427 S/C', N'Classic Cars', N'1:24', N'Carousel DieCast Legends', N'This diecast model of the 1966 Shelby Cobra 427 S/C includes many authentic details and operating parts. The 1:24 scale model of this iconic lighweight sports car from the 1960s comes in silver and it''s own display case.', 8197, CAST(29.18 AS Decimal(20, 2)), CAST(50.31 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_1785', N'1928 British Royal Navy Airplane', N'Planes', N'1:24', N'Classic Metal Creations', N'Official logos and insignias', 3627, CAST(66.74 AS Decimal(20, 2)), CAST(109.42 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_1937', N'1939 Chevrolet Deluxe Coupe', N'Vintage Cars', N'1:24', N'Motor City Art Classics', N'This 1:24 scale die-cast replica of the 1939 Chevrolet Deluxe Coupe has the same classy look as the original. Features opening trunk, hood and doors and a showroom quality baked enamel finish.', 7332, CAST(22.57 AS Decimal(20, 2)), CAST(33.19 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_2000', N'1960 BSA Gold Star DBD34 1960', N'Motorcycles', N'1:24', N'Highway 66 Mini Classics', N'Detailed scale replica with working suspension and constructed from over 70 parts', 15, CAST(37.32 AS Decimal(20, 2)), CAST(76.17 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_2011', N'18th century schooner', N'Ships', N'1:24', N'Carousel DieCast Legends', N'All wood with canvas sails. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with 4 masts, all square-rigged.', 1898, CAST(82.34 AS Decimal(20, 2)), CAST(122.89 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_2022', N'1938 Cadillac V-16 Presidential Limousine', N'Vintage Cars', N'1:24', N'Classic Metal Creations', N'This 1:24 scale precision die cast replica of the 1938 Cadillac V-16 Presidential Limousine has all the details of the original, from the flags on the front to an opening back seat compartment complete with telephone and rifle. Features factory baked-enamel black finish, hood goddess ornament, working jump seats.', 2847, CAST(20.61 AS Decimal(20, 2)), CAST(44.80 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_2300', N'1962 Volkswagen Microbus', N'Trucks and Buses', N'1:24', N'Autoart Studio Design', N'This 1:18 scale die cast replica of the 1962 Microbus is loaded with features: A working steering system, opening front doors and tailgate, and famous two-tone factory baked enamel finish, are all topped of by the sliding, real fabric, sunroof.', 2327, CAST(61.34 AS Decimal(20, 2)), CAST(127.79 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_2360', N'1982 Ducati 900 Monster', N'Motorcycles', N'1:24', N'Highway 66 Mini Classics', N'Features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand', 6840, CAST(47.10 AS Decimal(20, 2)), CAST(69.26 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_2766', N'1949 Jaguar XK 120', N'Classic Cars', N'1:24', N'Classic Metal Creations', N'Precision-engineered from original Jaguar specification in perfect scale ratio. Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 2350, CAST(47.25 AS Decimal(20, 2)), CAST(90.87 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_2840', N'1958 Chevy Corvette Limited Edition', N'Classic Cars', N'1:24', N'Carousel DieCast Legends', N'The operating parts of this 1958 Chevy Corvette Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, working streering, opening doors and trunk. Color dark green.', 2542, CAST(15.91 AS Decimal(20, 2)), CAST(35.36 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_2841', N'1900s Vintage Bi-Plane', N'Planes', N'1:24', N'Autoart Studio Design', N'Hand crafted diecast-like metal bi-plane is re-created in about 1:24 scale of antique pioneer airplane. All hand-assembled with many different parts. Hand-painted in classic yellow and features correct markings of original airplane.', 5942, CAST(34.25 AS Decimal(20, 2)), CAST(68.51 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_2887', N'1952 Citroen-15CV', N'Classic Cars', N'1:24', N'Exoto Designs', N'Precision crafted hand-assembled 1:18 scale reproduction of the 1952 15CV, with its independent spring suspension, working steering system, opening doors and hood, detailed engine and instrument panel, all topped of with a factory fresh baked enamel finish.', 1452, CAST(72.82 AS Decimal(20, 2)), CAST(117.44 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_2972', N'1982 Lamborghini Diablo', N'Classic Cars', N'1:24', N'Second Gear Diecast', N'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 7723, CAST(16.24 AS Decimal(20, 2)), CAST(37.76 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_3151', N'1912 Ford Model T Delivery Wagon', N'Vintage Cars', N'1:24', N'Min Lin Diecast', N'This model features chrome trim and grille, opening hood, opening doors, opening trunk, detailed engine, working steering system. Color white.', 9173, CAST(46.91 AS Decimal(20, 2)), CAST(88.51 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_3191', N'1969 Chevrolet Camaro Z28', N'Classic Cars', N'1:24', N'Exoto Designs', N'1969 Z/28 Chevy Camaro 1:24 scale replica. The operating parts of this limited edition 1:24 scale diecast model car 1969 Chevy Camaro Z28- hood, trunk, wheels, streering, suspension and doors- are particularly delicate due to their precise scale and require special care and attention.', 4695, CAST(50.51 AS Decimal(20, 2)), CAST(85.61 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_3371', N'1971 Alpine Renault 1600s', N'Classic Cars', N'1:24', N'Welly Diecast Productions', N'This 1971 Alpine Renault 1600s replica Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 7995, CAST(38.58 AS Decimal(20, 2)), CAST(61.23 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_3420', N'1937 Horch 930V Limousine', N'Vintage Cars', N'1:24', N'Autoart Studio Design', N'Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system', 2902, CAST(26.30 AS Decimal(20, 2)), CAST(65.75 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_3432', N'2002 Chevy Corvette', N'Classic Cars', N'1:24', N'Gearbox Collectibles', N'The operating parts of this limited edition Diecast 2002 Chevy Corvette 50th Anniversary Pace car Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, poseable streering, opening doors and trunk.', 9446, CAST(62.11 AS Decimal(20, 2)), CAST(107.08 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_3816', N'1940 Ford Delivery Sedan', N'Vintage Cars', N'1:24', N'Carousel DieCast Legends', N'Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System. Color black.', 6621, CAST(48.64 AS Decimal(20, 2)), CAST(83.86 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_3856', N'1956 Porsche 356A Coupe', N'Classic Cars', N'1:18', N'Classic Metal Creations', N'Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 6600, CAST(98.30 AS Decimal(20, 2)), CAST(140.43 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_3949', N'Corsair F4U ( Bird Cage)', N'Planes', N'1:24', N'Second Gear Diecast', N'Has retractable wheels and comes with a stand. Official logos and insignias.', 6812, CAST(29.34 AS Decimal(20, 2)), CAST(68.24 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_3969', N'1936 Mercedes Benz 500k Roadster', N'Vintage Cars', N'1:24', N'Red Start Diecast', N'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system and rubber wheels. Color black.', 2081, CAST(21.75 AS Decimal(20, 2)), CAST(41.03 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_4048', N'1992 Porsche Cayenne Turbo Silver', N'Classic Cars', N'1:24', N'Exoto Designs', N'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 6582, CAST(69.78 AS Decimal(20, 2)), CAST(118.28 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_4258', N'1936 Chrysler Airflow', N'Vintage Cars', N'1:24', N'Second Gear Diecast', N'Features opening trunk, working steering system. Color dark green.', 4710, CAST(57.46 AS Decimal(20, 2)), CAST(97.39 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_4278', N'1900s Vintage Tri-Plane', N'Planes', N'1:24', N'Unimax Art Galleries', N'Hand crafted diecast-like metal Triplane is Re-created in about 1:24 scale of antique pioneer airplane. This antique style metal triplane is all hand-assembled with many different parts.', 2756, CAST(36.23 AS Decimal(20, 2)), CAST(72.45 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S24_4620', N'1961 Chevrolet Impala', N'Classic Cars', N'1:18', N'Classic Metal Creations', N'This 1:18 scale precision die-cast reproduction of the 1961 Chevrolet Impala has all the features-doors, hood and trunk that open; detailed 409 cubic-inch engine; chrome dashboard and stick shift, two-tone interior; working steering system; all topped of with a factory baked-enamel finish.', 7869, CAST(32.33 AS Decimal(20, 2)), CAST(80.84 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S32_1268', N'1980?s GM Manhattan Express', N'Trucks and Buses', N'1:32', N'Motor City Art Classics', N'This 1980?s era new look Manhattan express is still active, running from the Bronx to mid-town Manhattan. Has 35 opeining windows and working lights. Needs a battery.', 5099, CAST(53.93 AS Decimal(20, 2)), CAST(96.31 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S32_1374', N'1997 BMW F650 ST', N'Motorcycles', N'1:32', N'Exoto Designs', N'Features official die-struck logos and baked enamel finish. Comes with stand.', 178, CAST(66.92 AS Decimal(20, 2)), CAST(99.89 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S32_2206', N'1982 Ducati 996 R', N'Motorcycles', N'1:32', N'Gearbox Collectibles', N'Features rotating wheels , working kick stand. Comes with stand.', 9241, CAST(24.14 AS Decimal(20, 2)), CAST(40.23 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S32_2509', N'1954 Greyhound Scenicruiser', N'Trucks and Buses', N'1:32', N'Classic Metal Creations', N'Model features bi-level seating, 50 windows, skylights & glare resistant glass, working steering system, original logos', 2874, CAST(25.98 AS Decimal(20, 2)), CAST(54.11 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S32_3207', N'1950''s Chicago Surface Lines Streetcar', N'Trains', N'1:32', N'Gearbox Collectibles', N'This streetcar is a joy to see. It has 80 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).', 8601, CAST(26.72 AS Decimal(20, 2)), CAST(62.14 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S32_3522', N'1996 Peterbilt 379 Stake Bed with Outrigger', N'Trucks and Buses', N'1:32', N'Red Start Diecast', N'This model features, opening doors, detailed engine, working steering, tinted windows, detailed interior, die-struck logos, removable stakes operating outriggers, detachable second trailer, functioning 360-degree self loader, precision molded resin trailer and trim, baked enamel finish on cab', 814, CAST(33.61 AS Decimal(20, 2)), CAST(64.64 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S32_4289', N'1928 Ford Phaeton Deluxe', N'Vintage Cars', N'1:32', N'Highway 66 Mini Classics', N'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system', 136, CAST(33.02 AS Decimal(20, 2)), CAST(68.79 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S32_4485', N'1974 Ducati 350 Mk3 Desmo', N'Motorcycles', N'1:32', N'Second Gear Diecast', N'This model features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand', 3341, CAST(56.13 AS Decimal(20, 2)), CAST(102.05 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S50_1341', N'1930 Buick Marquette Phaeton', N'Vintage Cars', N'1:50', N'Studio M Art Models', N'Features opening trunk, working steering system', 7062, CAST(27.06 AS Decimal(20, 2)), CAST(43.64 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S50_1392', N'Diamond T620 Semi-Skirted Tanker', N'Trucks and Buses', N'1:50', N'Highway 66 Mini Classics', N'This limited edition model is licensed and perfectly scaled for Lionel Trains. The Diamond T620 has been produced in solid precision diecast and painted with a fire baked enamel finish. It comes with a removable tanker and is a perfect model to add authenticity to your static train or car layout or to just have on display.', 1016, CAST(68.29 AS Decimal(20, 2)), CAST(115.75 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S50_1514', N'1962 City of Detroit Streetcar', N'Trains', N'1:50', N'Classic Metal Creations', N'This streetcar is a joy to see. It has 99 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).', 1645, CAST(37.49 AS Decimal(20, 2)), CAST(58.58 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S50_4713', N'2002 Yamaha YZR M1', N'Motorcycles', N'1:50', N'Autoart Studio Design', N'Features rotating wheels , working kick stand. Comes with stand.', 600, CAST(34.17 AS Decimal(20, 2)), CAST(81.36 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S700_1138', N'The Schooner Bluenose', N'Ships', N'1:700', N'Autoart Studio Design', N'All wood with canvas sails. Measures 31 1/2 inches in Length, 22 inches High and 4 3/4 inches Wide. Many extras.
The schooner Bluenose was built in Nova Scotia in 1921 to fish the rough waters off the coast of Newfoundland. Because of the Bluenose racing prowess she became the pride of all Canadians. Still featured on stamps and the Canadian dime, the Bluenose was lost off Haiti in 1946.', 1897, CAST(34.00 AS Decimal(20, 2)), CAST(66.67 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S700_1691', N'American Airlines: B767-300', N'Planes', N'1:700', N'Min Lin Diecast', N'Exact replia with official logos and insignias and retractable wheels', 5841, CAST(51.15 AS Decimal(20, 2)), CAST(91.34 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S700_1938', N'The Mayflower', N'Ships', N'1:700', N'Studio M Art Models', N'Measures 31 1/2 inches Long x 25 1/2 inches High x 10 5/8 inches Wide
All wood with canvas sail. Extras include long boats, rigging, ladders, railing, anchors, side cannons, hand painted, etc.

The Mayfower was already old in 1620, when the pilgrims charted her to bring their band of 103 to North America.', 737, CAST(43.30 AS Decimal(20, 2)), CAST(86.61 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S700_2047', N'HMS Bounty', N'Ships', N'1:700', N'Unimax Art Galleries', N'Measures 30 inches Long x 27 1/2 inches High x 4 3/4 inches Wide. 
Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', 3501, CAST(39.83 AS Decimal(20, 2)), CAST(90.52 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S700_2466', N'America West Airlines B757-200', N'Planes', N'1:700', N'Motor City Art Classics', N'Official logos and insignias. Working steering system. Rotating jet engines', 9653, CAST(68.80 AS Decimal(20, 2)), CAST(99.72 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S700_2610', N'The USS Constitution Ship', N'Ships', N'1:700', N'Red Start Diecast', N'All wood with canvas sails. Measures 31 1/2" Length x 22 3/8" High x 8 1/4" Width. Extras include 4 boats on deck, sea sprite on bow, anchors, copper railing, pilot houses, etc.

This was one of six warships commissioned by George Washington and launched in 1797. The nickname Old Ironsides was given the ship when British cannonballs bounced off the 21-inch oak planking of the American frigate''s hull. The Constitution has been restored and now resides in Boston Harbor.', 7083, CAST(33.97 AS Decimal(20, 2)), CAST(72.28 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S700_2824', N'1982 Camaro Z28', N'Classic Cars', N'1:18', N'Carousel DieCast Legends', N'Features include opening and closing doors. Color: White. 
Measures approximately 9 1/2" Long.', 6934, CAST(46.53 AS Decimal(20, 2)), CAST(101.15 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S700_2834', N'ATA: B757-300', N'Planes', N'1:700', N'Highway 66 Mini Classics', N'Exact replia with official logos and insignias and retractable wheels', 7106, CAST(59.33 AS Decimal(20, 2)), CAST(118.65 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S700_3167', N'F/A 18 Hornet 1/72', N'Planes', N'1:72', N'Motor City Art Classics', N'10" Wingspan with retractable landing gears.Comes with pilot', 551, CAST(54.40 AS Decimal(20, 2)), CAST(80.00 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S700_3505', N'The Titanic', N'Ships', N'1:700', N'Carousel DieCast Legends', N'Completed model measures 19 1/2 inches long, 9 inches high, 3inches wide and is in barn red/black. All wood and metal.', 1956, CAST(51.09 AS Decimal(20, 2)), CAST(100.17 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S700_3962', N'The Queen Mary', N'Ships', N'1:700', N'Welly Diecast Productions', N'Exact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', 5088, CAST(53.63 AS Decimal(20, 2)), CAST(99.31 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S700_4002', N'American Airlines: MD-11S', N'Planes', N'1:700', N'Second Gear Diecast', N'Polished finish. Exact replia with official logos and insignias and retractable wheels', 8820, CAST(36.27 AS Decimal(20, 2)), CAST(74.03 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S72_1253', N'Boeing X-32A JSF', N'Planes', N'1:72', N'Motor City Art Classics', N'10" Wingspan with retractable landing gears.Comes with pilot', 4857, CAST(32.77 AS Decimal(20, 2)), CAST(49.66 AS Decimal(20, 2)))
GO
INSERT [dbo].[Products] ([productCode], [productName], [productLine], [productScale], [productVendor], [productDescription], [quantityInStock], [buyPrice], [MSRP]) VALUES (N'S72_3212', N'Pont Yacht', N'Ships', N'1:72', N'Unimax Art Galleries', N'Measures 38 inches Long x 33 3/4 inches High. Includes a stand.
Many extras including rigging, long boats, pilot house, anchors, etc. Comes with 2 masts, all square-rigged', 414, CAST(33.30 AS Decimal(20, 2)), CAST(54.60 AS Decimal(20, 2)))
GO
ALTER TABLE [dbo].[customers]  WITH CHECK ADD FOREIGN KEY([salesRepEmployeeNumber])
REFERENCES [dbo].[employees] ([employeeNumber])
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD FOREIGN KEY([officeCode])
REFERENCES [dbo].[offices] ([officeCode])
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD FOREIGN KEY([orderNumber])
REFERENCES [dbo].[orders] ([orderNumber])
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD FOREIGN KEY([productCode])
REFERENCES [dbo].[Products] ([productCode])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([customerNumber])
REFERENCES [dbo].[customers] ([customerNumber])
GO
ALTER TABLE [dbo].[payments]  WITH CHECK ADD FOREIGN KEY([customerNumber])
REFERENCES [dbo].[customers] ([customerNumber])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([productLine])
REFERENCES [dbo].[ProductLines] ([productLine])
GO
USE [master]
GO
ALTER DATABASE [BI_CA1_OLTP] SET  READ_WRITE 
GO
