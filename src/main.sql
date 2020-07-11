/*
	Project Part II

	Author   : Alex Geiger
	Course   : IST 659
	Term     : April, 2018
*/



-- check movie actor table
IF OBJECT_ID('movie_actor_bridge', 'U') IS NOT NULL 
	drop table  movie_actor_bridge

-- check movie actor table
IF OBJECT_ID('genre_bridge_movie', 'U') IS NOT NULL 
	drop table  genre_bridge_movie


-- check movie actor table
IF OBJECT_ID('movie_review', 'U') IS NOT NULL 
	drop table  movie_review


-- check movie actor table
IF OBJECT_ID('member', 'U') IS NOT NULL 
	drop table member

-- check movie actor table
IF OBJECT_ID('movie', 'U') IS NOT NULL 
	drop table movie

-- check movie actor table
IF OBJECT_ID('genre', 'U') IS NOT NULL 
	drop table  genre

-- check movie actor table
IF OBJECT_ID('actor', 'U') IS NOT NULL 
	drop table  actor

-- create table
IF OBJECT_ID('gender', 'U') IS NOT NULL 
	drop table  gender

-- check movie actor table
IF OBJECT_ID('production', 'U') IS NOT NULL 
	drop table production

-- check movie actor table
IF OBJECT_ID('location', 'U') IS NOT NULL 
	drop table  location

-- create gender table
Create Table gender (
	gender_id int identity primary key,
	MyDescription varchar(20) NOT NULL
)

-- create gender table
Create Table genre (
	genre_id int identity primary key,
	genre_name varchar(15) NOT NULL
)

-- create gender table
Create Table actor (
	actor_id int identity primary key,
	a_first_name varchar(15) NOT NULL,
	a_middle_initial char(1),
	a_last_name varchar(15),
	a_birth_date datetime,
	a_zip_code varchar(5),
	gender_id int,
	constraint fk1_gender_id Foreign Key (gender_id) References gender(gender_id)
)

Create table location (
address_id int identity primary key,
mailing_address varchar(30),
city_name varchar(20),
zip_code varchar(5)
)

-- create gender table
Create Table production (
	production_id int identity primary key,
	company_name varchar(50),
	address_id int,
	production_number varchar(10)
	constraint fk1_location_id Foreign Key (address_id) References location(address_id)
)

-- create gender table
Create Table movie (
	movie_id int identity primary key,
	movie_title varchar(50) NOT NULL,
	production_id int NOT NULL,
	duration_min int,
	status_id int,
	release_year int,
	constraint fk1_production_id Foreign Key (production_id) References production(production_id)
)

-- create movie actor bridge table
Create Table movie_actor_bridge (
	actor_movie_id int identity primary key,
	actor_id int,
	movie_id int,
	constraint fk1_actor_id Foreign Key (actor_id) References actor(actor_id),
	constraint fk2_movie_id Foreign Key (movie_id) References movie(movie_id)
)

-- create gender table
Create Table genre_bridge_movie (
	movie_genre_id int identity primary key,
	genre_id int,
	movie_id int,
	constraint fk2_genre_id Foreign Key (genre_id) References genre(genre_id),
	constraint fk3_movie_id Foreign Key (movie_id) References movie(movie_id)
)

-- create member table
Create Table member (
	member_id int identity primary key,
	m_first_name varchar(15) NOT NULL,
	m_middle_initial char(1),
	m_last_name varchar(15)  NOT NULL,
	m_birth_date datetime  NOT NULL,
	m_zip_code varchar(5)  NOT NULL,
	gender_id int,
	m_email_address varchar(50),
	m_phone varchar(10),
	constraint fk5_gender_id Foreign Key (gender_id) References gender(gender_id)
)

-- create movie review table
Create Table movie_review (

	member_movie_id int identity primary key,
	movie_id int,
	member_id int,
	rating int,
	duration_watched int,
	date_watched datetime,
	constraint fk1_movie_id Foreign Key (movie_id) References movie(movie_id),
	constraint fk6_member_id Foreign Key (member_id) References member(member_id)
)



