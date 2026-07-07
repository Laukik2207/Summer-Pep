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

CREATE TABLE Customers(
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(50),
Phone VARCHAR(15),
Address VARCHAR(100)
);

INSERT INTO Customers (CustomerID, CustomerName, Phone, Address) VALUES
(1001, 'John Doe', '555-0123', '123 Maple St, Springfield'),
(1002, 'Jane Smith', '555-0456', '456 Oak Ave, Metropolis'),
(1003, 'Robert Johnson', '555-0789', '789 Pine Rd, Gotham'),
(1004, 'Emily Davis', '555-0321', '321 Elm St, Star City'),
(1005, 'Michael Brown', '555-0654', '654 Cedar Ln, Central City');

CREATE TABLE Suppliers(
SupplierID INT PRIMARY KEY,
SupplierName VARCHAR(50),
SupplierPhone VARCHAR(15)
);

INSERT INTO Suppliers (SupplierID, SupplierName, SupplierPhone) VALUES
(1, 'TechSupplies Inc.', '555-9876'),
(2, 'Comfort Seating Co.', '555-5432'),
(3, 'Office Essentials', '555-1122'),
(4, 'Lumina Lighting', '555-3344'),
(5, 'MegaCorp Electronics', '555-9999');

CREATE TABLE Products(
ProductID INT PRIMARY KEY,
ProductName VARCHAR(50),
Category VARCHAR(30),
Price DECIMAL(10,2),
SupplierID INT,
FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

INSERT INTO Products (ProductID, ProductName, Category, Price, SupplierID) VALUES
(101, 'Wireless Mouse', 'Electronics', 25.99, 1),
(102, 'Ergonomic Chair', 'Office Furniture', 199.50, 2),
(103, 'Mechanical Keyboard', 'Electronics', 89.99, 1),
(104, 'Gel Pens (12-Pack)', 'Stationery', 8.50, 3),
(105, 'LED Desk Lamp', 'Office Furniture', 45.00, 4);

CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID) VALUES
(5001, 1001),
(5002, 1002),
(5003, 1003),
(5004, 1004),
(5005, 1005);

CREATE TABLE OrderDetails(
OrderID INT,
ProductID INT,
Quantity INT,
PRIMARY KEY(OrderID,ProductID),
FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(5001, 101, 2),
(5002, 102, 1),
(5003, 103, 1),
(5004, 104, 5),
(5005, 105, 3);



select o.OrderID, c.*
from Orders as o
INNER JOIN Customers as c
on o.CustomerID = c.CustomerID;

select o.OrderID , p.*
from orderdetails as o
Inner JOin products as p
on o.productid = p.productID;

select c.customername,p.productname,o.quantity 
from orderdetails as o
Inner join products as p
Inner join orders as ord
Inner join customers as c
on o.productid = p.productid and o.orderid = ord.orderid and c.customerid = ord.customerid;


select * from customers;
select * from orders;
select * from orderdetails;
select * from products;

select customers.customername , products.productname , products.price
from products as p
Inner join orders on customers.customerid = orders.customerid
Inner join orderdetails on orders.orderid = orderdetails.orderid
Inner join products on orderdetails.productid = products.productid;