CREATE DATABASE MYmovie
USE MYmovie

GO
CREATE TABLE dbo.AgeRestriction (
	AgeRestrictionID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	MinimumAge varchar(10) NOT NULL	
)
GO
CREATE TABLE dbo.Movie (
	MovieID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Title varchar(50) NOT NULL,
	BoxOffice int NOT NULL,
	ReleaseDate date NOT NULL,
	NumOfOscarsWon tinyint NOT NULL,
	Runtime smallint NOT NULL,
	AgeRestrictionID int NOT NULL,
	CONSTRAINT FK_AgeRestriction FOREIGN KEY (AgeRestrictionID) REFERENCES dbo.AgeRestriction(AgeRestrictionID),
)
GO
CREATE TABLE dbo.Studio (
	StudioID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	StudioName varchar(50) NOT NULL	
)
GO
CREATE TABLE dbo.Director (
	DirectorID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	FullName varchar(50) NOT NULL,
	Gender varchar(15) NOT NULL,
	DateOfBirth date NOT NULL,
	DateOfDeath date NULL
)
GO
CREATE TABLE dbo.Genre (
	GenreID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	GenreName varchar(20) NOT NULL
)
GO
CREATE TABLE dbo.Language (
	LanguageID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	LanguageName varchar(20) NOT NULL
)
GO
CREATE TABLE dbo.Country (
	CountryID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CountryName varchar(30) NOT NULL
)
GO
CREATE TABLE dbo.Actor (
	ActorID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	FullName varchar(30) NOT NULL,
	Gender varchar(15) NOT NULL,
	DateOfBirth date NOT NULL,
	DateOfDeath date NULL
)
GO
CREATE TABLE dbo.Role (
	RoleID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	RoleName varchar(30) NOT NULL
)
GO
CREATE TABLE dbo.MovieStudio (
	MovieID int NOT NULL,
	StudioID int NOT NULL,
	CONSTRAINT PK_MovieStudio PRIMARY KEY (MovieID, StudioID),
	CONSTRAINT FK_MovieStudio_Movie FOREIGN KEY (MovieID) REFERENCES dbo.Movie(MovieID),
	CONSTRAINT FK_MovieStudio_Studio FOREIGN KEY (StudioID) REFERENCES dbo.Studio(StudioID)
)
GO
CREATE TABLE dbo.MovieDirector (
	MovieID int NOT NULL,
	DirectorID int NOT NULL,
	CONSTRAINT PK_MovieDirector PRIMARY KEY (MovieID, DirectorID),
	CONSTRAINT FK_MovieDirectorMovie FOREIGN KEY (MovieID) REFERENCES dbo.Movie(MovieID),
	CONSTRAINT FK_MovieDirectorDirector FOREIGN KEY (DirectorID) REFERENCES dbo.Director(DirectorID)
)
GO
CREATE TABLE dbo.MovieGenre (
	MovieID int NOT NULL,
	GenreID int NOT NULL,
	CONSTRAINT PK_MovieGenre PRIMARY KEY (MovieID, GenreID),
	CONSTRAINT FK_MovieGenre_Movie FOREIGN KEY(MovieID) REFERENCES dbo.Movie(MovieID),
	CONSTRAINT FK_MovieGenre_Genre FOREIGN KEY(GenreID) REFERENCES dbo.Genre(GenreID)
)
GO
CREATE TABLE dbo.MovieLanguage (
	MovieID int NOT NULL,
	LanguageID int NOT NULL,
	CONSTRAINT PK_MovieLanguage PRIMARY KEY (MovieID, LanguageID),
	CONSTRAINT FK_MovieLanguage_Movie FOREIGN KEY (MovieID) REFERENCES dbo.Movie(MovieID),
	CONSTRAINT FK_MovieLanguage_Language FOREIGN KEY (LanguageID) REFERENCES dbo.Language(LanguageID)
)
GO
CREATE TABLE dbo.MovieCountry (
	MovieID int NOT NULL,
	CountryID int NOT NULL,
	CONSTRAINT PK_MovieCountry PRIMARY KEY (MovieID, CountryID),
	CONSTRAINT FK_MovieCountryMovie FOREIGN KEY (MovieID) REFERENCES dbo.Movie(MovieID),
	CONSTRAINT FK_MovieCountryCountry FOREIGN KEY (CountryID) REFERENCES dbo.Country(CountryID)
)
GO
CREATE TABLE dbo.MovieRole (
	MovieID int NOT NULL,
	ActorID int NOT NULL,
	RoleID int NOT NULL,
	CONSTRAINT PK_MovieRole PRIMARY KEY (MovieID, ActorID, RoleID),
	CONSTRAINT FK_MovieRoleMovie FOREIGN KEY (MovieID) REFERENCES dbo.Movie(MovieID),
	CONSTRAINT FK_MovieRoleActor FOREIGN KEY (ActorID) REFERENCES dbo.Actor(ActorID),
	CONSTRAINT FK_MovieRoleRole FOREIGN KEY (RoleID) REFERENCES dbo.Role(RoleID)
)
GO