-- Part II


-- delete location data
DELETE FROM [dbo].[movie_actor_bridge]  WHERE [movie_id] > -1;

-- delete location data
DELETE FROM [dbo].[genre_bridge_movie]  WHERE [movie_genre_id] > -1;

-- delete location data
DELETE FROM [dbo].[movie_review]  WHERE [member_movie_id] > -1;

-- delete location data
DELETE FROM [dbo].[movie]  WHERE [movie_id] > -1;

-- Clear Gender Table
DELETE FROM [dbo].[actor]  WHERE [actor_id] > -1;

-- delete member data
DELETE FROM [dbo].[member]  WHERE [member_id] > -1;

-- delete location data
DELETE FROM [dbo].[production]  WHERE [production_id] > -1;

-- delete data from genre table
DELETE FROM [dbo].[genre]  WHERE [genre_id] > -1;

-- Clear Gender Table
DELETE FROM [dbo].[gender]  WHERE [gender_id] > -1;

-- delete location data
DELETE FROM [dbo].[location]  WHERE [address_id] > -1;


-- Create Gender Identities
SET IDENTITY_INSERT [dbo].[gender] ON 
GO
INSERT [dbo].[gender] ([gender_id],[MyDescription]) values (0,'male')
GO
INSERT [dbo].[gender] ([gender_id],[MyDescription]) values (1,'female')
GO
INSERT [dbo].[gender] ([gender_id],[MyDescription]) values (2,'other')
GO
SET IDENTITY_INSERT [dbo].[gender] OFF

-- insert data into the genre table
SET IDENTITY_INSERT [dbo].[genre] ON 
GO
INSERT [dbo].[genre] ([genre_id],[genre_name]) values (0,'comedy')
GO
INSERT [dbo].[genre] ([genre_id],[genre_name]) values (1,'action')
GO
INSERT [dbo].[genre] ([genre_id],[genre_name]) values (2,'romance')
GO
INSERT [dbo].[genre] ([genre_id],[genre_name]) values (3,'horror')
GO
INSERT [dbo].[genre] ([genre_id],[genre_name]) values (4,'drama')
GO
SET IDENTITY_INSERT [dbo].[genre] OFF


-- upload location data
SET IDENTITY_INSERT [dbo].[location] ON 
GO
INSERT [dbo].[location] ([address_id],[mailing_address],[city_name],[zip_code]) values (0,'Mount Haven Octal','Zimbinia','14625')
GO
INSERT [dbo].[location] ([address_id],[mailing_address],[city_name],[zip_code]) values (1,'Miss Maddie Ville','Handie','14534')
GO
SET IDENTITY_INSERT [dbo].[location] OFF


-- upload location data
SET IDENTITY_INSERT [dbo].[production] ON 
GO
INSERT [dbo].[production] ([production_id],[company_name],[address_id],[production_number]) values (0,'The Wind',0,'5854241885')
GO
INSERT [dbo].[production] ([production_id],[company_name],[address_id],[production_number]) values (1,'High Water',1,'6072499104')
GO
SET IDENTITY_INSERT [dbo].[production] OFF



-- upload location data
SET IDENTITY_INSERT [dbo].[movie] ON 
GO
INSERT [dbo].[movie] ([movie_id],[movie_title],[production_id],[duration_min],[status_id],[release_year]) values (0,'The Man Who Knew SQL',0,64,1,1994)
GO
INSERT [dbo].[movie] ([movie_id],[movie_title],[production_id],[duration_min],[status_id],[release_year]) values (1,'Then Realized He Did Not',0,64,1,1995)
GO
INSERT [dbo].[movie] ([movie_id],[movie_title],[production_id],[duration_min],[status_id],[release_year]) values (2,'Or Did He',0,64,1,1996)
GO
INSERT [dbo].[movie] ([movie_id],[movie_title],[production_id],[duration_min],[status_id],[release_year]) values (3,'OR ELSE',1,64,1,2001)
GO
SET IDENTITY_INSERT [dbo].[movie] OFF


