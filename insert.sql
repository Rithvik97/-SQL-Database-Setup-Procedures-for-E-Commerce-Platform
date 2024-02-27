INSERT INTO Warehouse (warehouse_id, warehouse_name) 
VALUES (1, 'Amazon Warehouse 1');

INSERT INTO Warehouse (warehouse_id, warehouse_name) 
VALUES (2, 'Amazon Warehouse 2');

INSERT INTO Warehouse (warehouse_id, warehouse_name) 
VALUES (3, 'Amazon Warehouse 3');

INSERT INTO Warehouse (warehouse_id, warehouse_name) 
VALUES (4, 'Amazon Warehouse 4');

INSERT INTO Warehouse (warehouse_id, warehouse_name) 
VALUES (5, 'Amazon Warehouse 5');


INSERT INTO Shipping_Speed (speed_id, speed_description) 
VALUES (1, 'Standard');

INSERT INTO Shipping_Speed (speed_id, speed_description) 
VALUES (2, 'Express Delivery');


INSERT INTO Category (category_id, category_name, description) 
VALUES (1, 'Computer', 'Computers and related equipment');

INSERT INTO Category (category_id, category_name, description) 
VALUES (2, 'Electronic', 'Electronic devices and gadgets');

INSERT INTO Category (category_id, category_name, description) 
VALUES (3, 'Furniture', 'Indoor and outdoor furniture');

INSERT INTO Category (category_id, category_name, description) 
VALUES (4, 'Clothing', 'Clothing and fashion accessories');

INSERT INTO Category (category_id, category_name, description) 
VALUES (5, 'Toys', 'Toys and games for all ages');

INSERT INTO Seller (seller_id, seller_name, email, phone, address)  
VALUES (1, 'John Doe', 'johndoe@example.com', '555-1234', '123 Main St');

INSERT INTO Seller (seller_id, seller_name, email, phone, address)  
VALUES (2, 'Jane Smith', 'janesmith@example.com', '555-5678', '456 Oak Ave');

INSERT INTO Seller (seller_id, seller_name, email, phone, address)  
VALUES (3, 'Bob Johnson', 'bjohnson@example.com', '555-9012', '789 Elm St');

INSERT INTO Seller (seller_id, seller_name, email, phone, address)  
VALUES (4, 'Sally Williams', 'swilliams@example.com', '555-3456', '321 Pine St');

INSERT INTO Seller (seller_id, seller_name, email, phone, address)  
VALUES (5, 'Mike Brown', 'mbrown@example.com', '555-7890', '654 Maple Ave');


INSERT INTO Product (product_id, product_name, product_description, product_price, category_id, seller_id) 
VALUES (3, 'HP Pavilion Gaming Laptop', 'A powerful gaming laptop with NVIDIA GeForce GTX 1650 graphics', 899.99, 1, 1);

INSERT INTO Product (product_id, product_name, product_description, product_price, category_id, seller_id) 
VALUES (4, 'Samsung Galaxy Watch 3', 'A stylish and advanced smartwatch with LTE connectivity and health monitoring features', 399.99, 2, 2);

INSERT INTO Product (product_id, product_name, product_description, product_price, category_id, seller_id) 
VALUES (5, 'IKEA KALLAX Shelf Unit', 'A versatile and customizable shelving unit with 4 compartments', 69.99, 3, 3);

INSERT INTO Product (product_id, product_name, product_description, product_price, category_id, seller_id) 
VALUES (6, 'Adidas Ultraboost 21 Shoes', 'A pair of high-performance running shoes with responsive cushioning and energy return', 179.99, 4, 4);

INSERT INTO Product (product_id, product_name, product_description, product_price, category_id, seller_id) 
VALUES (7, 'LEGO Star Wars Death Star Set', 'An epic 4016-piece set featuring the iconic Death Star from Star Wars', 499.99, 5, 5);

INSERT INTO Product (product_id, product_name, product_description, product_price, category_id, seller_id) 
VALUES (8, 'Sony PlayStation 5 Console', 'The latest and greatest gaming console from Sony with lightning-fast loading times and stunning graphics', 499.99, 1, 2);

INSERT INTO Product (product_id, product_name, product_description, product_price, category_id, seller_id) 
VALUES (9, 'Apple AirPods Pro', 'Premium wireless earbuds with active noise cancellation and spatial audio', 249.99, 2, 3);

INSERT INTO Product (product_id, product_name, product_description, product_price, category_id, seller_id) 
VALUES (10, 'Logitech MX Master 3 Mouse', 'An advanced wireless mouse with a customizable scroll wheel and fast charging', 99.99, 1, 4);

INSERT INTO Product (product_id, product_name, product_description, product_price, category_id, seller_id) 
VALUES (11, 'IKEA MALM Bed Frame', 'A sleek and modern bed frame with built-in storage and a headboard', 29, 3, 5);

INSERT INTO Product (product_id, product_name, product_description, product_price, category_id, seller_id) 
VALUES (13, 'DJI Mavic 3 Drone', 'A high-end drone with 4K camera and obstacle avoidance technology', 29, 2, 3);