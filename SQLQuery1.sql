--let's create our database--
CREATE DATABASE Movies
GO

USE Movies
GO

CREATE TABLE dbo.movie(
	MovieID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Title varchar(100) NOT NULL,
	DirectorID int NULL,
	StudioID int NULL,
	CountryID int NULL,
	LanguageID int NULL,
	GenreID int NULL,
	Age_verification int NULL,
	Box_office int NULL,
	Release_date date NULL,
	Oscar_wins tinyint NULL,
	Run_time smallint NULL
)
GO

CREATE TABLE dbo.actor(
	ActorID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Full_name varchar(80) NOT NULL,
	Gender varchar(15) NOT NULL,
	Date_of_birth date NOT NULL,
	Date_of_death date NULL
)
GO

CREATE TABLE dbo.director(
	DirectorID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Full_name varchar(80) NOT NULL,
	Gender varchar(15) NOT NULL,
	Date_of_birth date NOT NULL,
	Date_of_death date NULL,
	FOREIGN KEY(DirectorID) REFERENCES dbo.director(DirectorID)
)
GO

CREATE TABLE dbo.genre(
	GenreID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Genre varchar(50) NOT NULL,
	FOREIGN KEY(GenreID) REFERENCES dbo.genre(GenreID)
)
GO

CREATE TABLE dbo.language(
	LanguageID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Language varchar(80) NOT NULL,
	FOREIGN KEY(LanguageID) REFERENCES dbo.language(LanguageID)
)

GO

CREATE TABLE dbo.country(
	CountryID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Country varchar(100) NOT NULL,
	FOREIGN KEY(CountryID) REFERENCES dbo.country(CountryID)
)
GO

CREATE TABLE dbo.age_verification(
	Age_verificationID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Age_verification varchar(25) NOT NULL,
	FOREIGN KEY(Age_verificationID) REFERENCES dbo.age_verification(Age_verificationID)
	
)

GO

CREATE TABLE dbo.studio(
	StudioID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Studio varchar(50) NOT NULL,
	FOREIGN KEY(StudioID) REFERENCES dbo.studio(StudioID)
)

GO

CREATE TABLE dbo.role(
	RoleID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Role varchar(100) NOT NULL,
	ActorID int NULL,
	MovieID int NULL,
	FOREIGN KEY(ActorID) REFERENCES dbo.actor(ActorID),
	FOREIGN KEY(MovieID) REFERENCES dbo.movie(MovieID)
)

GO

--adding values to our tables--

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
('Romantic Comedy'),
('Biography')


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
('TriStar Pictures'),
('TriBeCa Productions'),
('Franca Films'),
('Imagine Entertainment'),
('Imagenation Abu Dhabi FZ'),
('Black Label Media')


INSERT INTO Age_verification(Age_verification) VALUES
('U'),
('PG-13'),
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
('James L.Brooks', 'Male', '1940-05-09', NULL),
('David Yates', 'Male', '1962-11-30', NULL),
('David Frankel','Male', '1959-04-02', NULL),
('James Ponsoldt', 'Male', '1978-02-15', NULL),
('Ryan Murphy', 'Male', '2010-08-13', NULL),
('Cate Shortland', 'Female', '1968-08-10', NULL)