--ADDING VALUES TO OUR TABLES--

INSERT INTO AgeRestriction (MinimumAge) VALUES
('U'),
('PG-13'),
('12'),
('12A'),
('15'),
('18')

INSERT INTO Studio (StudioName) VALUES
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
('Black Label Media'),
('Village Roadshow Pictures'),
('Gravier Productions'),
('Hawk Films'),
('Gracie Films'),
('Bona Film Group'),
('Heyday Films'),
('Lightstorm Entertainment'),
('Scott Free Productions'),
('Netflix'),
('Red Granite Pictures'),
('Appian Way Productions'),
('Imperative Entertainment'),
('Bron Creative'),
('RatPac Entertainment'),
('Société Nouvelle de Cinématographie'),
('Legendary Pictures'),
('Regency Enterprises'),
('Sunswept Entertainment'),
('Likely Story'),
('Playtone'),
('Gilbert Films'),
('Plan B Entertainment')

INSERT INTO Movie (Title, BoxOffice, ReleaseDate, NumOfOscarsWon, Runtime, AgeRestrictionID) VALUES
('Joker', 1074419384, '2019-08-31', 2, 124, 5),
('Irrational Man', 27391084, '2015-05-15', 0, 96, 6),
('The Shining', 44360123, '1980-05-23', 0, 146, 6),
('As Good As It Gets', 314178011, '1997-12-06', 2, 139, 2),
('Once Upon a Time in... Hollywood', 374343626, '2019-05-21', 2, 161, 6),
('Titanic', 220164726, '1997-11-01', 11, 194, 2),
('House of Gucci', 154075986, '2021-11-24', 0, 157, 6),
('The Irishman', 800000,'2019-08-27', 0, 210, 6),
('The Wolf of Wall Street', 392000694, '2013-12-09', 0, 179, 6),
('The Mule', 174504407, '2018-12-10', 1, 116, 6),
('Harry Potter and the Order of the Phoenix', 942172396, '2007-06-28', 0, 138, 2),
('Sully', 238470033, '2016-09-08', 0, 96, 2),
('La Gandarme de Saint-Tropez', 7809517, '1964-09-09', 0, 95, 1),
('Superman Returns', 391081192, '2006-06-21', 0, 154, 2),
('The Hobbit: The Battle of the Five Armies', 962182865, '2014-12-01', 0, 144, 2),
('Fantastic Beasts: The Crimes of Grindelwald', 654855901, '2018-11-08', 0, 134, 2),
('Changeling', 113020256, '2008-05-20', 0, 140, 6),
('Marley & Me', 242717113, '2008-12-25', 0, 120, 2),
('The Circle', 20497844, '2017-04-26', 0, 110, 2),
('LA LA LAND', 448864344, '2016-08-31', 0, 126, 2),
('Eat Pray Love', 204594016, '2010-08-13', 0, 133, 2),
('X-Men: Apocalypse', 543934105, '2016-05-09', 0, 144, 2),
('Black Widow', 379631351, '2021-07-03', 0, 133, 2),
('Gravity', 723192705, '2013-08-28', 7, 90, 2)

INSERT INTO  Director (FullName, Gender, DateOfBirth, DateOfDeath) VALUES
('Gore Verbinski', 'Male', '1964-03-16', NULL),
('Stanley Kubrick', 'Male', '1928-07-26','1999-03-07'),
('Quentin Tarantino', 'Male', '1963-03-27',NULL),
('Christopher Nolan', 'Male', '1970-07-30',NULL),
('Frank Darabont', 'Male', '1959-01-28',NULL),
('James Cameron', 'Male', '1954-08-16',NULL),
('Peter Jackson', 'Male', '1961-10-31',NULL),
('Clint Eastwood', 'Male', '1930-05-31',NULL),
('Steven Spielberg', 'Male', '1946-12-18',NULL),
('Anthony Russo', 'Male', '1970-02-03',NULL),
('Alfonso Cuarón', 'Male', '1961-11-28',NULL),
('David Fincher', 'Male', '1962-08-28',NULL),
('Damien Chazelle', 'Male', '1985-01-19',NULL),
('Francis Lawrence', 'Male', '1971-03-26',NULL),
('Martin Scorsese', 'Male', '1942-11-17',NULL),
('Jean Girault', 'Male', '1924-05-09','1982-07-24'),
('Jan De Bont', 'Male', '1943-10-22',NULL),
('Ridley Scott', 'Male', '1937-11-30',NULL),
('Todd Phillips', 'Male', '1970-12-20',NULL),
('David O. Russell', 'Male', '1958-08-20',NULL),
('Bryan Singer', 'Male', '1965-09-17',NULL),
('Woody Allen', 'Male', '1935-12-01',NULL),
('James L.Brooks', 'Male', '1940-05-09', NULL),
('David Yates', 'Male', '1962-11-30', NULL),
('David Frankel','Male', '1959-04-02', NULL),
('James Ponsoldt', 'Male', '1978-02-15', NULL),
('Ryan Murphy', 'Male', '2010-08-13', NULL),
('Cate Shortland', 'Female', '1968-08-10', NULL)