-- upload Member Data
SET IDENTITY_INSERT [dbo].[member] ON 
GO
INSERT [dbo].[member] ([member_id],[m_first_name],[m_middle_initial],[m_last_name],[m_birth_date],[m_zip_code],[m_email_address],[m_phone],[gender_id]) 
	values 
	(0,'Wigmin','J','Tadpole','06/10/1929','14594','wkt@gmail.com','6075944188',0)
GO
INSERT [dbo].[member] ([member_id],[m_first_name],[m_middle_initial],[m_last_name],[m_birth_date],[m_zip_code],[m_email_address],[m_phone],[gender_id]) 
	values 
	(1,'Yam','G','FarmKissler','06/12/1941','19412','yamham@yahoo.com','5857271961',1)
GO
INSERT [dbo].[member] ([member_id],[m_first_name],[m_middle_initial],[m_last_name],[m_birth_date],[m_zip_code],[m_email_address],[m_phone],[gender_id]) 
	values 
	(2,'Mic','Z','Jibelo','06/12/1945','12164','micjibo@aim.com','6186262941',0)
GO
INSERT [dbo].[member] ([member_id],[m_first_name],[m_middle_initial],[m_last_name],[m_birth_date],[m_zip_code],[m_email_address],[m_phone],[gender_id]) 
	values 
	(3,'Muffin','R','Good','06/12/1999','12564','muffinbake@cake.com','5852125434',1)
GO
INSERT [dbo].[member] ([member_id],[m_first_name],[m_middle_initial],[m_last_name],[m_birth_date],[m_zip_code],[m_email_address],[m_phone],[gender_id]) 
	values 
	(4,'Carie','P','Tubman','06/12/1999','11474','clarie_tubman@cake.com','5854745434',1)
GO
SET IDENTITY_INSERT [dbo].[member] OFF


-- upload movie review data data
SET IDENTITY_INSERT [dbo].[movie_review] ON 
GO
INSERT [dbo].[movie_review] ([member_movie_id],[movie_id],[member_id],[duration_watched],[rating],[date_watched]) 
	values 
	(0,0,0,30,5,CAST(N'2015-01-21T10:19:12.000' AS DateTime))
GO
INSERT [dbo].[movie_review] ([member_movie_id],[movie_id],[member_id],[duration_watched],[rating],[date_watched]) 
	values 
	(1,0,1,30,5,CAST(N'2015-01-21T10:19:12.000' AS DateTime))
GO
INSERT [dbo].[movie_review] ([member_movie_id],[movie_id],[member_id],[duration_watched],[rating],[date_watched]) 
	values 
	(2,1,0,90,2,CAST(N'2015-03-21T10:19:12.000' AS DateTime))
GO
INSERT [dbo].[movie_review] ([member_movie_id],[movie_id],[member_id],[duration_watched],[rating],[date_watched]) 
	values 
	(3,1,1,100,5,CAST(N'2015-03-08T10:19:12.000' AS DateTime))
GO
INSERT [dbo].[movie_review] ([member_movie_id],[movie_id],[member_id],[duration_watched],[rating],[date_watched]) 
	values 
	(4,2,0,100,4,CAST(N'2015-07-02T10:19:12.000' AS DateTime))
GO
INSERT [dbo].[movie_review] ([member_movie_id],[movie_id],[member_id],[duration_watched],[rating],[date_watched]) 
	values 
	(5,2,1,100,1,CAST(N'2015-07-11T10:19:12.000' AS DateTime))
