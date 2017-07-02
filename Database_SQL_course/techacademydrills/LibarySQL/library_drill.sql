CREATE DATABASE db_library

USE db_library
/*---------------------------------------------------------------------------------------------------------------------------------------
/* The tables are created in order of relational dependency*/
---------------------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE tbl_publisher
	(	name varchar(50) PRIMARY KEY NOT NULL,
		address varchar(50) not null,
		phone varchar(15) not null
	);


CREATE TABLE tbl_book
	(	bookID INT PRIMARY KEY NOT NULL IDENTITY(1000,20),
		title varchar(50) not null,
		publisherName varchar(50) not null FOREIGN KEY REFERENCES tbl_publisher(name)
	);


CREATE TABLE tbl_borrower
	(   cardNo INT PRIMARY KEY NOT NULL IDENTITY(10000,200),
		name varchar(50) not null,
		address varchar(50) not null,
		phone varchar(15) not null
	);


CREATE TABLE tbl_library_branch
	(	branchID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
		branchName varchar(50) not null,
		address varchar(50) not null
	);


CREATE TABLE tbl_book_authors
	(	bookID INT NOT NULL FOREIGN KEY REFERENCES tbl_book(bookid),
		authorName varchar(50) not null
	);

CREATE TABLE tbl_book_copies
	(	bookID INT FOREIGN KEY REFERENCES tbl_book(bookID) NOT NULL,
		branchID INT FOREIGN KEY REFERENCES tbl_library_branch(branchID) NOT NULL,
		no_of_copies INT not null
	);


CREATE TABLE tbl_book_loans
	(	bookID INT NOT NULL FOREIGN KEY REFERENCES tbl_book(bookID),
		branchID INT NOT NULL FOREIGN KEY REFERENCES tbl_library_branch(branchID),
		cardNo INT NOT NULL FOREIGN KEY REFERENCES tbl_borrower(cardNo),
		dateOut DATE NOT NULL,
		dueDate DATE not null
	);




/*---------------------------------------------------------------------------------------------------------------------------------------
/* Likewise, they are populated in order of relational dependency */
---------------------------------------------------------------------------------------------------------------------------------------*/

INSERT INTO  tbl_publisher
	(name, address, phone)
	VALUES
		('Doubleday','1732 42nd Street, NY, NY 10210','800-977-1318'),
		('Houghton-Mifflin', '500 SW Hawking St., Boston, MA 20100','800-815-5555'),
		('Wiley','1732 Broadway Street, NY, NY 10210','810-977-1318'),
		('ORiley', '1200 Moby Dick St., Boston, MA 20100','900-815-5555');


INSERT INTO  tbl_book
	(title,publisherName)
	VALUES
		('The Lost Tribe','Doubleday'),
		('The age of Aquarius','Houghton-Mifflin'),
		('Home Again','ORiley'),
		('The Roving Prairie','ORiley'),
		('A Sound of Satin Bells','Wiley'),
		('Crows rule','Doubleday'),
		('Ancient America','ORiley'),
		('Mayan for Dummies','Doubleday'),
		('Trigonometry Tricks','Wiley'),
		('Angels in Korea','Doubleday'),
		('Pamper Your Cat','Wiley'),
		('Coins from Zhang-Zhung','Houghton-Mifflin'),
		('Fortran77','Wiley'),
		('Calculus','Doubleday'),
		('Non-Euclidean Geometry','Houghton-Mifflin'),
		('Newton and the Apple','Wiley'),
		('The Lost Tribe Is Found','Doubleday'),
		('The Shadow Knows','Wiley'),
		('Korean Race Queens','Houghton-Mifflin'),
		('The Lost Tribe vs The Flying Saucers','Doubleday'),
		('A Dog named Sun','Wiley'),
		('Running to Mars','ORiley'),
		('The Lost Tribe Gets Lost Again','Doubleday'),
		('Stamps from Zhang-Zhung','Houghton-Mifflin'),
		('LISP for the Masses','Wiley'),
		('The Lost Tribe Has a Party','Doubleday'),
		('Cobol: Language of the Future','Wiley'),
		('The Lost Tribe Finds Itself','Doubleday'),
		('Penny for Your Thoughts','Wiley'),
		('The Flip of a Bitcoin','ORiley');


INSERT INTO  tbl_borrower
	(name, address, phone)
	VALUES
		('Wade Wilson', '1313 Mockingbird Lane', '555-555-5555'),
		('John Carter', '1987 Penny Lane', '555-555-5556'),
		('Lynn Colins', '1313 Mockingbird Lane', '555-555-5557'),
		('Barnabas Colins', '1313 Mockingbird Lane', '555-555-5558'),
		('Buckaroo Bonzai', '1313 Mockingbird Lane', '555-555-5559'),
		('James Bond', '1313 Mockingbird Lane', '555-555-5560'),
		('Carol Singer', '1313 Mockingbird Lane', '555-555-5561'),
		('Caroline Long', '1313 Mockingbird Lane', '555-555-5532'),
		('Debby Parsons', '1313 Mockingbird Lane', '555-555-5512');


INSERT INTO  tbl_library_branch
	( branchName, address)
	VALUES
		('Central', '571 Main Street'),
		('Sharpstown', '77 Sunset Strip'),
		('Mongolia', '172 Yak-Yak Way'),
		('Seoul', '13577 Gangnam Drive');


