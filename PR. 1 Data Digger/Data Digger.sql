-- SQLBook: Markup

This cell have Basic of Database Creationand  And Tabel Creation.
-- SQLBook: Markup
Table 1 : Customers Table
-- SQLBook: Code

CREATE DATABASE IF NOT EXISTS Data_Digger;

CREATE TABLE customers(
    Customer_id INT PRIMARY KEY,
    Name VARCHAR(15),
    Email VARCHAR(30),
    Address VARCHAR(100)
);

INSERT INTO customers VALUES
(1001 , "Sumit" , "smit@yahoo.com" , "Silver complex - Amroli" ),
(1002 , "Asha" , "ash@yahoo.com" , "OM Park - Katargam"),
(1003 , "Nisha" , "nishu@yahoo.com" , "Jeel Park - Varyav" ),
(1004 , "Ajay" , "ajay@yahoo.com" , "Gopinath soc - Katargam" ),
(1005 , "Parth" , "parth@yahoo.com" , "Mohandeep soc - Ambatlavdi" ); 
-- SQLBook: Markup
This cell have Queries

1. Retrieve all customer details.
2. Update a customer's address.
3. Delete a customer using their CustomerID.
4. Display all customers whose name is 'Sumit'.
-- SQLBook: Markup
1 Query : Retrieve all customer details.
-- SQLBook: Code
SELECT * FROM customers;
-- SQLBook: Markup
2 Query : Update a customer's address. 
-- SQLBook: Code
UPDATE Customers SET Address = 'Noida' WHERE Customer_id = 1001;
-- SQLBook: Markup
3 Query : Delete a customer using their CustomerID.
-- SQLBook: Code
DELETE FROM Customers WHERE Customer_id = 1005;
-- SQLBook: Markup
4 Query : Display all customers whose name is 'Sumit'.
-- SQLBook: Code
SELECT * FROM Customers WHERE Name = "Sumit";
-- SQLBook: Markup
Table 2 : Order Table
-- SQLBook: Code
CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    customer_id VARCHAR(50),
    order_date DATE,
    total_amount DECIMAL
);
-- SQLBook: Markup
1. Insert at least 5 sample orders into the Orders table.
2. Retrieve all orders made by a specific customer.
3. Update an order's total amount.
4. Delete an order using its OrderlD.
5. Retrieve orders placed in the last 30 days.
6. Retrieve the highest, lowest, and average order amount using aggregate functions.
-- SQLBook: Markup
Query 1 : Insert at least 5 sample orders into the Orders table.
-- SQLBook: Code
INSERT INTO orders VALUES
(101 , 1001 , '2026-06-02' , 20000),
(102 , 1002 , '2026-06-05' , 25000),
(103 , 1003 , '2026-06-07' , 22000),
(104 , 1004 , '2026-06-10' , 30000),
(105 , 1005 , '2026-06-15' , 35000);

-- SQLBook: Markup
Query : Retrieve all orders made by a specific customer
-- SQLBook: Code
SELECT * FROM orders WHERE customer_id = '1001';
-- SQLBook: Markup
Query : Update an order's total amount.
-- SQLBook: Code
UPDATE Orders SET total_amount = 30000 WHERE order_id = 2;

-- SQLBook: Markup
Query :  Delete an order using its OrderID.
-- SQLBook: Code
DELETE FROM orders WHERE order_id = '101';
-- SQLBook: Markup
Query : Retrieve orders placed in the last 30 days
-- SQLBook: Code
SELECT * FROM orders WHERE order_date >= CURRENT_DATE - INTERVAL 30 DAY;

-- SQLBook: Markup
Query : 
Retrieve the highest, lowest, and average order amount using aggregate functions.
-- SQLBook: Code

  SELECT  MAX(total_amount) AS Highest, MIN(total_amount) AS Lowest, AVG(total_amount) AS Average FROM Orders;
-- SQLBook: Markup
Table 3 : Products Table
-- SQLBook: Code
CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL,
    stock INT
);
-- SQLBook: Markup
1. Insert at least 5 sample products into the Products table.
2. Retrieve all products sorted by price in descending order.
3. Update the price of a specific product.
4. Delete a product if it's out of stock.
5. Retrieve products whose price is between 500 and 20000.
6. Retrieve the most expensive and cheapest product using MAX() and MIN().
-- SQLBook: Markup
Query : Insert at least 5 sample products into the Products table.
-- SQLBook: Code
INSERT INTO Products ( product_id, product_name, price, stock) VALUES
(110 , 'Laptop', 94000, 10),
(120 , 'Mobile', 32000, 15),
(130 , 'Headphones', 2999, 0),
(140 , 'Keyboard', 1100, 20),
(150 , 'Monitor', 15000, 5);

  
-- SQLBook: Markup
Query : Retrieve all products sorted by price in descending order
-- SQLBook: Code
SELECT * FROM products ORDER BY price DESC;
-- SQLBook: Markup
Query : Update the price of a specific product.
-- SQLBook: Code
UPDATE products SET price = 40000 WHERE product_id = '2';
-- SQLBook: Markup
Query : Delete a product if it's out of stock.
-- SQLBook: Code
DELETE FROM products WHERE stock = '0';
-- SQLBook: Markup
Query : Retrieve products whose price is between 500 and 20000.
-- SQLBook: Code
SELECT * FROM products WHERE price >='500' AND Price <='2000';
-- SQLBook: Markup
Query : Retrieve the most expensive and cheapest product using MAX() and MIN().
-- SQLBook: Code
SELECT MAX(price) AS Expensive , MIN(price) AS Cheap  FROM products;
-- SQLBook: Markup
Table 4 : OrderDetails Table
-- SQLBook: Code
CREATE TABLE order_details(
    order_detail_id INT PRIMARY KEY,
    order_id INT ,
    product_id INT,
    quantity INT ,
    sub_total DECIMAL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- SQLBook: Markup
1. Insert at least 5 sample records into the OrderDetails table.
2. Retrieve all order details for a specific order.
3. Calculate the total revenue generated from all orders using SUM().
4. Retrieve the top 3 most ordered products.
5. Count how many times a specific product has been sold using COUNT().
-- SQLBook: Markup
Query : Insert at least 5 sample records into the OrderDetails table.
-- SQLBook: Code
INSERT INTO order_details VALUES
(1, 102, 110, 1, 94000.00),
(2, 102, 120, 2, 64000.00),
(3, 103, 140, 1, 1100.00),
(4, 104, 150, 2, 30000.00),
(5, 105, 110, 1, 94000.00);
-- SQLBook: Markup
Query : Retrieve all order details for a specific order.
-- SQLBook: Code
SELECT * FROM order_details WHERE order_id ='102';
-- SQLBook: Markup
Query : Calculate the total revenue generated from all orders using SUM().
-- SQLBook: Code
SELECT SUM(sub_total) AS Total_Revenue FROM order_details;
-- SQLBook: Markup
Query : Retrieve the top 3 most ordered products.
-- SQLBook: Code
SELECT product_id, SUM(quantity) AS Total_sold FROM order_details
GROUP BY product_id
ORDER BY Total_sold DESC LIMIT 3;

-- SQLBook: Markup
Query : Count how many times a specific product has been sold using COUNT().
-- SQLBook: Code
SELECT COUNT(*) AS total_sales FROM order_details WHERE product_id = '120';
-- SQLBook: Markup
