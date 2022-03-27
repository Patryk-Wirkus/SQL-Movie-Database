--let's create our database
CREATE DATABASE Movies
GO

USE Movies
GO

CREATE TABLE dbo.movie(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Director_id int NULL,
	Studio_id int NULL,
	Country_id int NULL,
	Language_id int NULL,
	Genre_id int NULL,
	Age_verification int NULL,
	Title varchar(100) NOT NULL,
	Box_office int NULL,
	Release_date date NULL,
	Oscar_wins tinyint NULL,
	Run_time smallint NULL,
)
GO

CREATE TABLE dbo.actor(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Full_name varchar(80) NOT NULL,
	Gender varchar(15) NOT NULL,
	Date_of_birth datetime NOT NULL,
	Date_of_death datetime NULL,
)
GO

CREATE TABLE dbo.director(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Full_name varchar(80) NOT NULL,
	Gender varchar(15) NOT NULL,
	Date_of_birth date NOT NULL,
	Date_of_death date NULL,
)
GO

CREATE TABLE dbo.genre(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Genre varchar(50) NOT NULL
)
GO

CREATE TABLE dbo.language(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Language varchar(80) NOT NULL
)

GO

CREATE TABLE dbo.country(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Country varchar(100) NOT NULL
)
GO

CREATE TABLE dbo.rating(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Rating varchar(25) NOT NULL
)

GO

CREATE TABLE dbo.studio(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Studio varchar(50) NOT NULL
)

GO

CREATE TABLE dbo.role(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Role varchar(100) NOT NULL,
	Actor_id int NULL,
	Movie_id int NULL
)

GO

--adding values to our tables

INSERT INTO actor (Full_name, Gender, Date_of_birth, Date_of_death) VALUES 
('Joaquin Phoenix','Male','1974-10-28',NULL),
('Jack Nicholson','Male','1937-04-22',NULL),
('Leonardo DiCaprio','Male','1974-11-11',NULL),
('Al Pacino','Male','1940-04-25',NULL),
('Clint Eastwood','Male','1930-05-31',NULL),
('Alan Rickman','Male','1974-10-28','2016-01-14'),
('Tom Hanks','Male','1956-07-09',NULL),
('Louis de Funès','Male','1914-07-31','1983-01-27'),
('Kevin Spacey','Male','1959-97-26',NULL),
('Ian McKellen','Male','1939-05-25',NULL),
('Johnny Depp','Male','1963-06-09',NULL),
('Margot Robbie','Female','1990-07-02',NULL),
('Angelina Jolie','Female','1975-06-04',NULL),
('Jennifer Aniston','Female','1969-02-11',NULL),
('Emma Watson','Female','1990-04-15',NULL),
('Emma Stone','Female','1988-11-06',NULL),
('Julia Roberts','Female','1990-08-15',NULL),
('Jennifer Lawrence','Female','1974-10-28',NULL),
('Scarlett Johansson','Female','1984-11-22',NULL),
('Sandra Bullock','Female','1964-07-26',NULL)



INSERT INTO genre (Genre) VALUES
('Western'),
('Drama'),
('Science fiction'),
('Action'),
('War'),
('Romance'),
('Comedy'),
('Adventure'),
('Thriller'),
('Horror'),
('Family'),
('Horror'),
('Documentary'),
('Musical'),
('Crime'),
('History'),
('Fantasy'),
('Animation'),
('Romantic Comedy')


INSERT INTO language (Language) VALUES
('English'),
('German'),
('French'),
('Russian'),
('Japanese'),
('Italian'),
('Swedish'),
('Portugese'),
('Mandarin'),
('Chinese')

INSERT INTO studio (Studio) VALUES
('20th Centuary Fox'),
('Atlas Studios'),
('Columbia Pictures'),
('Dreamwork Pictures'),
('Gaumont'),
('Hengdian World Studios'),
('Indievest'),
('Marvel Studios'),
('Metro-Goldwyn-Mayer'),
('Miramax'),
('Universal Pictures'),
('Paramount Pictures'),
('Pinewood Studios'),
('Walt Disney Pictures'),
('Warner Bros. Pictures'),
('Pixar Animation Studios'),
('Revolution Studios'),
('Sony Pictures')


INSERT INTO rating (Rating) VALUES
('U'),
('PG'),
('12'),
('12A'),
('15'),
('18')

