-- task_2.sql

USE alx_book_store;

CREATE TABLE IF NOT EXISTS AUTHORS (
  author_id INT PRIMARY KEY,
  author_name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS BOOKS (
  book_id INT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  isbn VARCHAR(20) UNIQUE,
  author_id INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  quantity_available INT,
  FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
);

CREATE TABLE IF NOT EXISTS CUSTOMERS (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100) UNIQUE,
  address TEXT,
  phone_number VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS ORDERS (
  order_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  total_price DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
);

CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
  order_detail_id INT PRIMARY KEY,
  order_id INT NOT NULL,
  book_id INT NOT NULL,
  quantity_id INT NOT NULL,
  price_per_unit DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
  FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
);
