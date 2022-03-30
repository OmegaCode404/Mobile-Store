USE [master]
GO
/****** Object:  Database [PhoneStore]    Script Date: 20/03/2022 11:32:37 SA ******/
CREATE DATABASE [PhoneStore]
 CONTAINMENT = NONE
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PhoneStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PhoneStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PhoneStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PhoneStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PhoneStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PhoneStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PhoneStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [PhoneStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PhoneStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PhoneStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PhoneStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PhoneStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PhoneStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PhoneStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PhoneStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PhoneStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PhoneStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PhoneStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PhoneStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PhoneStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PhoneStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PhoneStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PhoneStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PhoneStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PhoneStore] SET RECOVERY FULL 
GO
ALTER DATABASE [PhoneStore] SET  MULTI_USER 
GO
ALTER DATABASE [PhoneStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PhoneStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PhoneStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PhoneStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PhoneStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PhoneStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PhoneStore', N'ON'
GO
ALTER DATABASE [PhoneStore] SET QUERY_STORE = OFF
GO
USE [PhoneStore]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 20/03/2022 11:32:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[phone] [varchar](12) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[userName] [varchar](100) NOT NULL,
	[password] [char](64) NOT NULL,
	[enabled] [bit] NOT NULL,
	[role] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 20/03/2022 11:32:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 20/03/2022 11:32:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] NOT NULL,
	[rank] [varchar](50) NOT NULL,
	[shipToAddress] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 20/03/2022 11:32:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] NOT NULL,
	[salary] [money] NOT NULL,
	[department_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 20/03/2022 11:32:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[discount] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHeader]    Script Date: 20/03/2022 11:32:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHeader](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[status] [varchar](30) NULL,
	[customer_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20/03/2022 11:32:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](500) NOT NULL,
	[price] [float] NOT NULL,
	[discount] [float] NOT NULL,
	[category_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [userName], [password], [enabled], [role]) VALUES (1, N'Admin', N'9652 Los Angeles', N'0123456789', N'a@petstore.com', N'admin', N'1', 1, N'ROLE_ADMIN')
GO
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [userName], [password], [enabled], [role]) VALUES (2, N'Employee1', N'5747 Shirley Drive', N'1234567890', N'e1@petstore.com', N'e1', N'1', 1, N'ROLE_EMPLOYEE')
GO
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [userName], [password], [enabled], [role]) VALUES (3, N'Employee2', N'3841 Silver Oaks Place', N'2345678901', N'e2@petstore.com', N'e2', N'1', 1, N'ROLE_EMPLOYEE')
GO
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [userName], [password], [enabled], [role]) VALUES (4, N'Customer1', N'1873 Lion Circle', N'5678901234', N'c1@gmail.com', N'c1', N'1', 1, N'ROLE_CUSTOMER')
GO
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [userName], [password], [enabled], [role]) VALUES (5, N'Customer2', N'5747 Shirley Drive', N'6789872314', N'c2@gmail.com', N'c2', N'1', 1, N'ROLE_CUSTOMER')
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'iPhone')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'SAMSUNG')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'OPPO')
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Vivo')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Customer] ([id], [rank], [shipToAddress]) VALUES (4, N'Normal', N'1873 Lion Circle')
GO
INSERT [dbo].[Customer] ([id], [rank], [shipToAddress]) VALUES (5, N'Normal', N'5747 Shirley Drive')
GO
INSERT [dbo].[Employee] ([id], [salary], [department_id]) VALUES (1, 1200.0000, 1)
GO
INSERT [dbo].[Employee] ([id], [salary], [department_id]) VALUES (2, 1000.0000, 2)
GO
INSERT [dbo].[Employee] ([id], [salary], [department_id]) VALUES (3, 800.0000, 2)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (1, N'iPhone 11 64GB', 849, 0.1, 1)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (2, N'iPhone 13 Pro Max 128GB', 1847, 0.05, 1)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (3, N'iPhone 12 Pro Max 128GB', 1099, 0.06, 1)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (4, N'iPhone 13 Pro 128GB', 975.97, 0.1, 1)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (5, N'iPhone 12 Pro 128GB', 999, 0.04, 1)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (6, N'iPhone 13 128GB', 975.97, 0.03, 1)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (7, N'iPhone 12 128GB', 609.95, 0.1, 1)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (8, N'iPhone 13 mini 128GB', 699.99, 0.07, 1)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (9, N'iPhone 12 mini 128GB', 779, 0.08, 1)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (10, N'iPhone SE 128GB (2020)', 352.97, 0.09, 1)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (11, N'iPhone XR 128GB', 436.95, 0.1, 1)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (12, N'iPhone SE 64GB (2020)', 219.99, 0.1, 1)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (13, N'Samsung Galaxy Z Fold3 5G 256GB', 1309.95, 0.05, 2)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (14, N'Samsung Galaxy S22 5G 128GB', 799.45, 0.04, 2)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (15, N'Samsung Galaxy S21 FE 5G (6GB/128GB)', 539, 0.1, 2)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (16, N'Samsung Galaxy A03 3GB', 204.99, 0.06, 2)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (17, N'Samsung Galaxy S22 Ultra 5G 128GB', 1999.99, 0.03, 2)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (18, N'Samsung Galaxy S21 Ultra 5G 128GB', 769.8, 0.05, 2)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (19, N'Samsung Galaxy S22+ 5G 128GB', 999.99, 0.04, 2)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (20, N'Samsung Galaxy Z Flip3 5G 128GB', 729.99, 0.06, 2)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (21, N'Samsung Galaxy S21+ 5G 128GB', 598.99, 0.03, 2)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (22, N'Samsung Galaxy S21 5G', 524.99, 0.02, 2)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (23, N'Samsung Galaxy Note 20 Ultra 5G', 1070.99, 0.04, 2)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (24, N'Samsung Galaxy S20 FE (8GB/256GB)', 489, 0.05, 2)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (25, N'OPPO A95', 306.04, 0.07, 3)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (26, N'OPPO Find X3 Pro 5G', 977.77, 0.02, 3)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (27, N'OPPO Reno6 5G', 555, 0.04, 3)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (28, N'OPPO Reno4 Pro', 459.28, 0.06, 3)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (29, N'OPPO Reno5 5G', 204.99, 0.1, 3)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (30, N'OPPO A94', 336.69, 0.1, 3)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (31, N'OPPO A74 5G', 349.82, 0.07, 3)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (32, N'OPPO A76', 262.26, 0.06, 3)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (33, N'OPPO A55', 218.48, 0.1, 3)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (34, N'OPPO A15s', 187.83, 0.07, 3)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (35, N'OPPO A16', 174.96, 0.05, 3)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (36, N'OPPO A16K', 144.05, 0.1, 3)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (37, N'Vivo X70 Pro 5G', 634.3, 0.03, 4)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (38, N'Vivo V23 5G', 568.74, 0.05, 4)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (39, N'Vivo V21 5G', 437.39, 0.06, 4)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (40, N'Vivo V20 (2021)', 371.72, 0.08, 4)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (41, N'Vivo Y72 5G', 349.82, 0.05, 4)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (42, N'Vivo Y33s', 306.04, 0.06, 4)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (43, N'Vivo Y53s', 306.04, 0.1, 4)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (44, N'Vivo Y51 (2020)', 275.39, 0.1, 4)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (45, N'Vivo Y21s 6GB', 262.26, 0.08, 4)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (46, N'Vivo Y21', 187.83, 0.07, 4)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (47, N'Vivo Y15s', 152.8, 0.06, 4)
GO
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (48, N'Vivo Y15a', 174.69, 0.1, 4)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__66DCF95CE5A6C195]    Script Date: 20/03/2022 11:32:38 SA ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__66DCF95CEC61DDC4]    Script Date: 20/03/2022 11:32:38 SA ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ('1') FOR [password]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[OrderHeader] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[OrderHeader]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([id])
GO

GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD CHECK  (([rank]='Normal' OR [rank]='Silver' OR [rank]='Vip'))
GO
ALTER TABLE [dbo].[OrderHeader]  WITH CHECK ADD CHECK  (([status]='canceled' OR [status]='paid' OR [status]='delivered' OR [status]='packaged' OR [status]='confirmed' OR [status]='new'))
GO
USE [master]
GO
ALTER DATABASE [PhoneStore] SET  READ_WRITE 
GO
