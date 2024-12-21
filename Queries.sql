---------------Basic Queries---------------------------

--1. Retrieve all books along with their authors and categories:
SELECT 
    B.BookID, 
    B.Title, 
    A.AuthorName, 
    C.CategoryName
FROM 
    Books B
JOIN 
    Authors A ON B.AuthorID = A.AuthorID
JOIN 
    Categories C ON B.CategoryID = C.CategoryID;

--2. Find books that are out of stock (StockQuantity = 0):

SELECT * FROM Books WHERE StockQuantity=0

---------------Aggregate Functions---------------------------

--3. Find the total revenue generated from all orders:

SELECT 
    SUM(OD.Quantity * B.Price) AS TotalRevenue
FROM 
    OrderDetails OD
JOIN 
    Books B ON OD.BookID = B.BookID;

--4. Get the number of books available in each category:

SELECT 
    C.CategoryName, 
    SUM(B.StockQuantity) AS TotalBooks
FROM 
    Books B
JOIN 
    Categories C ON B.CategoryID = C.CategoryID
GROUP BY 
    C.CategoryName;

----------------------Joins----------------------------

--5. List all orders along with the customer name, order date, book titles, and quantity ordered

SELECT 
    O.OrderID, 
    O.CustomerName, 
    O.OrderDate, 
    B.Title AS BookTitle, 
    OD.Quantity
FROM 
    Orders O
JOIN 
    OrderDetails OD ON O.OrderID = OD.OrderID
JOIN 
    Books B ON OD.BookID = B.BookID;

-------------------Subqueries------------------------------

--6. Find the most expensive book in the Science category

SELECT 
	TOP 1
    Title, 
    Price
FROM 
    Books
WHERE 
    CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'Science')
ORDER BY 
    Price DESC


--7. List customers who have ordered more than 5 books in a single order:

SELECT 
    O.CustomerName
FROM 
    Orders O
JOIN 
    OrderDetails OD ON O.OrderID = OD.OrderID
GROUP BY 
    O.CustomerName, O.OrderID
HAVING 
    SUM(OD.Quantity) > 5;


----------------------------Advanced Queries--------------------------

--8. Identify authors whose books have generated revenue exceeding $500:

SELECT 
    A.AuthorName, 
    SUM(OD.Quantity * B.Price) AS Revenue
FROM 
    OrderDetails OD
JOIN 
    Books B ON OD.BookID = B.BookID
JOIN 
    Authors A ON B.AuthorID = A.AuthorID
GROUP BY 
    A.AuthorID, A.AuthorName
HAVING 
    SUM(OD.Quantity * B.Price) > 500;


--9. Calculate the stock value (price × stock quantity) of all books and list the top 3 books by stock value:

SELECT TOP 3
    Title, 
    Price * StockQuantity AS StockValue
FROM 
    Books
ORDER BY 
    StockValue DESC

-----------------------Stored Procedures--------------------------

--10. Write a stored procedure GetBooksByAuthor that accepts an AuthorID as input and returns all books by that author:

CREATE PROCEDURE GetBooksByAuthor
    @AuthorID INT
AS
BEGIN
    SELECT 
        BookID, 
        Title, 
        Price, 
        StockQuantity
    FROM 
        Books
    WHERE 
        AuthorID = @AuthorID;
END;

------------------------------Views---------------------------

--11. Create a view TopSellingBooks that lists the top 5 books based on total quantity sold

CREATE VIEW TopSellingBooks AS
SELECT TOP 5
    B.BookID, 
    B.Title, 
    SUM(OD.Quantity) AS TotalSold
FROM 
    OrderDetails OD
JOIN 
    Books B ON OD.BookID = B.BookID
GROUP BY 
    B.BookID, B.Title
ORDER BY 
    TotalSold DESC;

-------------------------Indexes-------------------

--Create an index on the Books table for the Title column to optimize search performance

CREATE INDEX IDX_Books_Title ON Books(Title);











