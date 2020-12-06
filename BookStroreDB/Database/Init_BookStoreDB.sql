USE [master]
GO
/****** Object:  Database [BookStoreDB]    Script Date: 12/5/2020 7:38:27 PM ******/
CREATE DATABASE [BookStoreDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStoreDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BookStoreDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookStoreDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BookStoreDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookStoreDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStoreDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStoreDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStoreDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStoreDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStoreDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStoreDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStoreDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookStoreDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStoreDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStoreDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStoreDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStoreDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStoreDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStoreDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStoreDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStoreDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookStoreDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStoreDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStoreDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStoreDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStoreDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStoreDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookStoreDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStoreDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BookStoreDB] SET  MULTI_USER 
GO
ALTER DATABASE [BookStoreDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStoreDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStoreDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStoreDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStoreDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookStoreDB', N'ON'
GO
ALTER DATABASE [BookStoreDB] SET QUERY_STORE = OFF
GO
USE [BookStoreDB]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 12/5/2020 7:38:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BookName] [nvarchar](500) NOT NULL,
	[Author] [nvarchar](100) NOT NULL,
	[PublishingHouse] [nvarchar](100) NOT NULL,
	[Category] [nvarchar](100) NOT NULL,
	[YearReleased] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Book] ON 
GO
INSERT [dbo].[Book] ([ID], [BookName], [Author], [PublishingHouse], [Category], [YearReleased], [IsDeleted]) VALUES (1, N'Sapiens: Lược Sử Loài Người', N'Yuval Noah Harari', N'Tri Thức', N'Khoa Học', 2017, 0)
GO
INSERT [dbo].[Book] ([ID], [BookName], [Author], [PublishingHouse], [Category], [YearReleased], [IsDeleted]) VALUES (2, N'Leonardo Da Vinci', N'Walter Isaacson', N'Omega Plus', N'Lịch Sử', 2018, 0)
GO
INSERT [dbo].[Book] ([ID], [BookName], [Author], [PublishingHouse], [Category], [YearReleased], [IsDeleted]) VALUES (3, N'Lịch Sử Do Thái', N'Paul Johnson', N'Omega Plus', N'Lịch Sử', 2020, 0)
GO
INSERT [dbo].[Book] ([ID], [BookName], [Author], [PublishingHouse], [Category], [YearReleased], [IsDeleted]) VALUES (4, N'Đàn Ông Sao Hỏa Đàn Bà Sao Kim', N'John Gray', N'Hồng Đức', N'Khoa Học', 2019, 0)
GO
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_BookDetails]    Script Date: 12/5/2020 7:38:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hoang Nam
-- Create date: 5/12/2020
-- Description:	Book Details
-- =============================================
CREATE PROCEDURE [dbo].[sp_BookDetails]
	@ID INT
AS
BEGIN
	DECLARE @Message NVARCHAR(200) = 'Something went wrong, please contact administrator.'
	BEGIN
	IF(ISNULL(@ID,0) = 0)
			BEGIN
				SET @Message = 'Book ID is required.'
			END
		ELSE
		IF (NOT EXISTS (SELECT * FROM Book WHERE ID = @ID))
		BEGIN
			SET @Message = 'Book is not exists.'
		END
		ELSE
			SELECT * FROM Book
			WHERE ID = @ID
		END
		SELECT @ID AS ID, @Message AS [Message]
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateBooks]    Script Date: 12/5/2020 7:38:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hoang Nam
-- Create date: 5/12/2020
-- Description:	Create Books
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateBooks]
	@BookName NVARCHAR(500),
	@Author NVARCHAR(100),
	@PublishingHouse NVARCHAR(100),
	@Category NVARCHAR(100),
	@YearReleased INT
AS
BEGIN
	DECLARE @BookId	INT = 0,
			@Message	NVARCHAR(200) = 'Something went wrong, please contact administrator.'

	BEGIN TRY
		IF(@BookName IS NULL OR @BookName = '')
		BEGIN
			SET @Message = 'Book Name is required.'
		END
		ELSE
		IF(@Author IS NULL OR @Author = '')
		BEGIN
			SET @Message = 'Author is required.'
		END
		ELSE
		IF(@PublishingHouse IS NULL OR @PublishingHouse = '')
		BEGIN
			SET @Message = 'Publishing House is required.'
		END
		ELSE
		IF(@Category IS NULL OR @Category = '')
		BEGIN
			SET @Message = 'Category is required.'
		END
		ELSE
		IF(@YearReleased IS NULL OR @YearReleased = '')
		BEGIN
			SET @Message = 'Year Release is required.'
		END
		ELSE
			BEGIN
				INSERT INTO Book
				(BookName,
				Author,
				PublishingHouse,
				Category,
				YearReleased,
				IsDeleted)
					 VALUES
						   (@BookName
						   ,@Author 
						   ,@PublishingHouse
						   ,@Category
						   ,@YearReleased
						   ,0)


				SET @BookId = SCOPE_IDENTITY()
				SET @Message = 'Book has been created success.'
			END
		SELECT @ID AS ID, @Message AS [Message]
	END TRY
	BEGIN CATCH
		SELECT @ID AS ID, @Message AS [Message]
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteBooks]    Script Date: 12/5/2020 7:38:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hoang Nam
-- Create date: 5/12/2020
-- Description:	Delete Books
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteBooks]
	@ID		INT	
