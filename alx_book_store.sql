CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

CREATE TABLE Authors (
    author_ID INT AUTO_INCREMENT PRIMARY KEY,
    author_Name VARCHAR(215) NOT NULL
);

CREATE TABLE Books (
    book_ID INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_ID INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    publication_Date DATE NOT NULL,
    FOREIGN KEY (author_ID) REFERENCES Authors(author_ID)
);

CREATE TABLE Customers (
    customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    customer_Name VARCHAR(215) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    address TEXT NOT NULL
);

CREATE TABLE Orders (
    order_ID INT AUTO_INCREMENT PRIMARY KEY,
    customer_ID INT NOT NULL,
    order_Date DATE NOT NULL,
    FOREIGN KEY (customer_ID) REFERENCES Customers(customer_ID)
);

CREATE TABLE Order_Details (
    order_Detail_ID INT AUTO_INCREMENT PRIMARY KEY,
    order_ID INT NOT NULL,
    book_ID INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_ID) REFERENCES Orders(order_ID),
    FOREIGN KEY (book_ID) REFERENCES Books(book_ID)
);