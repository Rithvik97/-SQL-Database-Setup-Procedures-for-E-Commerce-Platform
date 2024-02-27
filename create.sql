CREATE TABLE Seller (  
    seller_id INT PRIMARY KEY,  
    seller_name VARCHAR(255) NOT NULL,  
    email VARCHAR(255) NOT NULL,  
    phone VARCHAR(20) NOT NULL,  
    address VARCHAR(255) NOT NULL  
);

CREATE TABLE Category (  
    category_id INT PRIMARY KEY,  
    category_name VARCHAR(255) NOT NULL,  
    description VARCHAR(255) NOT NULL  
);

CREATE TABLE Product (  
    product_id INT NOT NULL PRIMARY KEY,  
    product_name VARCHAR(255) NOT NULL,  
    product_description VARCHAR(255) NOT NULL,  
    product_price DECIMAL(10, 2) NOT NULL,  
    category_id INT NOT NULL,  
    seller_id INT NOT NULL, -- add seller_id column  
    FOREIGN KEY (category_id) REFERENCES Category(category_id),  
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id) -- add foreign key constraint  
);

CREATE TABLE Consumer (  
    consumer_id INT PRIMARY KEY,  
    first_name VARCHAR(255) NOT NULL,  
    last_name VARCHAR(255) NOT NULL, 
    email VARCHAR(255) NOT NULL, 
    phone_number VARCHAR(20) NOT NULL, 
    address VARCHAR(255) NOT NULL);

CREATE TABLE Warehouse (  
    warehouse_id INT PRIMARY KEY,  
    warehouse_name VARCHAR(255) NOT NULL);

CREATE TABLE Inventory (  
	inventory_id INT NOT NULL PRIMARY KEY,  
    product_quantity INT NOT NULL, 
    product_name VARCHAR(255) NOT NULL,  
    seller_id INT NOT NULL,  
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id), 
	product_id INT NOT NULL,  
    FOREIGN KEY (product_id) REFERENCES Product(product_id), 
	warehouse_id INT NOT NULL,  
    FOREIGN KEY (warehouse_id) REFERENCES Warehouse(warehouse_id));

CREATE SEQUENCE inventory_id_seq  
    START WITH 1  
    INCREMENT BY 1;

CREATE TABLE Purchase (  
	purchase_id INT NOT NULL PRIMARY KEY,  
    p_quantity INT NOT NULL, 
    consumer_id INT NOT NULL,  
    FOREIGN KEY (consumer_id) REFERENCES Consumer(consumer_id), 
	inventory_id INT NOT NULL,  
    FOREIGN KEY (inventory_id) REFERENCES Inventory(inventory_id));

CREATE TABLE Shipping_Speed (  
	speed_id INT NOT NULL PRIMARY KEY,  
    speed_description VARCHAR(20) NOT NULL);


CREATE TABLE Shipping (  
	shipping_id INT NOT NULL PRIMARY KEY,  
    status VARCHAR(20) NOT NULL, 
    purchase_id INT NOT NULL,  
    FOREIGN KEY (purchase_id) REFERENCES Purchase(purchase_id), 
    speed_id INT NOT NULL,  
    FOREIGN KEY (speed_id) REFERENCES Shipping_Speed(speed_id) 
);


CREATE SEQUENCE product_seq  
    START WITH 1  
    INCREMENT BY 1;

CREATE OR REPLACE PROCEDURE newproduct (   
    p_product_name IN VARCHAR,   
    p_description IN VARCHAR,   
    p_product_price IN DECIMAL,   
    p_category_id IN NUMBER,   
    p_seller_id IN NUMBER)  
IS   
    v_product_id NUMBER;  
BEGIN  
    SELECT product_seq.NEXTVAL INTO v_product_id FROM dual;  
	INSERT INTO product (product_id, product_name, product_description, product_price, category_id, seller_id)  
	VALUES (v_product_id, p_product_name, p_description, p_product_price, p_category_id, p_seller_id);  
	COMMIT;  
END;
/




CREATE OR REPLACE PROCEDURE receive_product ( 
    p_product_quantity IN NUMBER, 
    p_product_name IN VARCHAR2, 
    p_seller_id IN NUMBER, 
    p_product_id IN NUMBER, 
    p_warehouse_id IN NUMBER 
) 
IS 
BEGIN 
    INSERT INTO Inventory (inventory_id, product_quantity, product_name, seller_id, product_id, warehouse_id) 
    VALUES (inventory_id_seq.NEXTVAL, p_product_quantity, p_product_name, p_seller_id, p_product_id, p_warehouse_id); 
    COMMIT; 
END;
/




CREATE OR REPLACE PROCEDURE add_new_consumer ( 
    p_consumer_id IN INT, 
    p_first_name IN VARCHAR2, 
    p_last_name IN VARCHAR2, 
    p_email IN VARCHAR2, 
    p_phone_number IN VARCHAR2, 
    p_address IN VARCHAR2 
) 
AS 
BEGIN 
    INSERT INTO Consumer (consumer_id, first_name, last_name, email, phone_number, address) 
    VALUES (p_consumer_id, p_first_name, p_last_name, p_email, p_phone_number, p_address); 
    COMMIT; 
END;
/



CREATE OR REPLACE PROCEDURE purchase_product( 
    purchase_id IN INT,  
    p_quantity IN INT,  
    consumer_id IN INT,  
    inventory_id IN INT 
) 
IS 
BEGIN 
    INSERT INTO Purchase (purchase_id, p_quantity, consumer_id, inventory_id) 
    VALUES (purchase_id, p_quantity, consumer_id, inventory_id); 
END; 

/


CREATE OR REPLACE PROCEDURE ship_order(p_shipping_id IN INT, p_status IN VARCHAR2, p_purchase_id IN INT, p_speed_id IN INT) AS 
BEGIN 
  INSERT INTO Shipping(shipping_id, status, purchase_id, speed_id) 
  VALUES (p_shipping_id, p_status, p_purchase_id, p_speed_id); 
  COMMIT; 
END;
/