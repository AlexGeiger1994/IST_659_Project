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





