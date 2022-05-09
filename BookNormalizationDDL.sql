CREATE TABLE Author(
	AuthorID INT PRIMARY KEY, 
	AuthorName VARCHAR(20)
)
GO

CREATE TABLE Publisher(
	PublisherID INT PRIMARY KEY, 
	PublisherName VARCHAR(20)
)
GO

CREATE TABLE Book(
	BookID INT PRIMARY KEY, 
	Title VARCHAR(20), 
	ISBN VARCHAR(10), 
	PublishDate DATE, 
	PublisherID INT FOREIGN KEY REFERENCES Publisher(PublisherID)
)
GO

CREATE TABLE BookAuthor(
	BookID INT NOT NULL FOREIGN KEY REFERENCES Book(BookID), 
	AuthorID INT NOT NULL FOREIGN KEY REFERENCES Author(AuthorID)
)
GO

ALTER TABLE BookAuthor
	ADD CONSTRAINT PK_BookAuthor PRIMARY KEY (BookID, AuthorID)
GO

INSERT INTO Author
VALUES(1, 'Author A'), (2, 'Author B'), (3, 'Author C'), (4, 'Author D'), (5, 'Author E')
GO

INSERT INTO Publisher
VALUES (1, 'Publisher 1'), (2, 'Publisher 2'), (3, 'Publisher 3')
GO

INSERT INTO Book
VALUES  (1, 'Book 1', '123456789', '6/1/2008', 1),
		(2, 'Book 2', '124356798', '9/12/2009', 2), 
		(3, 'Book 3', '873781927', '4/6/2011', 3), 
		(4, 'Book 4', '826389163', '1/4/2010', 1),
		(5, 'Book 4', '129471352', '12/12/2013', 2)
GO

INSERT INTO BookAuthor
VALUES  (1,1),
		(1,2),
		(2,2),
		(2,3),
		(3,1),
		(3,3),
		(3,4),
		(4,2),
		(4,4),
		(4,5),
		(5,4)
GO