INSERT INTO Genre (GenreName) VALUES
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

INSERT INTO Language (LanguageName) VALUES
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

INSERT INTO	Country (CountryName) VALUES
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

INSERT INTO Actor (FullName, Gender, DateOfBirth, DateOfDeath) VALUES 
('Joaquin Phoenix', 'Male', '1974-10-28', NULL),
('Jack Nicholson', 'Male', '1937-04-22', NULL),
('Leonardo DiCaprio', 'Male', '1974-11-11', NULL),
('Al Pacino', 'Male', '1940-04-25', NULL),
('Clint Eastwood', 'Male', '1930-05-31', NULL),
('Alan Rickman', 'Male', '1974-10-28','2016-01-14'),
('Tom Hanks', 'Male', '1956-07-09', NULL),
('Louis de Funès', 'Male', '1914-07-31', '1983-01-27'),
('Kevin Spacey', 'Male', '1959-07-26', NULL),
('Ian McKellen', 'Male', '1939-05-25', NULL),
('Johnny Depp', 'Male', '1963-06-09', NULL),
('Margot Robbie', 'Female', '1990-07-02', NULL),
('Angelina Jolie', 'Female', '1975-06-04', NULL),
('Jennifer Aniston', 'Female', '1969-02-11', NULL),
('Emma Watson', 'Female', '1990-04-15', NULL),
('Emma Stone', 'Female', '1988-11-06', NULL),
('Julia Roberts', 'Female', '1990-08-15', NULL),
('Jennifer Lawrence', 'Female', '1974-10-28', NULL),
('Scarlett Johansson', 'Female', '1984-11-22', NULL),
('Sandra Bullock', 'Female', '1964-07-26', NULL),
('Robert De Niro', 'Male', '1943-08-17', NULL)

INSERT INTO Role (RoleName) VALUES
('Joker'),
('Abe'), 
('Jill'), 
('Jack Torrance'), 
('Melvin Udall'), 
('Rick Dalton'), 
('Sharon Tate'), 
('Marvin Schawarz'), 
('Jack Dawson'), 
('Aldo Gucci'), 
('Jimmy Hoffa'), 
('Jordan Belfort'), 
('Earl Stone'), 
('Professor Severus Snape'), 
('Hermoiona Granger'), 
('Chesley Sullenberger'), 
('Inscpector Ludovic Cruchot'),
('Lex Luthor'), 
('Gandalf the Grey'), 
('Gellert Grindewald'), 
('Christine Collins'), 
('Jennifer Grogan'), 
('Mae'),
('Bailey'),
('Mia'), 
('Liz Gilbert'),
('Raven'), 
('Black Widow'), 
('Ryan Stone'),
('Frank The Irishman Sheeran'),
('Naomi Lapaglia'),
('Eamon Bailey')
GO

--QUERY QUESTIONS--

SELECT Movie.Title, STRING_AGG(Country.CountryName, ', ') AS Countries, Movie.NumOfOscarsWon, Director.FullName AS Director
	FROM Movie
		INNER JOIN MovieCountry ON Movie.MovieID = MovieCountry.MovieID
		INNER JOIN Country ON MovieCountry.CountryID = Country.CountryID
		INNER JOIN MovieDirector ON Movie.MovieID = MovieDirector.MovieID
		INNER JOIN Director ON MovieDirector.DirectorID = Director.DirectorID
	WHERE Movie.NumOfOscarsWon >= 1 and Director.FullName = 'James Cameron'
	GROUP BY Movie.NumOfOscarsWon, Director.FullName, Movie.Title
	ORDER BY Movie.Title

SELECT Movie.Title, Movie.ReleaseDate, Movie.Runtime, COUNT(DISTINCT Language.LanguageName) AS NumberOfLanguages
	FROM Movie
		INNER JOIN MovieLanguage ON Movie.MovieID = MovieLanguage.MovieID
		INNER JOIN Language ON MovieLanguage.LanguageID = Language.LanguageID
	GROUP BY Movie.Title, Movie.Runtime, Movie.ReleaseDate
	ORDER BY NumberOfLanguages DESC
		
