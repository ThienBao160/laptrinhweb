Create database QL_BKE


CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(25) NOT NULL,
    user_email VARCHAR(55) NOT NULL,
    user_pass VARCHAR(255) NOT NULL,
    updated_at DATETIME DEFAULT GETDATE(),
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_price FLOAT NOT NULL,
    product_description TEXT NOT NULL,
    updated_at DATETIME DEFAULT GETDATE(),
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    updated_at DATETIME DEFAULT GETDATE(),
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE order_details (
    order_detail_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    updated_at DATETIME DEFAULT GETDATE(),
    created_at DATETIME DEFAULT GETDATE()
);

INSERT INTO users (user_id, user_name, user_email, user_pass, updated_at, created_at)
VALUES 
('1','Alice Johnson', 'alice@gmail.com', 'password123', GETDATE(), GETDATE()),
('2','Bob Smith', 'bob@gmail.com', 'password123', GETDATE(), GETDATE()),
('3','Charlie Brown', 'charlie@gmail.com', 'password123', GETDATE(), GETDATE());

INSERT INTO products (product_name, product_price, product_description, updated_at, created_at)
VALUES 
('Laptop', 1200.99, 'High-performance laptop', GETDATE(), GETDATE()),
('Smartphone', 799.99, 'Latest model smartphone', GETDATE(), GETDATE()),
('Tablet', 450.50, '10-inch screen tablet', GETDATE(), GETDATE());

INSERT INTO orders (user_id, updated_at, created_at)
VALUES 
(1, GETDATE(), GETDATE()),
(2, GETDATE(), GETDATE()),
(3, GETDATE(), GETDATE());

INSERT INTO order_details (order_id, product_id, updated_at, created_at)
VALUES 
(1, 1, GETDATE(), GETDATE()),
(2, 2, GETDATE(), GETDATE()),
(3, 3, GETDATE(), GETDATE());