GO
INSERT [dbo].[movie_review] ([member_movie_id],[movie_id],[member_id],[duration_watched],[rating],[date_watched]) 
	values 
	(6,3,2,100,3,CAST(N'2016-07-22T10:19:12.000' AS DateTime))
GO
INSERT [dbo].[movie_review] ([member_movie_id],[movie_id],[member_id],[duration_watched],[rating],[date_watched]) 
	values 
	(7,3,2,102,4,CAST(N'2012-01-25T10:19:12.000' AS DateTime))
GO
INSERT [dbo].[movie_review] ([member_movie_id],[movie_id],[member_id],[duration_watched],[rating],[date_watched]) 
	values 
	(8,1,3,140,1,CAST(N'2012-01-25T10:19:12.000' AS DateTime))
GO
INSERT [dbo].[movie_review] ([member_movie_id],[movie_id],[member_id],[duration_watched],[rating],[date_watched]) 
	values 
	(9,2,3,101,5,CAST(N'2012-01-25T10:19:12.000' AS DateTime))
GO
INSERT [dbo].[movie_review] ([member_movie_id],[movie_id],[member_id],[duration_watched],[rating],[date_watched]) 
	values 
	(10,2,4,101,5,CAST(N'2012-01-25T10:19:12.000' AS DateTime))
GO

SET IDENTITY_INSERT [dbo].[movie_review] OFF




-- upload location data
SET IDENTITY_INSERT [dbo].[actor] ON 
GO
INSERT [dbo].[actor] ([actor_id],[a_first_name],[a_middle_initial],[a_last_name],[a_birth_date],[a_zip_code],[gender_id])
 values (0,'Alex','J','Venzoni',CAST(N'1984-07-21T10:19:12.000' AS DateTime),'14531',0)
GO
INSERT [dbo].[actor] ([actor_id],[a_first_name],[a_middle_initial],[a_last_name],[a_birth_date],[a_zip_code],[gender_id])
 values (1,'Wanda','A','Zorndio',CAST(N'1955-07-21T10:19:12.000' AS DateTime),'12731',1)
GO
INSERT [dbo].[actor] ([actor_id],[a_first_name],[a_middle_initial],[a_last_name],[a_birth_date],[a_zip_code],[gender_id])
 values (2,'Zach','E','Dandino',CAST(N'1995-07-21T10:19:12.000' AS DateTime),'12231',0)
GO
INSERT [dbo].[actor] ([actor_id],[a_first_name],[a_middle_initial],[a_last_name],[a_birth_date],[a_zip_code],[gender_id])
 values (3,'Uni','V','Eldino',CAST(N'1955-07-21T10:19:12.000' AS DateTime),'14731',2)
GO
INSERT [dbo].[actor] ([actor_id],[a_first_name],[a_middle_initial],[a_last_name],[a_birth_date],[a_zip_code],[gender_id])
 values (4,'Egg','N','Milk',CAST(N'1995-06-06T10:19:12.000' AS DateTime),'12231',0)
GO
INSERT [dbo].[actor] ([actor_id],[a_first_name],[a_middle_initial],[a_last_name],[a_birth_date],[a_zip_code],[gender_id])
 values (5,'Abi','E','dapkin',CAST(N'1992-07-11T10:19:12.000' AS DateTime),'52231',0)
GO
INSERT [dbo].[actor] ([actor_id],[a_first_name],[a_middle_initial],[a_last_name],[a_birth_date],[a_zip_code],[gender_id])
 values (6,'Chris','I','navan',CAST(N'1995-01-28T10:19:12.000' AS DateTime),'12431',0)
GO
INSERT [dbo].[actor] ([actor_id],[a_first_name],[a_middle_initial],[a_last_name],[a_birth_date],[a_zip_code],[gender_id])
 values (7,'Joe','L','Santana',CAST(N'1995-02-21T10:19:12.000' AS DateTime),'12431',0)