INSERT INTO movie(Title,DirectorID,StudioID,CountryID,LanguageID,GenreID,Age_verification,Box_office,Release_date,Oscar_wins,Run_time) VALUES
('Joker', 19, 15, 1, 1, 2, 6, 1074419384, '2019-08-31', 2, 124),
('Irrational Man', 22, 18, 1, 1, 2, 5, 27391084, '2015-05-15', 0, 96),
('The Shining', 2, 15, 1, 1, 10, 6, 44360123, '1980-05-23', 0, 146),
('As Good As It Gets', 23, 19, 1, 1, 7, 4, 314178011, '1997-12-06', 2, 139),
('Once Upon a Time in... Hollywood', 3, 18, 1, 1, 2, 5, 374343626, '2019-05-21', 2, 161),
('Titanic', 6, 12, 1, 1, 2, 4, 220164726, '1997-11-01', 11, 194),
('House of Gucci', 18, 9, 1, 1, 2, 6, 154075986, '2021-11-24', 0, 157),
('The Irishman', 15, 20, 1, 1, 14, 6, 800000,'2019-08-27', 0, 210),
('The Wolf of Wall Street', 15, 12, 1, 1, 19, 3, 392000694, '2013-12-09', 0, 179),
('The Mule', 8, 15, 1, 1, 14, 5, 174504407, '2018-12-10', 1, 116),
('Harry Potter and the Order of the Phoenix', 24, 15, 1, 1, 3, 3, 942172396, '2007-06-28', 0, 138),
('Sully', 8, 15, 1, 1, 2, 3, 238470033, '2016-09-08', 0, 96),
('La Gandarme de Saint-Tropez', 16, 21, 3, 3, 7, 3, 7809517, '1964-09-09', 0, 95),
('Superman Returns', 21, 15, 1, 1, 3, 2, 391081192, '2006-06-21', 0, 154),
('The Hobbit: The Battle of the Five Armies', 7, 9, 12, 1, 3, 2, 962182865, '2014-12-01', 0, 144),
('Fantastic Beasts: The Crimes of Grindelwald', 24, 15, 1, 1, 3, 2, 654855901, '2018-11-08', 0, 134),
('Changeling', 8, 22, 1, 1, 2, 6, 113020256, '2008-05-20', 0, 140),
('Marley & Me', 25, 1, 1, 1, 18, 3, 242717113, '2008-12-25', 0, 120),
('The Circle', 26, 23, 1, 1, 9, 2, 20497844, '2017-04-26', 0, 110),
('LA LA LAND', 13, 24, 1, 1, 13, 3, 448864344, '2016-08-31', 0, 126),
('Eat Pray Love', 27, 3, 1, 1, 2, 2, 204594016, '2010-08-13', 0, 133),
('X-Men: Apocalypse', 21, 1, 1, 1, 3, 5, 543934105, '2016-05-09', 0, 144),
('Black Widow', 28, 8, 1, 1, 3, 2, 379631351, '2021-07-03', 0, 133),
('Gravity', 11, 15, 1, 1, 3, 2, 723192705, '2013-08-28', 7, 90)


INSERT INTO role(Role,ActorID,MovieID) VALUES
('Joker', 1, 1),
('Abe', 1, 2),
('Jill', 16, 2),
('Jack Torrance', 2, 3),
('Melvin Udall', 2, 4),
('Rick Dalton', 3, 5),
('Sharon Tate', 12, 5),
('Marvin Schawarz', 4, 5),
('Jack Dawson', 3, 6),
('Aldo Gucci', 4, 7),
('Jimmy Hoffa', 4, 8),
('Jordan Belfort', 3, 9),
('Earl Stone', 5, 10),
('Professor Severus Snape', 6, 11),
('Hermoiona Granger', 15, 11),
('Chesley Sullenberger', 7, 12),
('Inscpector Ludovic Cruchot', 8, 13),
('Lex Luthor', 9, 14),
('Gandalf the Grey', 10, 15),
('Gellert Grindewald', 11, 16),
('Christine Collins', 13, 17),
('Jennifer Grogan', 14, 18),
('Mae', 15, 19),
('Bailey', 7, 19),
('Mia', 16, 20),
('Liz Gilbert', 17, 21),
('Raven', 18, 22),
('Black Widow', 19, 23),
('Ryan Stone', 20, 24)

--QUERY QUESTIONS--

SELECT Title, Studio, Oscar_wins, Full_name as Reżyser
	FROM movie
		JOIN director ON movie.DirectorID = director.DirectorID 
		JOIN studio ON movie.StudioID = studio.StudioID
	WHERE Oscar_wins >= 0 and director.Full_name = 'Clint Eastwood'


Select Title, Genre, Release_date, Language
	FROM movie
		JOIN genre ON movie.GenreID = genre.GenreID
		JOIN language ON movie.LanguageID = language.LanguageID
	WHERE Language != 'English'

Select Title, Country, Studio, Run_time, Full_name as Reżyser	  
	FROM movie
		JOIN country ON movie.CountryID = country.CountryID
		JOIN director ON movie.DirectorID = director.DirectorID
		JOIN studio ON movie.StudioID = studio.StudioID
	WHERE Run_time BETWEEN 90 AND 164
	ORDER BY Run_time DESC
	

		

	
		
		


	
































