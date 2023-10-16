-- Create tables
CREATE TABLE merchant_categories (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE merchants (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    id_merchant_category INT,
    FOREIGN KEY (id_merchant_category) REFERENCES merchant_categories(id)
);

CREATE TABLE card_holders (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE credit_cards (
    card VARCHAR(20) PRIMARY KEY,
    card_holder_id INT,
    FOREIGN KEY (card_holder_id) REFERENCES card_holders(id)
);

CREATE TABLE transactions (
    id INT PRIMARY KEY,
    date TIMESTAMP,
    amount DECIMAL(10, 2),
    card VARCHAR(20),
    id_merchant INT,
    FOREIGN KEY (card) REFERENCES credit_cards(card),
    FOREIGN KEY (id_merchant) REFERENCES merchants(id)
);


-- Define relationships (optional, but helpful for documentation)
-- merchant_categories (1) <-----> (0 to many) merchants
-- merchants (1) <-----> (0 to many) transactions
-- credit_cards (1) <-----> (0 to many) transactions
-- card_holders (1) <-----> (0 to many) credit_cards