GO
INSERT [dbo].[actor] ([actor_id],[a_first_name],[a_middle_initial],[a_last_name],[a_birth_date],[a_zip_code],[gender_id])
 values (8,'Mike','S','Garnio',CAST(N'1991-10-05T10:19:12.000' AS DateTime),'12431',0)
GO
INSERT [dbo].[actor] ([actor_id],[a_first_name],[a_middle_initial],[a_last_name],[a_birth_date],[a_zip_code],[gender_id])
 values (9,'Osenburg','H','Vinarti',CAST(N'1983-02-19T10:19:12.000' AS DateTime),'12431',0)
GO
SET IDENTITY_INSERT [dbo].[actor] OFF


-- upload location data
SET IDENTITY_INSERT [dbo].[movie_actor_bridge] ON 
GO
INSERT [dbo].[movie_actor_bridge] ([actor_movie_id],[actor_id],[movie_id]) values (0,0,0)
GO
INSERT [dbo].[movie_actor_bridge] ([actor_movie_id],[actor_id],[movie_id]) values (1,2,0)
GO
INSERT [dbo].[movie_actor_bridge] ([actor_movie_id],[actor_id],[movie_id]) values (2,3,0)
GO
INSERT [dbo].[movie_actor_bridge] ([actor_movie_id],[actor_id],[movie_id]) values (3,4,0)
GO
INSERT [dbo].[movie_actor_bridge] ([actor_movie_id],[actor_id],[movie_id]) values (4,5,0)
GO
INSERT [dbo].[movie_actor_bridge] ([actor_movie_id],[actor_id],[movie_id]) values (5,6,0)
GO
INSERT [dbo].[movie_actor_bridge] ([actor_movie_id],[actor_id],[movie_id]) values (6,1,1)
GO
INSERT [dbo].[movie_actor_bridge] ([actor_movie_id],[actor_id],[movie_id]) values (7,3,1)
GO
INSERT [dbo].[movie_actor_bridge] ([actor_movie_id],[actor_id],[movie_id]) values (8,4,1)
GO
INSERT [dbo].[movie_actor_bridge] ([actor_movie_id],[actor_id],[movie_id]) values (9,1,2)
GO
INSERT [dbo].[movie_actor_bridge] ([actor_movie_id],[actor_id],[movie_id]) values (10,2,2)
GO
INSERT [dbo].[movie_actor_bridge] ([actor_movie_id],[actor_id],[movie_id]) values (11,6,2)
GO
INSERT [dbo].[movie_actor_bridge] ([actor_movie_id],[actor_id],[movie_id]) values (12,7,2)
GO
INSERT [dbo].[movie_actor_bridge] ([actor_movie_id],[actor_id],[movie_id]) values (13,8,2)
GO
INSERT [dbo].[movie_actor_bridge] ([actor_movie_id],[actor_id],[movie_id]) values (14,1,3)
GO
INSERT [dbo].[movie_actor_bridge] ([actor_movie_id],[actor_id],[movie_id]) values (15,7,3)
GO
INSERT [dbo].[movie_actor_bridge] ([actor_movie_id],[actor_id],[movie_id]) values (16,8,3)
GO
SET IDENTITY_INSERT [dbo].[movie_actor_bridge] OFF


-- upload location data
SET IDENTITY_INSERT [dbo].[genre_bridge_movie] ON 
GO
INSERT [dbo].[genre_bridge_movie] ([movie_genre_id],[genre_id],[movie_id]) values (0,0,0)
GO
INSERT [dbo].[genre_bridge_movie] ([movie_genre_id],[genre_id],[movie_id]) values (1,1,0)
GO
INSERT [dbo].[genre_bridge_movie] ([movie_genre_id],[genre_id],[movie_id]) values (2,0,1)
GO
INSERT [dbo].[genre_bridge_movie] ([movie_genre_id],[genre_id],[movie_id]) values (3,2,1)
GO
INSERT [dbo].[genre_bridge_movie] ([movie_genre_id],[genre_id],[movie_id]) values (4,2,2)
GO
INSERT [dbo].[genre_bridge_movie] ([movie_genre_id],[genre_id],[movie_id]) values (5,0,2)
GO
INSERT [dbo].[genre_bridge_movie] ([movie_genre_id],[genre_id],[movie_id]) values (6,1,3)
GO
SET IDENTITY_INSERT [dbo].[genre_bridge_movie] OFF



