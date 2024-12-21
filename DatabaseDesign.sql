CREATE DATABASE BookStoreDB

USE BookStoreDB

CREATE TABLE Authors(
	AuthorID INT PRIMARY KEY,
	AuthorName VARCHAR(100)
)

CREATE TABLE Categories(
	CategoryID INT PRIMARY KEY,
	CategoryName VARCHAR(50)
)

CREATE TABLE Books(
	BookID INT PRIMARY KEY,
	Title Varchar(100),
	AuthorID INT,
	CategoryID INT,
	Price Decimal(10,2),
	StockQuantity INT,
	FOREIGN KEY(AuthorID) REFERENCES Authors(AuthorID),
	FOREIGN KEY(CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders(
	OrderId INT PRIMARY KEY,
	CustomerName Varchar(100),
	OrderDate DATE
)

CREATE TABLE OrderDetails(
	OrderDetailID INT PRIMARY KEY,
	OrderID INT,
	BookID INT,
	Quantity INT
	FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY(BookID) REFERENCES Books(BookID)
);





