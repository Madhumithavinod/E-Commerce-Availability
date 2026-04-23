CREATE TABLES

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT DATA

INSERT INTO Customers VALUES
(1,'Arun','arun@gmail.com','Chennai','2023-01-10'),
(2,'Priya','priya@gmail.com','Bangalore','2023-02-15'),
(3,'Rahul','rahul@gmail.com','Mumbai','2023-03-20'),
(4,'Sneha','sneha@gmail.com','Delhi','2023-04-25'),
(5,'Karthik','karthik@gmail.com','Chennai','2023-05-30');

INSERT INTO Products VALUES
(1,'Laptop','Electronics',60000),
(2,'Phone','Electronics',30000),
(3,'Shoes','Fashion',2000),
(4,'Watch','Accessories',5000),
(5,'Bag','Fashion',1500);

INSERT INTO Orders VALUES
(101,1,'2024-01-10',65000),
(102,2,'2024-01-15',32000),
(103,1,'2024-02-05',2000),
(104,3,'2024-02-20',5000),
(105,4,'2024-03-01',1500),
(106,5,'2024-03-10',60000);

INSERT INTO Order_Items VALUES
(1,101,1,1,60000),
(2,101,4,1,5000),
(3,102,2,1,30000),
(4,102,5,1,2000),
(5,103,3,1,2000),
(6,104,4,1,5000),
(7,105,5,1,1500),
(8,106,1,1,60000);
