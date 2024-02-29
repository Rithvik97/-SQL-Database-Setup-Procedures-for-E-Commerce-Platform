# SQL Database Setup and Procedures for E-Commerce Platform

This documentation outlines the setup of the database and the procedures used for managing products, inventory, consumer details, purchases, and shipping for an e-commerce platform.

## Structural business rules

### Entities:

Seller, Product, Category, Warehouse, Inventory, Shipping, Purchase, Consumer, Shipping Speed.

### Business Rules:

1.	A seller can sell multiple products and a product can be sold by one or more sellers. 
Many to Many Relation
2.	A category can have multiple products, but a product can belong to only one category.
One to Many Relation
3.	A seller can handle multiple categories and a category can have multiple sellers.
Many to Many Relation
4.	A seller can send products to Amazon warehouse and Amazon warehouse can receive products from one or more seller.
One to Many Relation
5.	A consumer can create one account and an account can be related to one consumer.
One to One Relation
6.	A consumer can have one or more orders but a order can be associated with only one consumer.
One to Many Relation
7.	A seller inventory can have one or more products and a product can be in one or more seller’s inventory.
Many to Many Relation
8.	A single shipment can have one or more order, but a single order can be associated with one shipment.
One to Many Relation
9.	A consumer can have a single default address and an address can have on or more consumer.
One to Many Relation

## Conceptual ERD 

This conceptual Entity-Relationship Diagram (ERD) illustrates the database schema for a retail system. It depicts the relationships between entities like 'Product', 'Category', 'Inventory', and 'Warehouse', which are involved in the stocking and categorization of items. 'Seller' and 'Consumer' entities represent the users of the system, detailing their personal information and their interactions through 'Purchase' and 'Shipping' entities. The 'Shipping' entity is further linked to 'Shipping_Speed', indicating the system can track the speed or type of delivery for purchases. This ERD is typical for e-commerce systems, where various entities must interact cohesively to manage inventory, process sales, and handle shipping logistics.

<img width="468" alt="image" src="https://github.com/Rithvik97/Database-Setup-and-Procedures-for-E-Commerce-Platform/assets/145782290/44af0440-e737-480d-9cdc-e120d4b67025">

## Logical ERD

The logical ERD outlines the data model of an e-commerce or retail management system, highlighting the relationships between its main entities: 'Category', 'Product', 'Inventory', 'Warehouse', 'Seller', 'Consumer', 'Purchase', 'Shipping', and 'Shipping_Speed'. Each entity is defined by primary keys (PK) and foreign keys (FK) that establish the relational structure, such as products being linked to categories, inventory items to products and warehouses, and purchases connecting consumers, inventory, and shipping details. The ERD serves as a blueprint for the database design, ensuring that the system can effectively manage product listings, inventory tracking, sales processes, and the delivery of items, with the inclusion of shipping speed options.

<img width="468" alt="image" src="https://github.com/Rithvik97/-SQL-Database-Setup-Procedures-for-E-Commerce-Platform/assets/145782290/1505bd23-f4fa-4f4f-bfd7-351eda6d3d15">



## Database Schema


### Tables

- **Seller**: Contains details about the sellers on the platform.
- **Category**: Defines various product categories.
- **Product**: Stores products, including details like name, description, price, category, and the seller.
- **Consumer**: Holds consumer information.
- **Warehouse**: Lists warehouses where products are stored.
- **Inventory**: Manages stock levels of products in various warehouses.
- **Purchase**: Records purchases made by consumers.
- **Shipping_Speed**: Defines different shipping speeds available.
- **Shipping**: Tracks the shipping status of purchases.

### Sequences

- **inventory_id_seq**: Used to generate unique IDs for inventory items.

  ```sql
  CREATE SEQUENCE inventory_id_seq  
    START WITH 1  
    INCREMENT BY 1;
  
- **product_seq**: Used to generate unique IDs for products.

  ```sql
  CREATE SEQUENCE product_seq  
    START WITH 1  
    INCREMENT BY 1;

## Procedures

### Product Management

- **newproduct**: Adds a new product to the database, assigning it a unique product ID from `product_seq`.

```sql
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
```
### Inventory Management

- **receive_product**: Records the reception of products into the inventory, assigning a unique inventory ID from `inventory_id_seq`.

```sql
  CREATE OR REPLACE PROCEDURE receive_product ( 
      p_product_quantity IN NUMBER, 
      p_product_name IN VARCHAR2, 
      p_seller_id IN NUMBER, 
      p_product_id IN NUMBER, 
      p_warehouse_id IN NUMBER) 
  IS 
  BEGIN 
      INSERT INTO Inventory (inventory_id, product_quantity, product_name, seller_id, product_id, warehouse_id) 
      VALUES (inventory_id_seq.NEXTVAL, p_product_quantity, p_product_name, p_seller_id, p_product_id, p_warehouse_id); 
      COMMIT; 
  END;
  /
```

### Consumer Management

- **add_new_consumer**: Adds a new consumer to the database.
```sql
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
```
### Purchase Management

- **purchase_product**: Records the purchase of a product by a consumer.
```sql
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
```
### Shipping Management
- **ship_order**: Records the shipping of an order, marking it with a status (e.g., 'Shipped').

```sql
CREATE OR REPLACE PROCEDURE ship_order(
    p_shipping_id IN INT, 
    p_status IN VARCHAR2, 
    p_purchase_id IN INT,
    p_speed_id IN INT) AS 
BEGIN 
  INSERT INTO Shipping(shipping_id, status, purchase_id, speed_id) 
  VALUES (p_shipping_id, p_status, p_purchase_id, p_speed_id); 
  COMMIT; 
END;
/
```

## Example Data Insertion

Insertion commands for warehouses, shipping speeds, categories, sellers, and some sample products are provided to populate the database initially.

```sql
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
```

## Conclusion

This comprehensive documentation provides a detailed overview of the database setup and procedures essential for managing an e-commerce platform. It outlines the structural business rules, entity relationships, and the conceptual and logical Entity-Relationship Diagrams (ERDs) to visualize the database schema. The schema includes tables for sellers, categories, products, consumers, warehouses, inventory, purchases, shipping speeds, and shipping details. Additionally, sequences for generating unique IDs and SQL procedures for product, inventory, consumer, purchase, and shipping management are meticulously defined. This setup ensures efficient handling of products, inventory tracking, consumer information, purchase processing, and shipping logistics, forming a robust foundation for e-commerce operations.







