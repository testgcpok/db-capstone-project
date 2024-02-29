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
        
        