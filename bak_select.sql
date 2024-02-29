SELECT 
    c.CustomerID,
    c.FullName,
    o.OrdersID,
    o.TotalCost,
    m.MenuName,
    mi.CourseName,
    mi.StarterName
FROM 
    Customers c
INNER JOIN 
    Orders o ON c.CustomerID = o.CustomerID
INNER JOIN 
    Menus m ON o.MenulD = m.MenulD
INNER JOIN 
    Menultems mi ON m.MenultemsID = mi.MenultemsID
WHERE 
    o.TotalCost > 150
ORDER BY 
    o.TotalCost ASC;
    
    

SELECT 
    MenuName
FROM 
    Menus
WHERE 
    MenulD = ANY (
        SELECT 
            MenulD
        FROM 
            Orders
        GROUP BY 
            MenulD
        HAVING 
            COUNT(*) > 2
    );


CREATE VIEW OrdersView AS
    SELECT 
        OrdersID, Quantity, TotalCost AS Cost
    FROM
        Orders
    WHERE
        Quantity > 2;
        
        
        
-- Create Table
CREATE TABLE Orders (
    Row_Number INT,
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Delivery_Date DATE,
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(255),
    City VARCHAR(255),
    Country VARCHAR(255),
    Postal_Code VARCHAR(20),
    Country_Code VARCHAR(5),
    Cost DECIMAL(10,2),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Delivery_Cost DECIMAL(10,2),
    Course_Name VARCHAR(255),
    Cuisine_Name VARCHAR(255),
    Starter_Name VARCHAR(255),
    Dessert_Name VARCHAR(255),
    Drink VARCHAR(255),
    Sides VARCHAR(255)
);

-- Insert Data from CSV
LOAD DATA INFILE 'path_to_your_csv_file.csv'
INTO TABLE Orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Row_Number, Order_ID, @Order_Date, @Delivery_Date, Customer_ID, Customer_Name, City, Country, Postal_Code, Country_Code, Cost, Sales, Quantity, Discount, Delivery_Cost, Course_Name, Cuisine_Name, Starter_Name, Dessert_Name, Drink, Sides)
SET Order_Date = STR_TO_DATE(@Order_Date, '%m/%d/%y'),
    Delivery_Date = STR_TO_DATE(@Delivery_Date, '%m/%d/%y');
    
    
    
    SQL
CREATE TABLE `order_data` (
  `row_number` INT NOT NULL,
  `order_id` VARCHAR(255) NOT NULL,
  `order_date` DATE NOT NULL,
  `delivery_date` DATE NOT NULL,
  `customer_id` VARCHAR(255) NOT NULL,
  `customer_name` VARCHAR(255) NOT NULL,
  `city` VARCHAR(255) NOT NULL,
  `country` VARCHAR(255) NOT NULL,
  `postal_code` VARCHAR(255) NOT NULL,
  `country_code` VARCHAR(255) NOT NULL,
  `cost` DECIMAL(10,2) NOT NULL,
  `sales` DECIMAL(10,2) NOT NULL,
  `quantity` INT NOT NULL,
  `discount` DECIMAL(10,2) NOT NULL,
  `delivery_cost` DECIMAL(10,2) NOT NULL,
  `course_name` VARCHAR(255) NOT NULL,
  `cuisine_name` VARCHAR(255) NOT NULL,
  `starter_name` VARCHAR(255) NOT NULL,
  `desert_name` VARCHAR(255) NOT NULL,
  `drink` VARCHAR(255) NOT NULL,
  `sides` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`row_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


LOAD DATA LOCAL INFILE 'path/to/your/data.csv'
INTO TABLE order_data
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;