

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





