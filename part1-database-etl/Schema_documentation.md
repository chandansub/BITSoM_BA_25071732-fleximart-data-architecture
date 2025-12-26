Database Schema Documentation – FlexiMart

1. Entity–Relationship Description

1.1 ENTITY: customers  
Purpose: Stores customer information.

Attributes:
• customer_id: Unique identifier for each customer (Primary Key)  
• first_name: Customer’s first name  
• last_name: Customer’s last name  
• email: Customer’s email address (unique)  
• phone: Customer’s contact number  
• city: City where the customer lives  
• registration_date: Date when the customer registered  

Relationships:
• One customer can place many orders  
• One-to-Many relationship with the orders table  

---

1.2 ENTITY: products  
Purpose: Stores information about products.

Attributes:
• product_id: Unique identifier for each product (Primary Key)  
• product_name: Name of the product  
• category: Category of the product  
• price: Selling price  
• stock_quantity: Available stock  

Relationships:
• One product can appear in many order items  

---

1.3 ENTITY: orders  
Purpose: Stores order-level details.

Attributes:
• order_id: Unique identifier for each order (Primary Key)  
• customer_id: Identifier of the customer who placed the order (Foreign Key)  
• order_date: Date of order  
• total_amount: Total order value  
• status: Current order status  

Relationships:
• Each order belongs to one customer  
• One order can contain many order items  

---

1.4 ENTITY: order_items  
Purpose: Stores details of individual items in an order.

Attributes:
• order_item_id: Unique identifier (Primary Key)  
• order_id: Related order identifier (Foreign Key)  
• product_id: Related product identifier (Foreign Key)  
• quantity: Quantity ordered  
• unit_price: Price per unit  
• subtotal: Total price for the item  

---

2. Normalization Explanation (Third Normal Form)

The database schema is designed using Third Normal Form (3NF) to reduce redundancy and ensure data integrity. Each table represents a single entity, and all attributes in a table depend only on the primary key of that table.

Functional dependencies are clearly defined. Customer details such as first name, last name, email, phone, city, and registration date depend on customer_id. Product details depend on product_id, and order-related attributes depend on order_id. In the order_items table, all attributes depend on order_item_id.

There are no partial dependencies because each table uses a single-column primary key. Transitive dependencies are also avoided since non-key attributes do not depend on other non-key attributes.

Update anomalies are avoided because customer, product, and order data are stored in separate tables. Insert anomalies are prevented since new records can be added independently. Delete anomalies are avoided because removing an order does not remove customer or product information.

Therefore, the database design satisfies First Normal Form (1NF), Second Normal Form (2NF), and Third Normal Form (3NF).

---

3. Sample Data Representation

Sample records were inserted into each table using the ETL pipeline and verified successfully in the database.