-- PART THREE



IF object_id('count_function','fn') is not null
	drop function count_function;

-- check to drop view
IF object_id('view_actor_movie_genre','v') is not null
	drop view view_actor_movie_genre;
GO

-- check to drop view
IF object_id('view_member_movie_genre','v') is not null
	drop view view_member_movie_genre;
GO

IF object_id('view_member_rev_movie_prod','v') is not null
	drop view view_member_rev_movie_prod;
GO
IF object_id('reset_date','p') is not null
	drop procedure reset_date;
GO
-- create view for joining multiple tables
create view [dbo].[view_actor_movie_genre] as
	SELECT
	   [dbo].[actor].[actor_id],
	   [dbo].[movie].[movie_id],
	   [dbo].[genre_bridge_movie].[genre_id],
	   [dbo].[genre].[genre_name],
	   [dbo].[movie].[movie_title],
	   [dbo].[actor].[a_first_name],
	   [dbo].[actor].[a_last_name]
 FROM  [dbo].[movie]
INNER JOIN [dbo].[genre_bridge_movie] 
ON [dbo].[movie].[movie_id] = [dbo].[genre_bridge_movie].[movie_id]
INNER JOIN [dbo].[genre] 
ON [dbo].[genre].[genre_id] = [dbo].[genre_bridge_movie].[genre_id]
INNER JOIN [dbo].[movie_actor_bridge]
ON [dbo].[movie].[movie_id] = [dbo].[movie_actor_bridge].[movie_id]
INNER JOIN [dbo].[actor]
ON [dbo].[actor].[actor_id] = [dbo].[movie_actor_bridge].[actor_id]
GO

-- create view for joining multiple tables
create view [dbo].[view_member_movie_genre] as
	SELECT
	   [dbo].[member].[member_id],
	   [dbo].[movie].[movie_id],
	   [dbo].[movie_review].[member_movie_id],
	   [dbo].[movie_review].[rating],
	   [dbo].[movie_review].[duration_watched],
	   [dbo].[genre].[genre_name],
	   [dbo].[movie].[movie_title],
	   [dbo].[member].[m_first_name],
	   [dbo].[member].[m_last_name],
	   [dbo].[gender].[MyDescription]
FROM   [dbo].[movie]
INNER JOIN [dbo].[genre_bridge_movie] 
ON [dbo].[movie].[movie_id] = [dbo].[genre_bridge_movie].[movie_id]
INNER JOIN [dbo].[genre] 
ON [dbo].[genre].[genre_id] = [dbo].[genre_bridge_movie].[genre_id]
INNER JOIN [dbo].[movie_review]
ON [dbo].[movie].[movie_id] = [dbo].[movie_review].[movie_id]
INNER JOIN [dbo].[member]
ON [dbo].[member].[member_id] = [dbo].[movie_review].[member_id]
INNER JOIN [dbo].[gender]
ON [dbo].[member].[gender_id] = [dbo].[gender].[gender_id]

GO

-- create view for joining multiple tables
create view [dbo].[view_member_rev_movie_prod] as
	SELECT
	   [dbo].[movie_review].[member_id],
	   [dbo].[movie].[movie_id],
	   [dbo].[movie_review].[member_movie_id],
	   [dbo].[production].[production_id],
	   [dbo].[production].[company_name],
	   [dbo].[movie_review].[rating],
	   [dbo].[movie_review].[duration_watched],
	   [dbo].[genre].[genre_name],
	   [dbo].[movie].[movie_title]