INSERT INTO  tbl_book_authors
	(bookID,authorName)
	VALUES
		(1000,'Stephen King'),
		(1020,'Bat Masterson'),
		(1040,'Charles Lamb'),
		(1060,'Steven Gould'),
		(1080,'Alvin Banbury'),
		(1100,'Hermes Maitland'),
		(1120,'Alvin Banbury'),
		(1140,'Tina Cabrillos'),
		(1160,'Jonny November'),
		(1180,'Shield Jaguar'),
		(1200,'Leif Erickson'),
		(1220,'Tina Cabrillos'),
		(1240,'Stephen King'),
		(1260,'Alvin Banbury'),
		(1280,'Stephen King'),
		(1300,'Alvin Banbury'),
		(1320,'Stephen King'),
		(1340,'Charles Lamb'),
		(1360,'Stephen King'),
		(1380,'Alvin Banbury'),
		(1400,'Steven Gould'),
		(1420,'Stephen King'),
		(1440,'Stephen King'),
		(1460,'Alvin Banbury'),
		(1480,'Jonny November'),
		(1500,'Stephen King'),
		(1520,'Hermes Maitland'),
		(1540,'Stephen King'),
		(1560,'Charles Lamb'),
		(1580,'Stephen King');


INSERT INTO  tbl_book_copies
	(bookID,branchID,no_of_copies)
	VALUES
		(1000,1,3),
		(1020,1,2),
		(1040,1,2),
		(1060,1,7),
		(1080,1,5),
		(1100,1,9),
		(1120,1,3),
		(1140,1,4),
		(1160,1,2),
		(1180,1,6),
		(1200,1,7),
		(1220,1,3),
		(1240,1,4),
		(1260,1,2),
		(1280,1,4),
		(1300,1,5),
		(1320,1,2),
		(1340,1,8),
		(1360,1,5),
		(1380,1,5),
		(1400,1,3),
		(1420,1,2),
		(1440,1,4),
		(1460,1,2),
		(1480,1,7),
		(1500,1,2),
		(1520,1,5),
		(1540,1,4),
		(1560,1,6),
		(1580,1,2),
		(1000,2,2),
		(1020,2,2),
		(1040,2,2),
		(1060,2,5),
		(1080,2,6),
		(1100,2,8),
		(1120,2,3),
		(1140,2,4),
		(1160,2,2),
		(1180,2,6),
		(1200,2,5),
		(1220,2,2),
		(1180,3,4),
		(1200,3,2),
		(1220,3,4),
		(1240,3,6),
		(1260,3,2),
		(1280,3,4),
		(1300,3,2),
		(1320,3,6),
		(1340,3,3),
		(1360,3,4),
		(1380,3,5),
		(1400,3,2),
		(1420,3,2),
		(1440,3,6),
		(1300,4,3),
		(1320,4,2),
		(1340,4,8),
		(1360,4,5),
		(1380,4,5),
		(1400,4,3),
		(1420,4,2),
		(1440,4,4),
		(1460,4,2),
		(1480,4,7),
		(1500,4,2),
		(1520,4,5),
		(1540,4,4),
		(1560,4,4),
		(1000,3,0),
		(1000,4,1),
		(1580,4,5);


INSERT INTO  tbl_book_loans
	(bookID,branchID,cardNo,dateOut,dueDate)
	VALUES
		(1540, 1,10000,'01/01/2017', '06/29/2017'),
		(1440, 1,10000,'01/01/2017', '06/28/2017'),
		(1220, 1,10000,'01/01/2017', '01/15/2017'),
		(1040, 1,10000,'01/01/2017', '06/29/2017'),
		(1280, 1,10000,'01/01/2017', '01/15/2017'),
		(1340, 1,10000,'01/01/2017', '06/28/2017'),
		(1540, 1,10200,'01/01/2017', '06/30/2017'),
		(1440, 1,10200,'01/01/2017', '01/15/2017'),
		(1340, 2,10600,'01/01/2017', '07/02/2017'),
		(1540, 2,10600,'01/01/2017', '07/03/2017'),
		(1440, 2,10600,'01/01/2017', '07/03/2017'),
		(1220, 2,10600,'01/01/2017', '07/02/2017'),
		(1040, 2,10600,'01/01/2017', '06/28/2017'),
		(1280, 2,10600,'01/01/2017', '01/15/2017'),
		(1300, 2,10600,'01/01/2017', '06/30/2017'),
		(1540, 2,10800,'01/01/2017', '07/02/2017'),
		(1440, 2,10800,'01/01/2017', '06/30/2017'),
		(1220, 3,11000,'01/01/2017', '01/15/2017'),
		(1040, 3,11000,'01/01/2017', '06/29/2017'),
		(1280, 3,11000,'01/01/2017', '01/15/2017'),
		(1540, 4,11400,'01/01/2017', '01/15/2017'),
		(1440, 4,11400,'01/01/2017', '06/29/2017'),
		(1220, 4,10400,'01/01/2017', '06/29/2017'),
		(1000, 4,10400,'01/01/2017', '01/15/2017'),
		(1380, 4,10400,'01/01/2017', '07/15/2017'),
		(1340, 2,10600,'01/01/2017', '06/28/2017'),
		(1540, 2,10800,'01/01/2017', '01/15/2017'),
		(1440, 2,10800,'01/01/2017', '07/15/2017'),
		(1220, 2,10600,'01/01/2017', '01/15/2017'),
		(1040, 4,11400,'01/01/2017', '07/15/2017'),
		(1280, 2,11600,'01/01/2017', '06/29/2017'),
		(1300, 2,11600,'01/01/2017', '06/28/2017');



use db_library

