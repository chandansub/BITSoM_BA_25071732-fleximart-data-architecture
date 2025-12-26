INSERT INTO dim_date VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,false),
(20240102,'2024-01-02','Tuesday',2,1,'January','Q1',2024,false),
(20240103,'2024-01-03','Wednesday',3,1,'January','Q1',2024,false),
(20240104,'2024-01-04','Thursday',4,1,'January','Q1',2024,false),
(20240105,'2024-01-05','Friday',5,1,'January','Q1',2024,false),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,true),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,true),
(20240108,'2024-01-08','Monday',8,1,'January','Q1',2024,false),
(20240109,'2024-01-09','Tuesday',9,1,'January','Q1',2024,false),
(20240110,'2024-01-10','Wednesday',10,1,'January','Q1',2024,false),
(20240111,'2024-01-11','Thursday',11,1,'January','Q1',2024,false),
(20240112,'2024-01-12','Friday',12,1,'January','Q1',2024,false),
(20240113,'2024-01-13','Saturday',13,1,'January','Q1',2024,true),
(20240114,'2024-01-14','Sunday',14,1,'January','Q1',2024,true),
(20240115,'2024-01-15','Monday',15,1,'January','Q1',2024,false),
(20240201,'2024-02-01','Thursday',1,2,'February','Q1',2024,false),
(20240202,'2024-02-02','Friday',2,2,'February','Q1',2024,false),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,true),
(20240204,'2024-02-04','Sunday',4,2,'February','Q1',2024,true),
(20240205,'2024-02-05','Monday',5,2,'February','Q1',2024,false),
(20240206,'2024-02-06','Tuesday',6,2,'February','Q1',2024,false),
(20240207,'2024-02-07','Wednesday',7,2,'February','Q1',2024,false),
(20240208,'2024-02-08','Thursday',8,2,'February','Q1',2024,false),
(20240209,'2024-02-09','Friday',9,2,'February','Q1',2024,false),
(20240210,'2024-02-10','Saturday',10,2,'February','Q1',2024,true),
(20240211,'2024-02-11','Sunday',11,2,'February','Q1',2024,true),
(20240212,'2024-02-12','Monday',12,2,'February','Q1',2024,false),
(20240213,'2024-02-13','Tuesday',13,2,'February','Q1',2024,false),
(20240214,'2024-02-14','Wednesday',14,2,'February','Q1',2024,false),
(20240215,'2024-02-15','Thursday',15,2,'February','Q1',2024,false);

INSERT INTO dim_product (product_id, product_name, category, subcategory, unit_price) VALUES
('P001','Laptop','Electronics','Computers',60000),
('P002','Smartphone','Electronics','Mobiles',30000),
('P003','Headphones','Electronics','Audio',2000),
('P004','TV','Electronics','Appliances',45000),
('P005','Mouse','Electronics','Accessories',500),

('P006','Running Shoes','Fashion','Footwear',4000),
('P007','Jeans','Fashion','Clothing',2500),
('P008','Jacket','Fashion','Clothing',6000),
('P009','T-Shirt','Fashion','Clothing',800),
('P010','Sandals','Fashion','Footwear',1500),

('P011','Mixer','Home','Kitchen',7000),
('P012','Chair','Home','Furniture',3000),
('P013','Table','Home','Furniture',8000),
('P014','Lamp','Home','Decor',1200),
('P015','Curtains','Home','Decor',2200);

INSERT INTO dim_customer (customer_id, customer_name, city, state, customer_segment) VALUES
('C001','Rahul Sharma','Bengaluru','Karnataka','Retail'),
('C002','Anita Verma','Chennai','Tamil Nadu','Retail'),
('C003','Amit Patel','Ahmedabad','Gujarat','Corporate'),
('C004','Neha Singh','Mumbai','Maharashtra','Retail'),
('C005','Ravi Kumar','Bengaluru','Karnataka','Corporate'),
('C006','Priya Nair','Chennai','Tamil Nadu','Retail'),
('C007','Suresh Iyer','Mumbai','Maharashtra','Corporate'),
('C008','Pooja Mehta','Ahmedabad','Gujarat','Retail'),
('C009','Kiran Rao','Bengaluru','Karnataka','Retail'),
('C010','Sneha Das','Chennai','Tamil Nadu','Corporate'),
('C011','Vikas Jain','Mumbai','Maharashtra','Retail'),
('C012','Mehul Shah','Ahmedabad','Gujarat','Corporate');

INSERT INTO fact_sales
(date_key, product_key, customer_key, quantity_sold, unit_price, discount_amount, total_amount)
VALUES
(20240106,1,1,1,60000,2000,58000),
(20240107,2,2,2,30000,3000,57000),
(20240113,3,3,3,2000,0,6000),
(20240114,4,4,1,45000,5000,40000),
(20240120,5,5,5,500,0,2500),

(20240127,6,6,2,4000,500,7500),
(20240128,7,7,1,2500,0,2500),
(20240203,8,8,1,6000,500,5500),
(20240204,9,9,4,800,0,3200),
(20240210,10,10,2,1500,0,3000),

(20240211,11,11,1,7000,1000,6000),
(20240217,12,12,2,3000,0,6000),
(20240218,13,1,1,8000,500,7500),
(20240224,14,2,3,1200,0,3600),
(20240225,15,3,2,2200,200,4200),

(20240105,1,4,1,60000,0,60000),
(20240112,2,5,1,30000,2000,28000),
(20240119,3,6,2,2000,0,4000),
(20240126,4,7,1,45000,3000,42000),
(20240202,5,8,6,500,0,3000),

(20240209,6,9,1,4000,0,4000),
(20240216,7,10,2,2500,0,5000),
(20240223,8,11,1,6000,1000,5000),
(20240201,9,12,5,800,0,4000),
(20240208,10,1,3,1500,0,4500),

(20240104,11,2,1,7000,0,7000),
(20240111,12,3,2,3000,0,6000),
(20240118,13,4,1,8000,500,7500),
(20240125,14,5,4,1200,0,4800),
(20240215,15,6,2,2200,200,4200),

(20240106,1,7,1,60000,3000,57000),
(20240107,2,8,1,30000,0,30000),
(20240203,3,9,3,2000,0,6000),
(20240204,4,10,1,45000,5000,40000),
(20240210,5,11,5,500,0,2500);

