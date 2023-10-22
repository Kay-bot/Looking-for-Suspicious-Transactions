-- Create tables
CREATE TABLE merchant_category (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE merchant (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    id_merchant_category INT,
    FOREIGN KEY (id_merchant_category) REFERENCES merchant_category(id)
);

CREATE TABLE card_holder (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE credit_card (
    card VARCHAR(20) PRIMARY KEY,
    card_holder_id INT,
    FOREIGN KEY (card_holder_id) REFERENCES card_holder(id)
);

CREATE TABLE transaction (
    id INT PRIMARY KEY,
    date TIMESTAMP,
    amount DECIMAL(10, 2),
    card VARCHAR(20),
    id_merchant INT,
    FOREIGN KEY (card) REFERENCES credit_card(card),
    FOREIGN KEY (id_merchant) REFERENCES merchant(id)
);

-- Define relationships
-- merchant_category (1) <-----> (0 to many) merchant
-- merchant (1) <-----> (0 to many) transaction
-- credit_card (1) <-----> (0 to many) transaction
-- card_holder (1) <-----> (0 to many) credit_card

