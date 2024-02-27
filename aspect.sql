BEGIN  
    newproduct ('self-driving video camera','follows the person being recorded', 15.11, 2, 2); 
	newproduct ('Holographic keyboard','Emits 3D projection and recognises the key press', 20.99, 1, 3); 
END;
/


SELECT pd.product_name, pd.product_price, c.category_name 
FROM Product pd 
JOIN Category c ON pd.category_id = c.category_id 
WHERE pd.product_price <= 30 
AND c.category_name IN ('Computer', 'Electronic');


BEGIN  
    receive_product(4,'self-driving video camera',1,1,1); 
    receive_product(4,'Holographic keyboard',1,2,1); 
END;
/

SELECT product_name, product_quantity 
FROM Inventory 
WHERE seller_id = 1 
AND product_quantity <= 11;


BEGIN 
    add_new_consumer(1, 'Rithvik', 'Sharma', 'RS@gmail.com', '555-555-5555', '123 Main St');  
	  add_new_consumer(2, 'Sarah', 'Johnson', 'sjohnson@example.com', '555-123-4567', '789 Maple Ave');     
    add_new_consumer(3, 'Ram', 'Sharma', 'rithviksharma@example.com', '555-666-5555', '6732 Cedar St'); 
    add_new_consumer(4, 'Smita', 'Sharma', 'smitasharma@example.com', '555-123-4567', '456 Elm St'); 
    add_new_consumer(5, 'Rahul', 'Sharma', 'rahulsharma@example.com', '555-987-6543', '789 Maple Ave'); 
    add_new_consumer(6, 'Priya', 'Sharma', 'priyasharma@example.com', '555-555-1212', '321 Oak St'); 
    add_new_consumer(7, 'Alok', 'Sharma', 'aloksharma@example.com', '555-555-4321', '555 Pine St'); 
END;
/

SELECT last_name, COUNT(DISTINCT consumer_id) AS account_count 
FROM Consumer 
GROUP BY last_name 
HAVING COUNT(DISTINCT consumer_id) >= 4;


BEGIN 
    purchase_product(1, 1, 1, 1); 
    purchase_product(2, 3, 2, 2); 
    purchase_product(3, 1, 3, 1); 
    purchase_product(4, 1, 4, 1); 
END;
/

SELECT c.first_name, c.last_name, c.address, i.product_name 
FROM Consumer c 
JOIN Purchase p ON c.consumer_id = p.consumer_id 
JOIN Inventory i ON p.inventory_id = i.inventory_id 
WHERE i.product_id IN ( 
    SELECT i2.product_id  
    FROM Inventory i2  
    INNER JOIN Purchase p2 ON i2.inventory_id = p2.inventory_id  
    GROUP BY i2.product_id  
    HAVING COUNT(DISTINCT p2.consumer_id) >= 3 
);


BEGIN 
  ship_order(1, 'Shipped', 1, 1); 
  ship_order(2, 'Shipped', 2, 1); 
END;
/

SELECT COUNT(*) AS num_standard_shipments 
FROM Shipping 
WHERE speed_id = ( 
  SELECT speed_id FROM Shipping_Speed WHERE speed_description = 'Standard' 
);