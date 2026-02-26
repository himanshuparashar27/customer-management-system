-- Customers Table
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Orders Table
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'completed', 'shipped', 'canceled') DEFAULT 'pending',
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Invoices Table
CREATE TABLE invoices (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    invoice_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2) NOT NULL,
    status ENUM('paid', 'unpaid', 'refunded') DEFAULT 'unpaid',
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

-- Payments Table
CREATE TABLE payments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    invoice_id INT NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2) NOT NULL,
    method ENUM('credit_card', 'paypal', 'bank_transfer') NOT NULL,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id)
);

-- Packing Lists Table
CREATE TABLE packing_lists (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    packing_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'packed', 'shipped') DEFAULT 'pending',
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

-- Dispatch Details Table
CREATE TABLE dispatch_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    packing_list_id INT NOT NULL,
    dispatch_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    carrier VARCHAR(255),
    tracking_number VARCHAR(255),
    FOREIGN KEY (packing_list_id) REFERENCES packing_lists(id)
);