FROM   [dbo].[movie]
INNER JOIN [dbo].[genre_bridge_movie] 
ON [dbo].[movie].[movie_id] = [dbo].[genre_bridge_movie].[movie_id]
INNER JOIN [dbo].[genre] 
ON [dbo].[genre].[genre_id] = [dbo].[genre_bridge_movie].[genre_id]
INNER JOIN [dbo].[movie_review]
ON [dbo].[movie].[movie_id] = [dbo].[movie_review].[movie_id]
INNER JOIN [dbo].[production]
ON [dbo].[production].[production_id] = [dbo].[movie].[production_id]

GO


-- create dummy function
CREATE FUNCTION [dbo].[count_function](@variable int)
RETURNS int AS
BEGIN 

DECLARE @returnValue int
SET @returnvalue = @variable
RETURN @returnValue
END

GO

-- reset the date of the movie watched by user
create procedure [dbo].[reset_date](@movie_member int) as
begin 
update [dbo].[movie_review] set  [date_watched] = GETDATE()
where  [dbo].[movie_review].[member_movie_id] = @movie_member
end 

go

-- Identify top 5 actors to appear in the greatest number of comedy movies.
SELECT Top 5
	count([dbo].[view_actor_movie_genre].[movie_id]) AS movie_count,
	[dbo].[view_actor_movie_genre].[a_first_name] AS first_name,
	[dbo].[view_actor_movie_genre].[a_last_name] AS last_name,
	[dbo].[view_actor_movie_genre].[actor_id] 
	FROM [dbo].[view_actor_movie_genre] 
	where [dbo].[view_actor_movie_genre].[genre_name] = 'comedy'
	GROUP BY a_first_name, a_last_name, actor_id
	ORDER BY movie_count DESC, a_first_name, a_last_name


-- Most watched female movie
select  top 1
	[dbo].[view_member_movie_genre].[movie_id],
	[dbo].[view_member_movie_genre].[movie_title],
	count([dbo].[view_member_movie_genre].[member_id]) AS times_watched
	 from [dbo].[view_member_movie_genre]
	where [dbo].[view_member_movie_genre].[MyDescription] = 'female'
	GROUP BY movie_id, movie_title
	ORDER BY times_watched DESC, movie_title



-- movie with the highest average rating
select top 1
	[dbo].[view_member_movie_genre].[movie_id],
	[dbo].[view_member_movie_genre].[movie_title],
	avg([dbo].[view_member_movie_genre].[rating]) AS avg_rating
	from  [dbo].[view_member_movie_genre]
	where [dbo].[view_member_movie_genre].[MyDescription] = 'female'
	GROUP BY movie_id, movie_title
	ORDER BY avg_rating DESC, movie_title


-- view member table
select top 1
	[dbo].[view_member_rev_movie_prod].[company_name],
	[dbo].[view_member_rev_movie_prod].[production_id],
	avg([dbo].[view_member_rev_movie_prod].[rating]) AS avg_rating
	 from [dbo].[view_member_rev_movie_prod]
	GROUP BY production_id, company_name
	ORDER BY avg_rating DESC

-- use of delete statement
DELETE FROM [dbo].[movie_review]  WHERE [member_movie_id] = 100;

-- upload new movie review data
SET IDENTITY_INSERT [dbo].[movie_review] ON 

INSERT [dbo].[movie_review] ([member_movie_id],[movie_id],[member_id],[duration_watched],[rating],[date_watched]) 
	values 
	(100,0,4,30,5,CAST(N'2015-01-21T10:19:12.000' AS DateTime))
GO

-- set the identity off
SET IDENTITY_INSERT [dbo].[movie_review] OFF

-- print out data right after insert
select * from [dbo].[movie_review] where [member_movie_id] = 100

-- run update procedure
EXEC reset_date 100

-- print out data after update procdure
select * from [dbo].[movie_review] where [member_movie_id] = 100


