CREATE DATABASE normalisation_lab;
USE normalisation_lab;

CREATE TABLE OrderData(
OrderID INT,
CustomerName VARCHAR(50),
Phone VARCHAR(15),
Address VARCHAR(100),
ProductName VARCHAR(50),
Category VARCHAR(30),
SupplierName VARCHAR(50),
SupplierPhone VARCHAR(15),
Quantity INT,
Price DECIMAL(10,2)
);

INSERT INTO OrderData (
    OrderID, CustomerName, Phone, Address, ProductName, Category, SupplierName, SupplierPhone, Quantity, Price
) VALUES 
(1, 'John Doe', '555-0123', '123 Maple St, Springfield', 'Wireless Mouse', 'Electronics', 'TechSupplies Inc.', '555-9876', 2, 25.99),

(2, 'Jane Smith', '555-0456', '456 Oak Ave, Metropolis', 'Ergonomic Chair', 'Office Furniture', 'Comfort Seating Co.', '555-5432', 1, 199.50),

(3, 'Robert Johnson', '555-0789', '789 Pine Rd, Gotham', 'Mechanical Keyboard', 'Electronics', 'TechSupplies Inc.', '555-9876', 1, 89.99),

(4, 'Emily Davis', '555-0321', '321 Elm St, Star City', 'Gel Pens (12-Pack)', 'Stationery', 'Office Essentials', '555-1122', 5, 8.50),

(5, 'Michael Brown', '555-0654', '654 Cedar Ln, Central City', 'LED Desk Lamp', 'Office Furniture', 'Lumina Lighting', '555-3344', 3, 45.00);

select * from orderdata;

CREATE TABLE Customers(
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(50),
Phone VARCHAR(15),
Address VARCHAR(100)
);

INSERT INTO Customers VALUES
(101,'Amit Sharma','9876543210','Delhi'),
(102,'Priya Singh','9876543211','Mumbai'),
(103,'Rahul Verma','9876543212','Delhi'),
(104,'Sneha Gupta','9876543213','Pune'),
(105,'Arjun Mehta','9876543214','Bangalore'),
(106,'Neha Kapoor','9876543215','Delhi'),
(107,'Rohan Das','9876543216','Kolkata'),
(108,'Simran Kaur','9876543217','Chandigarh'),
(109,'Anjali Roy','9876543218','Mumbai'),
(110,'Vikas Yadav','9876543219','Lucknow'),
(111,'Karan Malhotra','9876543220','Delhi'),
(112,'Pooja Jain','9876543221','Jaipur'),
(113,'Harsh Kumar','9876543222','Delhi'),
(114,'Nikita Sharma','9876543223','Mumbai');


CREATE TABLE Suppliers(
SupplierID INT PRIMARY KEY,
SupplierName VARCHAR(50),
SupplierPhone VARCHAR(15)
);

INSERT INTO Suppliers VALUES
(1,'TechWorld','9991111111'),
(2,'HomeEssentials','9991111112'),
(3,'FashionHub','9991111113'),
(4,'FreshFoods','9991111114'),
(5,'OfficeMart','9991111115'),
(6,'Global Suppliers','9991111116'),
(7,'Future Electronics','9991111117'),
(8,'Dream Traders','9991111118');

CREATE TABLE Products(
ProductID INT PRIMARY KEY,
ProductName VARCHAR(50),
Category VARCHAR(30),
Price DECIMAL(10,2),
SupplierID INT,
FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

INSERT INTO Products VALUES
(201,'Laptop','Electronics',55000,1),
(202,'Mouse','Electronics',800,1),
(203,'Keyboard','Electronics',1500,1),
(204,'Office Chair','Furniture',6500,2),
(205,'Dining Table','Furniture',12000,2),
(206,'T-Shirt','Clothing',700,3),
(207,'Jeans','Clothing',1500,3),
(208,'Rice Bag','Groceries',1800,4),
(209,'Cooking Oil','Groceries',1800,4),
(210,'Notebook','Stationery',120,5),
(211,'Printer','Electronics',12000,5),
(212,'Monitor','Electronics',15000,7),
(213,'Headphones','Electronics',2500,7),
(214,'Bookshelf','Furniture',6500,2),
(215,'Pen Drive','Electronics',800,1);

CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders VALUES
(1001,101),
(1002,102),
(1003,101),
(1004,103),
(1005,104),
(1006,105),
(1007,106),
(1008,107),
(1009,108),
(1010,109),
(1011,105),
(1012,110);

CREATE TABLE OrderDetails(
OrderID INT,
ProductID INT,
Quantity INT,
PRIMARY KEY(OrderID,ProductID),
FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails VALUES

(1001,201,1),
(1001,202,2),

(1002,203,1),
(1002,206,3),

(1003,204,1),
(1003,203,5),

(1004,205,1),
(1004,207,2),

(1005,208,4),
(1005,209,3),

(1006,201,1),
(1006,213,2),

(1007,202,4),
(1007,211,1),

(1008,203,2),

(1009,212,1),
(1009,206,2),

(1010,207,3),
(1010,208,2),

(1011,201,1),
(1011,205,1),

(1012,202,3),
(1012,209,4);



select o.OrderID, c.*
from Orders as o
INNER JOIN Customers as c
on o.CustomerID = c.CustomerID;

select o.OrderID , p.*
from orderdetails as o
Inner JOin products as p
on o.productid = p.productID;


select s.suppliername , p.productname
from products as p
Inner join suppliers as s
on s.supplierid = p.supplierid;


select * from orderdetails;

SELECT 
    o.OrderID,
    c.CustomerName,
    c.Phone,
    c.Address,
    p.ProductName,
    p.Category,
    s.SupplierName,
    s.SupplierPhone,
    od.Quantity,
    p.Price,
    (od.Quantity * p.Price) AS TotalAmount
FROM Orders o
JOIN Customers c
    ON o.CustomerID = c.CustomerID
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
JOIN Products p
    ON od.ProductID = p.ProductID
JOIN Suppliers s
    ON p.SupplierID = s.SupplierID
ORDER BY o.OrderID;



SELECT DISTINCT
c.CustomerID,
c.CustomerName,
c.Phone,
c.Address
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;


SELECT
c.CustomerID,
c.CustomerName,
c.Phone,
c.Address
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL;

select o.orderid , c.customername
from orders as o
join customers as c
on o.CustomerID = c.CustomerID;

select p.productname , p.price , s.suppliername
from products as p
join suppliers as s
on p.SupplierID = s.SupplierID;

select p.productname , s.suppliername
from products as p
join suppliers as s
on p.SupplierID = s.SupplierID
where Category = "Electronics";

SELECT DISTINCT
c.CustomerName
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerName ASC;

select p.productname , s.suppliername
from products as p
inner join suppliers as s
on p.SupplierID = s.SupplierID
order by s.SupplierName ASC;