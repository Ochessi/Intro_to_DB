CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

CREATE TABLE Authors (
    authorID INT AUTO_INCREMENT PRIMARY KEY,
    authorName VARCHAR(215) NOT NULL
);

CREATE TABLE Books (
    bookID INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    authorID INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    publicationDate DATE NOT NULL,
    FOREIGN KEY (authorID) REFERENCES Authors(authorID)
);

CREATE TABLE Customers (
    customerID INT AUTO_INCREMENT PRIMARY KEY,
    customerName VARCHAR(215) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    address TEXT NOT NULL
);

CREATE TABLE Orders (
    orderID INT AUTO_INCREMENT PRIMARY KEY,
    customerID INT NOT NULL,
    orderDate DATE NOT NULL,
    FOREIGN KEY (customerID) REFERENCES Customers(customerID)
);

CREATE TABLE OrderDetails (
    orderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    orderID INT NOT NULL,
    bookID INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (orderID) REFERENCES Orders(orderID),
    FOREIGN KEY (bookID) REFERENCES Books(bookID)
);