AS
BEGIN
	
	DECLARE @Message	NVARCHAR(200) = 'Something went wrong, please contact administrator.'
	DECLARE @Result		BIT = 0
	DECLARE @IsDeleted	BIT = 1

	BEGIN TRAN
	BEGIN TRY
		IF(ISNULL(@ID,0) = 0)
		BEGIN
			SET @Message = 'Book ID is required.'
		END
		ELSE
			BEGIN
				IF(NOT EXISTS(SELECT * FROM Book WHERE ID = @ID))
				BEGIN
					SET @Message = 'Can not found Book ID!'	
				END
				ELSE
				IF(EXISTS(SELECT * FROM Book WHERE ID = @ID AND IsDeleted = 1))
				BEGIN
					SET @Message = 'Book has been deleted!'
				END
				ELSE
				BEGIN
					UPDATE Book
					SET IsDeleted = @IsDeleted
					WHERE ID = @ID

					SET @Message = 'Book has been deleted success!'
					SET @Result = 1
				END
		END
		SELECT @Result AS Result, @Message AS [Message], @ID AS ID, @IsDeleted AS IsDeleted
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		SELECT @Result AS Result, @Message AS [Message], @ID AS ID, @IsDeleted AS IsDeleted
		ROLLBACK TRAN
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetBooks]    Script Date: 12/5/2020 7:38:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hoang Nam
-- Create date: 5/12/2020
-- Description:	Get Books
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetBooks]
AS
BEGIN
	SELECT ID,
	BookName,
	Author,
	PublishingHouse,
	Category,
	YearReleased
	  FROM Book
	  WHERE IsDeleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateBooks]    Script Date: 12/5/2020 7:38:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hoang Nam
-- Create date: 5/12/2020
-- Description:	Update Books
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateBooks]
	@ID	INT,
	@BookName NVARCHAR(500),
	@Author NVARCHAR(100),
	@PublishingHouse NVARCHAR(100),
	@Category NVARCHAR(100),
	@YearReleased INT
AS
BEGIN
	
	DECLARE @Message	NVARCHAR(200) = 'Something went wrong, please contact administrator.'
	DECLARE @Result		BIT = 0

	BEGIN TRAN
	BEGIN TRY
		IF(ISNULL(@ID,0) = 0)
		BEGIN
			SET @Message = 'Book Id is required.'
		END
		ELSE
		BEGIN
			IF(ISNULL(@BookName, '') = '')
			BEGIN
				SET @Message = 'Book name is required.'
			END
			ELSE
			IF(@Author IS NULL OR @Author = '')
			BEGIN
				SET @Message = 'Author is required.'
			END
			ELSE
			IF(@PublishingHouse IS NULL OR @PublishingHouse = '')
			BEGIN
				SET @Message = 'Publishing House is required.'
			END
			ELSE
			IF(@Category IS NULL OR @Category = '')
			BEGIN
				SET @Message = 'Category is required.'
			END
			ELSE
			IF(@YearReleased IS NULL OR @YearReleased = '')
			BEGIN
				SET @Message = 'Year Release is required.'
			END
			ELSE
			BEGIN
				IF(NOT EXISTS(SELECT * FROM Book WHERE ID = @ID))
				BEGIN
					SET @Message = 'Can not found Book ID!'	
				END
				ELSE
				BEGIN
					IF(EXISTS(SELECT * FROM Book WHERE BookName = @BookName AND ID <> @ID))
					BEGIN
						SET @Message = 'Book is exists!'	
					END
					ELSE
					BEGIN
						UPDATE Book
						SET BookName = @BookName,
							Author = @Author,
							PublishingHouse = @PublishingHouse,
							Category =@Category,
							YearReleased = @YearReleased
						WHERE ID = @ID

						SET @Message = 'Book has been updated success!'
						SET @Result = 1
					END
				END
			END
		END
		SELECT @Result AS Result, @Message AS [Message], @ID AS ID
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		SELECT @Result AS Result, @Message AS [Message], @ID AS ID
		ROLLBACK TRAN
	END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [BookStoreDB] SET  READ_WRITE 
GO
