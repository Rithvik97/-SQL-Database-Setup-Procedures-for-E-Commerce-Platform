# Database Setup and Procedures for E-Commerce Platform

This documentation outlines the setup of the database and the procedures used for managing products, inventory, consumer details, purchases, and shipping for an e-commerce platform.

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
- **product_seq**: Used to generate unique IDs for products.

## Procedures

### Product Management

- **newproduct**: Adds a new product to the database, assigning it a unique product ID from `product_seq`.

### Inventory Management

- **receive_product**: Records the reception of products into the inventory, assigning a unique inventory ID from `inventory_id_seq`.

### Consumer Management

- **add_new_consumer**: Adds a new consumer to the database.

### Purchase Management

- **purchase_product**: Records the purchase of a product by a consumer.

### Shipping Management

- **ship_order**: Records the shipping of an order, marking it with a status (e.g., 'Shipped').

## Example Data Insertion

Insertion commands for warehouses, shipping speeds, categories, sellers, and some sample products are provided to populate the database initially.

## Usage

To use these procedures, ensure your database user has the necessary permissions to execute them. For example, to add a new product, you would execute the `newproduct` procedure with the appropriate parameters for the product name, description, price, category ID, and seller ID.