SELECT Movie.Title, STRING_AGG(Studio.StudioName, ', ') AS Studios, Movie.Runtime, AgeRestriction.MinimumAge, FullName AS Director 
	FROM Movie 
		INNER JOIN MovieStudio ON Movie.MovieID = MovieStudio.MovieID
		INNER JOIN Studio ON MovieStudio.StudioID = Studio.StudioID
		INNER JOIN AgeRestriction ON Movie.AgeRestrictionID = AgeRestriction.AgeRestrictionID
		INNER JOIN MovieDirector ON Movie.MovieID = MovieDirector.MovieID
		INNER JOIN Director ON MovieDirector.DirectorID = Director.DirectorID
	WHERE Movie.Runtime BETWEEN 90 AND 160
	GROUP BY AgeRestriction.MinimumAge, Director.FullName, Movie.Runtime, Movie.Title 
	ORDER BY Movie.Runtime DESC

SELECT Movie.Title, Role.RoleName, Actor.FullName AS Played_by, Movie.ReleaseDate
	FROM Movie
		INNER JOIN MovieRole ON Movie.MovieID = MovieRole.MovieID
		INNER JOIN Role ON MovieRole.RoleID = Role.RoleID
		INNER JOIN Actor ON MovieRole.ActorID = Actor.ActorID
	WHERE Title LIKE 'T__%'
	ORDER BY Role.RoleName
	
SELECT Movie.Title, Movie.Runtime, Genre.GenreName, Director.FullName AS Director
	FROM Movie
		INNER JOIN MovieGenre ON Movie.MovieID = MovieGenre.MovieID
		INNER JOIN Genre ON MovieGenre.GenreID = Genre.GenreID
		INNER JOIN MovieDirector ON Movie.MovieID = MovieDirector.MovieID
		INNER JOIN Director ON MovieDirector.DirectorID = Director.DirectorID
	WHERE Movie.Runtime >= 115 AND (Genre.GenreName = 'Drama' OR Genre.GenreName = 'Science Fiction')
	ORDER BY Movie.Title
GO

--STORED PROCEDURES--

GO
CREATE PROCEDURE MoviesByReleaseDateAndLanguage
(@MinMovieReleaseDate date, @SpeakingLanguage varchar(15))
AS
BEGIN
	IF EXISTS(SELECT * FROM Language WHERE LanguageName = @SpeakingLanguage)
		BEGIN
			SELECT Movie.Title, Movie.ReleaseDate, Language.LanguageName, STRING_AGG(Genre.GenreName, ', ') AS Genres
			FROM Movie
				INNER JOIN MovieLanguage ON Movie.MovieID = MovieLanguage.MovieID
				INNER JOIN Language ON MovieLanguage.LanguageID = Language.LanguageID
				INNER JOIN MovieGenre ON Movie.MovieID = MovieGenre.MovieID
				INNER JOIN Genre ON MovieGenre.GenreID = Genre.GenreID
			WHERE
				Movie.ReleaseDate >= @MinMovieReleaseDate AND
				Language.LanguageName = @SpeakingLanguage
			GROUP BY Movie.Title, Movie.ReleaseDate, Language.LanguageName
			ORDER BY Movie.ReleaseDate
		END
	ELSE	
		BEGIN
			PRINT 'There are no movies in this "' + @SpeakingLanguage + '" language in the database or there is a typo.'
		END
END
GO
EXEC MoviesByReleaseDateAndLanguage @MinMovieReleaseDate = '1960', @SpeakingLanguage = 'English'

GO
CREATE PROCEDURE MoviesByActorAndGenre
(@ActorName varchar(30), @MovieGenre varchar(20))
AS
BEGIN 
	IF EXISTS(SELECT * FROM Genre WHERE GenreName = @MovieGenre)
		AND EXISTS(SELECT * FROM Actor WHERE FullName = @ActorName)
		BEGIN
			SELECT Movie.Title, Genre.GenreName, Actor.FullName
			FROM Movie
				INNER JOIN MovieGenre ON Movie.MovieID = MovieGenre.MovieID
				INNER JOIN Genre ON MovieGenre.GenreID = Genre.GenreID
				INNER JOIN MovieRole ON Movie.MovieID = MovieRole.MovieID 
				INNER JOIN Actor ON MovieRole.ActorID = Actor.ActorID
			WHERE 
				Actor.FullName = @ActorName AND 
				Genre.GenreName = @MovieGenre
			ORDER BY 
			    Movie.Title
		END
	ELSE	
		BEGIN
			PRINT 'There are no movies with this "' + @ActorName + '" actor/actress' + ' or "' + @MovieGenre + '" genre ' + 'in the database or there is a typo.'
		END
END
GO
EXEC MoviesByActorAndGenre @ActorName = 'Julia Roberts', @MovieGenre = 'Drama'