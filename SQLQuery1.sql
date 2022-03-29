--let's create our database
CREATE DATABASE Movies
GO

USE Movies
GO

CREATE TABLE dbo.movie(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Title varchar(100) NOT NULL,
	Director_id int NULL,
	Studio_id int NULL,
	Country_id int NULL,
	Language_id int NULL,
	Genre_id int NULL,
	Age_verification int NULL,
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
	Date_of_birth date NOT NULL,
	Date_of_death date NULL,
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

CREATE TABLE dbo.age_verification(
	Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Age_verification varchar(25) NOT NULL
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

INSERT INTO actor(Full_name, Gender, Date_of_birth, Date_of_death) VALUES 
('Joaquin Phoenix','Male','1974-10-28',NULL),
('Jack Nicholson','Male','1937-04-22',NULL),
('Leonardo DiCaprio','Male','1974-11-11',NULL),
('Al Pacino','Male','1940-04-25',NULL),
('Clint Eastwood','Male','1930-05-31',NULL),
('Alan Rickman','Male','1974-10-28','2016-01-14'),
('Tom Hanks','Male','1956-07-09',NULL),
('Louis de Funès','Male','1914-07-31','1983-01-27'),
('Kevin Spacey','Male','1959-07-26',NULL),
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
('Sony Pictures'),
('TriStar Pictures')


INSERT INTO Age_verification(Age_verification) VALUES
('U'),
('PG'),
('12'),
('12A'),
('15'),
('18')

INSERT INTO	country(Country) VALUES
('United States'),
('United Kingdom'),
('France'),
('China'),
('Germany'),
('Australia'),
('Canada'),
('Poland'),
('Brazil'),
('Hong Kong'),
('Italy'),
('New Zealand'),
('Finland'),
('Japan'),
('Portugal')

INSERT INTO  director(Full_name, Gender, Date_of_birth, Date_of_death) VALUES
('Gore Verbinski', 'Male','1964-03-16',NULL),
('Stanley Kubrick', 'Male','1928-07-26','1999-03-07'),
('Quentin Tarantino', 'Male','1963-03-27',NULL),
('Christopher Nolan', 'Male','1970-07-30',NULL),
('Frank Darabont', 'Male','1959-01-28',NULL),
('James Cameron', 'Male','1954-08-16',NULL),
('Peter Jackson', 'Male','1961-10-31',NULL),
('Clint Eastwood', 'Male','1930-05-31',NULL),
('Steven Spielberg', 'Male','1946-12-18',NULL),
('Anthony Russo', 'Male','1970-02-03',NULL),
('Alfonso Cuarón', 'Male','1961-11-28',NULL),
('David Fincher', 'Male','1962-08-28',NULL),
('Damien Chazelle', 'Male','1985-01-19',NULL),
('Francis Lawrence', 'Male','1971-03-26',NULL),
('Martin Scorsese', 'Male','1942-11-17',NULL),
('Jean Girault', 'Male','1924-05-09','1982-07-24'),
('Jan De Bont', 'Male','1943-10-22',NULL),
('Ridley Scott', 'Male','1937-11-30',NULL),
('Todd Phillips', 'Male','1970-12-20',NULL),
('David O. Russell', 'Male','1958-08-20',NULL),
('Bryan Singer', 'Male','1965-09-17',NULL),
('Woody Allen', 'Male','1935-12-01',NULL),
('James L.Brooks', 'Male', '1940-05-09', NULL)




