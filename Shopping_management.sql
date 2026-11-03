Drop database if exists shopping_management;
create database shopping_management;
use shopping_management;

create table customers(
customer_id int auto_increment primary key,
customer_name varchar(50) not null,
Email varchar(50) unique,
Phone_number char(10) not null unique,
Age int check(age>0),
Gender Enum('Male', 'Female', 'other'),
Country varchar(50) default 'India',
City varchar(50) not null,
Pincode char(6) default '201301',
Registration_Date  date default(current_date),
Registration_Time time default(current_time),
Created_At datetime default current_timestamp,
Address varchar(250),
customer_status Enum('Active', 'Inactive', 'Blocked')
   DEFAULT 'Active',
customer_Notes varchar(250)
)ENGINE = InnoDB;

create table orders(
order_id int auto_increment primary key,
customer_id int not null,
order_Date date default(current_date),
order_Amount decimal(10,2) not null,
order_status enum('Pending', 'Processing', 'Shipped', 'delivered', 'Cancelled')
default 'Pending',
Payment_method enum('Cash','Card','UPI','Net Banking'),
Payment_status enum('Pending','Paid','failed')
default 'Pending',
shipping_Adress varchar(250) not null,
Delivery_pincode char(6),
Quantity int not null check(Quantity>0),
Discount_Amount decimal(10,2) default 0.00,
Delivery_Date DATE NULL,
Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
Tracking_Number VARCHAR(30) UNIQUE,
Delivery_Status ENUM('Not Dispatched','In Transit','Delivered','Returned'
)DEFAULT 'Not Dispatched',
Order_Notes VARCHAR(250),
-- FOREIGN KEY CONSTRAINT
CONSTRAINT fk_customer_order
FOREIGN KEY (Customer_Id)
REFERENCES customers(Customer_Id)
ON DELETE CASCADE
ON UPDATE CASCADE
) ENGINE = InnoDB;

SHOW TABLES;
DESC customers;
DESC orders;
