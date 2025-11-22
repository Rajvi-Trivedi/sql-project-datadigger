CREATE DATABASE datadigger_rajvi;
USE datadigger_rajvi;

CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY ,
    Cname VARCHAR(100) NOT NULL,
    Email VARCHAR(100)  NOT NULL,
    Address VARCHAR(200) NOT NULL
);

INSERT INTO Customers (CustomerID, Cname, Email, Address) VALUES
(201, 'Anita Thakkar', 'anita.thakkar23@example.com', '12 Green Park, Ahmedabad'),
(202, 'Sonal Mehta', 'sonal.m@example.com', '45 River Road, Surat'),
(203, 'Rahul Desai', 'rahul.desai88@example.com', '9 Central Avenue, Vadodara'),
(204, 'Riya Joshi', 'riya.joshi@example.com', '88 Karnavati Main Rd, Ahmedabad'),
(205, 'Vikas Patel', 'vikas.patel@example.com', 'Block B, Infocity, Gandhinagar');

SELECT * FROM Customers;

UPDATE Customers SET Address = 'New VIP Road, Vadodara' WHERE CustomerID = 203;

DELETE FROM Customers WHERE CustomerID = 205;

-- note: searching for Anita (formerly Alice)
SELECT * FROM Customers WHERE Cname = 'Anita Thakkar';

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY, -- manual insertion
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(3001, 201, '2025-10-15', 5500.00),
(3002, 202, '2025-11-01', 1250.50),
(3003, 201, '2025-11-05', 899.00),
(3004, 203, '2025-11-10', 250.00),
(3005, 204, '2025-11-11', 15000.00);

SELECT * FROM Orders WHERE CustomerID = 201;

UPDATE Orders SET TotalAmount = 999.00 WHERE OrderID = 3003;

DELETE FROM Orders WHERE OrderID = 3004;

SELECT * FROM Orders WHERE OrderDate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

SELECT MAX(TotalAmount) AS HighestOrder, MIN(TotalAmount) AS LowestOrder, AVG(TotalAmount) AS AverageOrder FROM Orders;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL
);

INSERT INTO Products (ProductID, ProductName, Price, Stock) VALUES
(5001, 'Gaming Mechanical Keyboard', 4999.00, 15),
(5002, 'Ergonomic Wireless Mouse', 850.00, 40),
(5003, 'USB-C Fast Charge Cable', 399.00, 100),
(5004, 'HD Webcam 1080p', 1899.00, 25),
(5005, 'Portable Bluetooth Speaker', 1299.00, 10);

SELECT * FROM Products ORDER BY Price DESC;

SELECT * FROM Products WHERE Price BETWEEN 500 AND 2000;

UPDATE Products SET Price = 950.00 WHERE ProductID = 5002;

DELETE FROM Products WHERE Stock = 0;

SELECT MAX(Price) AS MostExpensivePrice, MIN(Price) AS CheapestPrice FROM Products;

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY, -- manual insertion
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    SubTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, SubTotal) VALUES
(6001, 3001, 5001, 1, 4999.00),
(6002, 3002, 5002, 2, 1700.00),
(6003, 3001, 5004, 1, 1899.00),
(6004, 3003, 5002, 1, 850.00),
(6005, 3005, 5001, 3, 14997.00);

SELECT * FROM OrderDetails WHERE OrderID = 3001;

SELECT SUM(SubTotal) AS TotalRevenue FROM OrderDetails;

SELECT t1.ProductID, t2.ProductName,
SUM(t1.Quantity) AS TotalQuantitySold FROM OrderDetails
t1 JOIN Products t2 ON t1.ProductID = t2.ProductID
GROUP BY t1.ProductID, t2.ProductName
ORDER BY TotalQuantitySold DESC LIMIT 3;
