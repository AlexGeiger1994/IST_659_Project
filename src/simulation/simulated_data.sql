




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

-- select data from gender to view insert
select * from gender


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

-- print genre table
select * from genre


-- upload location data
SET IDENTITY_INSERT [dbo].[location] ON 
GO
INSERT [dbo].[location] ([address_id],[mailing_address],[city_name],[zip_code]) values (0,'Mount Haven Octal','Zimbinia','14625')
GO
INSERT [dbo].[location] ([address_id],[mailing_address],[city_name],[zip_code]) values (1,'Miss Maddie Ville','Handie','14534')
GO
SET IDENTITY_INSERT [dbo].[location] OFF

-- print genre table
select * from [dbo].[location]






-- upload location data
SET IDENTITY_INSERT [dbo].[production] ON 
GO
INSERT [dbo].[production] ([production_id],[company_name],[address_id],[production_number]) values (0,'The Wind',0,'5854241885')
GO
INSERT [dbo].[production] ([production_id],[company_name],[address_id],[production_number]) values (1,'High Water',1,'6072499104')
GO
SET IDENTITY_INSERT [dbo].[production] OFF

-- print genre table
select * from [dbo].[production]



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

-- print genre table
select * from [dbo].[movie]


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

-- print genre table
select * from [dbo].[member]


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


select * from [dbo].[movie_review]





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

-- print genre table
select * from [dbo].[actor]




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

-- print genre table
select * from [dbo].[movie_actor_bridge]

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

-- print genre table
select * from [dbo].[genre_bridge_movie]







