USE [master]
GO

if exists (select * from sys.databases where name = N'HotelFyrirvara')
begin
	EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'HotelFyrirvara';
	ALTER DATABASE HotelFyrirvara SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE HotelFyrirvara;
end

CREATE DATABASE HotelFyrirvara
GO
--/****** Object:  Database [HotelFyrirvara]    Script Date: 2/26/2019 6:00:47 PM ******/
--CREATE DATABASE [HotelFyrirvara]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'HotelFyrirvara', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HotelFyrirvara.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
-- LOG ON 
--( NAME = N'HotelFyrirvara_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HotelFyrirvara_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
--GO
--ALTER DATABASE [HotelFyrirvara] SET COMPATIBILITY_LEVEL = 140
--GO
--IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
--begin
--EXEC [HotelFyrirvara].[dbo].[sp_fulltext_database] @action = 'enable'
--end
--GO
--ALTER DATABASE [HotelFyrirvara] SET ANSI_NULL_DEFAULT OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET ANSI_NULLS OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET ANSI_PADDING OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET ANSI_WARNINGS OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET ARITHABORT OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET AUTO_CLOSE OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET AUTO_SHRINK OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET AUTO_UPDATE_STATISTICS ON 
--GO
--ALTER DATABASE [HotelFyrirvara] SET CURSOR_CLOSE_ON_COMMIT OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET CURSOR_DEFAULT  GLOBAL 
--GO
--ALTER DATABASE [HotelFyrirvara] SET CONCAT_NULL_YIELDS_NULL OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET NUMERIC_ROUNDABORT OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET QUOTED_IDENTIFIER OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET RECURSIVE_TRIGGERS OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET  ENABLE_BROKER 
--GO
--ALTER DATABASE [HotelFyrirvara] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET DATE_CORRELATION_OPTIMIZATION OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET TRUSTWORTHY OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET ALLOW_SNAPSHOT_ISOLATION OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET PARAMETERIZATION SIMPLE 
--GO
--ALTER DATABASE [HotelFyrirvara] SET READ_COMMITTED_SNAPSHOT OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET HONOR_BROKER_PRIORITY OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET RECOVERY FULL 
--GO
--ALTER DATABASE [HotelFyrirvara] SET  MULTI_USER 
--GO
--ALTER DATABASE [HotelFyrirvara] SET PAGE_VERIFY CHECKSUM  
--GO
--ALTER DATABASE [HotelFyrirvara] SET DB_CHAINING OFF 
--GO
--ALTER DATABASE [HotelFyrirvara] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
--GO
--ALTER DATABASE [HotelFyrirvara] SET TARGET_RECOVERY_TIME = 60 SECONDS 
--GO
--ALTER DATABASE [HotelFyrirvara] SET DELAYED_DURABILITY = DISABLED 
--GO
--EXEC sys.sp_db_vardecimal_storage_format N'HotelFyrirvara', N'ON'
--GO
--ALTER DATABASE [HotelFyrirvara] SET QUERY_STORE = OFF
--GO
USE [HotelFyrirvara]
GO
/****** Object:  Table [dbo].[AddOn]    Script Date: 2/26/2019 6:00:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddOn](
	[AddOnId] [int] IDENTITY(1,1) NOT NULL,
	[RoomService] [varchar](35) NULL,
	[Movie] [varchar](25) NULL,
	[Snacks] [varchar](100) NULL,
	[Price] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AddOnId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Amenity]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenity](
	[AmenityId] [int] IDENTITY(1,1) NOT NULL,
	[BathType] [varchar](30) NOT NULL,
	[Minibar] [varchar](30) NULL,
	[ClosetType] [varchar](30) NOT NULL,
	[Price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AmenityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Billing]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billing](
	[BillingId] [int] IDENTITY(1,1) NOT NULL,
	[Tax] [decimal](18, 0) NULL,
	[AddOnId] [int] NULL,
	[ReservationId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BillingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guest]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest](
	[GuestId] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](35) NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[HoldCard] [bit] NULL,
	[Age] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GuestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromotionCode]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionCode](
	[PromotionCodeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[isValidStart] [date] NOT NULL,
	[isValidEnd] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rate]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rate](
	[RateId] [int] IDENTITY(1,1) NOT NULL,
	[ColdSeason] [bit] NOT NULL,
	[WarmSeason] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ReservationId] [int] IDENTITY(100,1) NOT NULL,
	[LastName] [varchar](25) NOT NULL,
	[FirstName] [varchar](25) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[AllGuests] [int] NULL,
	[PromotionCode] [bit] NULL,
	[PromotionCodeId] [int] NULL,
	[AddOnId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationAddOn]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationAddOn](
	[ReservationId] [int] NOT NULL,
	[AddOnId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationGuest]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationGuest](
	[GuestId] [int] NOT NULL,
	[ReservationId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [int] NOT NULL,
	[RoomFloor] [int] NOT NULL,
	[Limit] [int] NULL,
	[RoomTypeId] [int] NOT NULL,
	[Reserved] [bit] NOT NULL,
	[RateId] [int] NOT NULL,
	[AmenityId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomAmenity]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomAmenity](
	[RoomId] [int] NOT NULL,
	[AmenityId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomReservation]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomReservation](
	[RoomId] [int] NOT NULL,
	[ReservationId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 2/26/2019 6:00:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[RoomTypeId] [int] IDENTITY(1,1) NOT NULL,
	[RoomType] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Guest] ADD  DEFAULT ((1)) FOR [HoldCard]
GO
ALTER TABLE [dbo].[Rate] ADD  DEFAULT ((0)) FOR [ColdSeason]
GO
ALTER TABLE [dbo].[Rate] ADD  DEFAULT ((1)) FOR [WarmSeason]
GO
ALTER TABLE [dbo].[Reservation] ADD  DEFAULT ((0)) FOR [PromotionCode]
GO
ALTER TABLE [dbo].[Room] ADD  DEFAULT ((1)) FOR [Reserved]
GO
ALTER TABLE [dbo].[Billing]  WITH CHECK ADD  CONSTRAINT [fk_billing_reservation] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[Reservation] ([ReservationId])
GO
ALTER TABLE [dbo].[Billing] CHECK CONSTRAINT [fk_billing_reservation]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [fk_reservation_promotionCode] FOREIGN KEY([PromotionCodeId])
REFERENCES [dbo].[PromotionCode] ([PromotionCodeId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [fk_reservation_promotionCode]
GO
ALTER TABLE [dbo].[ReservationAddOn]  WITH CHECK ADD  CONSTRAINT [FK_ReservationAddOn_AddOn] FOREIGN KEY([AddOnId])
REFERENCES [dbo].[AddOn] ([AddOnId])
GO
ALTER TABLE [dbo].[ReservationAddOn] CHECK CONSTRAINT [FK_ReservationAddOn_AddOn]
GO
ALTER TABLE [dbo].[ReservationAddOn]  WITH CHECK ADD  CONSTRAINT [FK_ReservationAddOn_Reservation] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[Reservation] ([ReservationId])
GO
ALTER TABLE [dbo].[ReservationAddOn] CHECK CONSTRAINT [FK_ReservationAddOn_Reservation]
GO
ALTER TABLE [dbo].[ReservationGuest]  WITH CHECK ADD  CONSTRAINT [FK_ReservationGuest_Guest] FOREIGN KEY([GuestId])
REFERENCES [dbo].[Guest] ([GuestId])
GO
ALTER TABLE [dbo].[ReservationGuest] CHECK CONSTRAINT [FK_ReservationGuest_Guest]
GO
ALTER TABLE [dbo].[ReservationGuest]  WITH CHECK ADD  CONSTRAINT [FK_ReservationGuest_Reservation] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[Reservation] ([ReservationId])
GO
ALTER TABLE [dbo].[ReservationGuest] CHECK CONSTRAINT [FK_ReservationGuest_Reservation]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [fk_room_rate] FOREIGN KEY([RateId])
REFERENCES [dbo].[Rate] ([RateId])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [fk_room_rate]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [fk_room_roomType] FOREIGN KEY([RoomTypeId])
REFERENCES [dbo].[RoomType] ([RoomTypeId])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [fk_room_roomType]
GO
ALTER TABLE [dbo].[RoomAmenity]  WITH CHECK ADD  CONSTRAINT [FK_RoomAmenity_Amenity] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenity] ([AmenityId])
GO
ALTER TABLE [dbo].[RoomAmenity] CHECK CONSTRAINT [FK_RoomAmenity_Amenity]
GO
ALTER TABLE [dbo].[RoomAmenity]  WITH CHECK ADD  CONSTRAINT [FK_RoomAmenity_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[RoomAmenity] CHECK CONSTRAINT [FK_RoomAmenity_Room]
GO
ALTER TABLE [dbo].[RoomReservation]  WITH CHECK ADD  CONSTRAINT [FK_RoomReservation_Reservation] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[Reservation] ([ReservationId])
GO
ALTER TABLE [dbo].[RoomReservation] CHECK CONSTRAINT [FK_RoomReservation_Reservation]
GO
ALTER TABLE [dbo].[RoomReservation]  WITH CHECK ADD  CONSTRAINT [FK_RoomReservation_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[RoomReservation] CHECK CONSTRAINT [FK_RoomReservation_Room]
GO
USE [master]
GO
ALTER DATABASE [HotelFyrirvara] SET  READ_WRITE 
GO





--------DATA---------





--use HotelFyrirvara
--GO

insert into Guest (LastName, FirstName, HoldCard, Age) values
('Stafford', 'Eric', 1, 27),
('Kinsmore', 'Dan', 1, 30),
('Knowles', 'Beyonce', 1, 35),
('Gaga', 'Lady', 1, 35),
('Cincotta', 'Jacob', null, 25),
('Crampton', 'Cameron', 1, 40),
('Bareilles', 'Sara', 1, 35);

insert into PromotionCode (Name, isValidStart, isValidEnd) values
('Getaway', '2019-5-1',' 2019-5-14'),
('MonthLong', '2019-3-1', '2019-8-12'),
('Lovebirds', '2019-2-1', '2019-2-28');

insert into AddOn (Name, Price) values
('MacNCheese', 10),
('Casablanca', 5),
('Champagne', 15);

insert into Reservation (LastName, FirstName, StartDate, EndDate, AllGuests, PromotionCode, PromotionCodeId, AddOnId) values
('Stafford', 'Eric', '2019-3-15', '2019-3-22', 3, null, null, 1),
('Gaga', 'Lady', '2019-6-21', '2019-6-24', 3, null, null, 1),
('Bareilles', 'Sara','2019-5-12','2019-5-14', 1, 1, 1, 3),
('Kinsmore', 'Dan', '2019-3-21', '2019-3-27',1 , null, null, null),
('Cincotta', 'Jacob', '2019-3-21', '2019-3-28', 2, null, null, 2),
('Crampton', 'Cameron', '2019-3-20', '2019-4-20', 2, 1, 2, 4),
('Knowles', 'Beyonce', '2019-5-23', '2019-6-23', 2, 1, 2, 2),
('Stafford','Eric', '2019-5-14', '2019-5-27', 1, 1, 1, 4);

insert into Amenity ([Name], Price) values
('standardBar', 20),
('jacuzzi', 40),
('standardBath', 20),
('standardCloset',20),
('WalkInCloset', 40);

insert into RoomType (RoomType) values
('one single'),
('two singles'),
('one queen'),
('two queens'),
('one king');

insert into Rate (ColdSeason, WarmSeason) values
(1, null),
(0, 1);

insert into Room (RoomNumber, RoomFloor, Limit, RoomTypeId, Reserved, RateId) values
(10, 1, 1, 1, 0, 1),
(14, 1, 4, 4, 1, 1),
(20, 2, 2, 2, 1, 1),
(21, 2, 2, 5, 0, 1),
(35, 3, 2, 3, 0, 2),
(40, 4, 2, 5, 1, 1);

insert into RoomReservation (RoomId, ReservationId) values
(1, 102),
(2, 105),
(3, 103),
(4, 101),
(5, 100);

insert into Billing (Tax, AddOnId, ReservationId) values
(1.10, 2, 100),
(1.10, 4, 101),
(1.10, 1, 102),
(1.10, 5, 103);

insert into ReservationGuest (ReservationId, GuestId) values
(102, 1),
(105, 2),
(103, 3);

insert into RoomAmenity (RoomId, AmenityId) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);





----------QUERIES----------





--use HotelFyrirvara
--go

--select 
--count(*),
--HoldCard
--from Guest
--group by HoldCard

--select *		
--from Guest
--where HoldCard is null


--select
--	count(PromotionCodeId)
--from Reservation

1.)
select *
from Reservation
where EndDate = '2019-3-22'

2.)
select 
RoomNumber,
Guest.LastName
from Room
inner join RoomReservation on Room.RoomId = RoomReservation.RoomId
--inner join Reservation on RoomReservation.ReservationId = Reservation.ReservationId
inner join ReservationGuest on RoomReservation.ReservationId = ReservationGuest.ReservationId
inner join Guest on ReservationGuest.GuestId = Guest.GuestId
where Guest.LastName = 'Stafford'

--select *
--from Guest

--select *
--from Reservation
--where LastName = 'Stafford'

--5.)
--select
--PromotionCode.Name
--count(PromotionCode)

3.)
select 
RoomNumber
from Room
left outer join RoomAmenity on Room.RoomId = RoomAmenity.RoomId
and RoomAmenity.AmenityId = 2
group by Room.RoomId, Room.RoomNumber
having count(RoomAmenity.AmenityId) = 0

--select*
--from RoomAmenity