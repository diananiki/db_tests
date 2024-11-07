DROP TABLE if exists trainers CASCADE;

CREATE TABLE trainers
(
    product_id BIGSERIAL PRIMARY KEY NOT NULL,
    brand_name VARCHAR(100)          NOT NULL,
    price      DECIMAL               NOT NULL,
    quantity   INT                   NOT NULL,
    bought     INT                   NOT NULL
);

INSERT INTO trainers (brand_name, price, quantity, bought)
VALUES ('Nike', 1999.99, 10, 5),
       ('Adidas', 1499.99, 8, 3),
       ('Puma', 1299.99, 12, 1),
       ('New Balance', 1799.99, 6, 2),
       ('Osiris', 999.99, 15, 4),
       ('Vans', 899.99, 20, 7),
       ('Nike', 2499.99, 18, 10),
       ('Adidas', 1399.99, 10, 8),
       ('Puma', 1099.99, 14, 6),
       ('New Balance', 1599.99, 8, 3),
       ('Osiris', 899.99, 13, 5),
       ('Vans', 799.99, 22, 9),
       ('Nike', 2799.99, 15, 12),
       ('Adidas', 1699.99, 9, 6),
       ('Puma', 1199.99, 13, 4),
       ('New Balance', 1899.99, 7, 2),
       ('Osiris', 1099.99, 18, 7),
       ('Vans', 999.99, 19, 9),
       ('Nike', 2999.99, 12, 9),
       ('Adidas', 1899.99, 7, 5),
       ('Puma', 1399.99, 11, 3),
       ('Osiris', 1199.99, 16, 8),
       ('Vans', 1099.99, 21, 10);


DROP TABLE if exists trainers_models;

CREATE TABLE trainers_models
(
    product_id    BIGSERIAL    NOT NULL,
    model_name    VARCHAR(100) NOT NULL,
    colour        VARCHAR(100) NOT NULL,
    year_of_issue INT          NOT NULL,
    gender        VARCHAR(100) NOT NULL,

    FOREIGN KEY (product_id) REFERENCES trainers (product_id)
);

INSERT INTO trainers_models (model_name, colour, year_of_issue, gender)
VALUES ('Zoom Pegasus Turbo', 'Black', 2021, 'Male'),
       ('Ultraboost', 'White', 2020, 'Female'),
       ('Gel-Nimbus', 'Gray', 2021, 'Male'),
       ('Fresh Foam', 'Blue', 2020, 'Female'),
       ('Sk8-Low', 'Brown', 2019, 'Male'),
       ('Authentic', 'Pink', 2020, 'Female'),
       ('Air Jordan 1', 'White', 2021, 'Male'),
       ('Stan Smith', 'Black', 2020, 'Female'),
       ('NMD', 'Gray', 2021, 'Male'),
       ('Gel-Kayano', 'Blue', 2020, 'Female'),
       ('Era', 'Red', 2019, 'Male'),
       ('Classic Slip-On', 'Black', 2020, 'Female'),
       ('Air Force 1', 'Gray', 2021, 'Male'),
       ('Superstar', 'White', 2020, 'Female'),
       ('RS-X', 'Black', 2021, 'Male'),
       ('Gel-Kayano Lite', 'Blue', 2020, 'Female'),
       ('Sk8-Hi MTE', 'White', 2020, 'Female'),
       ('Air Max 90', 'Blue', 2021, 'Male'),
       ('Superstar Slip-On', 'Black', 2020, 'Female'),
       ('X9000L4', 'Gray', 2021, 'Male'),
       ('Fresh Foam Hierro', 'Blue', 2020, 'Female'),
       ('Era 95 DX', 'Red', 2019, 'Male'),
       ('SK8-Hi Pro', 'Black', 2020, 'Female');


DROP TABLE if exists supplies CASCADE;

CREATE TABLE supplies
(
    supply_id   BIGSERIAL             NOT NULL,
    supplier_id BIGSERIAL PRIMARY KEY NOT NULL,
    product_id  INT                   NOT NULL,
    quantity    INT                   NOT NULL,
    price       DECIMAL               NOT NULL,
    date        DATE                  NOT NULL,

    FOREIGN KEY (product_id) REFERENCES trainers (product_id)
);

INSERT INTO supplies (product_id, quantity, price, date)
VALUES (1, 10, 10000.00, '2023-11-01'),
       (13, 5, 7000.00, '2023-10-02'),
       (2, 8, 13000.00, '2023-07-03'),
       (20, 15, 21500.00, '2023-04-04'),
       (7, 3, 2000.00, '2023-12-05'),
       (8, 12, 12000.00, '2023-05-06'),
       (8, 6, 5000.00, '2023-06-07'),
       (12, 9, 12500.00, '2023-07-08'),
       (11, 18, 18900.00, '2023-10-09'),
       (6, 4, 3000.00, '2023-01-10'),
       (7, 7, 10700.00, '2023-02-11'),
       (21, 11, 10000.00, '2023-05-12'),
       (11, 2, 4500.00, '2023-09-13'),
       (18, 14, 20500.00, '2023-08-14');


DROP TABLE if exists sales CASCADE;

CREATE TABLE sales
(
    sale_id     BIGSERIAL             NOT NULL,
    product_id  INT                   NOT NULL,
    customer_id BIGSERIAL PRIMARY KEY NOT NULL,
    date        DATE                  NOT NULL,

    FOREIGN KEY (product_id) REFERENCES trainers (product_id)
);

INSERT INTO sales (product_id, date)
VALUES (4, '2022-07-01'),
       (23, '2022-10-02'),
       (6, '2022-11-03'),
       (19, '2022-08-04'),
       (8, '2022-09-05'),
       (13, '2022-11-06'),
       (14, '2022-01-07'),
       (4, '2022-10-08'),
       (6, '2022-02-09'),
       (6, '2022-04-10'),
       (11, '2022-05-11'),
       (1, '2022-05-12'),
       (22, '2022-04-13'),
       (17, '2022-03-14'),
       (12, '2022-02-15'),
       (9, '2022-01-16'),
       (6, '2022-01-17'),
       (2, '2022-10-18'),
       (18, '2022-10-19'),
       (20, '2022-10-20');


DROP TABLE if exists suppliers;

CREATE TABLE suppliers
(
    supplier_id       BIGSERIAL NOT NULL,
    organization_name VARCHAR(100)          NOT NULL,
    full_name         VARCHAR(100)          NOT NULL,
    address           VARCHAR(100)          NOT NULL,
    phone_number      BIGINT                NOT NULL,

    FOREIGN KEY (supplier_id) REFERENCES supplies (supplier_id)
);

INSERT INTO suppliers (organization_name, full_name, address, phone_number)
VALUES ('ABC Company', 'John Smith', '123 Main Street', 1234567890),
       ('XYZ Corporation', 'Jane Doe', '456 Park Avenue', 9876543210),
       ('Acme Co', 'Michael Johnson', '789 Elm Road', 5551234567),
       ('Global Enterprises', 'Sarah Williams', '321 Oak Lane', 8885551234),
       ('Tech Solutions', 'David Brown', '654 Pine Street', 9998887777),
       ('Innovative Industries', 'Jennifer Davis', '987 Maple Court', 1112223333),
       ('Dynamic Systems', 'Robert Wilson', '222 Cedar Avenue', 4445556666),
       ('Smart Manufacturing', 'Emily Jones', '555 Birch Road', 7778889999),
       ('Apex Technologies', 'Joshua Taylor', '888 Spruce Lane', 6667778888),
       ('Precision Engineering', 'Megan Anderson', '111 Walnut Street', 3334445555),
       ('Prime Solutions', 'Daniel Roberts', '444 Ash Road', 2223334444),
       ('Global Innovations', 'Olivia Thompson', '777 Hickory Lane', 5556667777),
       ('Elite Manufacturing', 'William Moore', '000 Willow Court', 8889990000),
       ('Dynamic Systems', 'Sophia Clark', '333 Birch Road', 1112223333);


DROP TABLE if exists customers;

CREATE TABLE customers
(
    customer_id  BIGSERIAL NOT NULL,
    full_name    VARCHAR(100)          NOT NULL,
    address      VARCHAR(100)          NOT NULL,
    phone_number BIGINT                NOT NULL,

    FOREIGN KEY (customer_id) REFERENCES sales (customer_id)
);

INSERT INTO customers (full_name, address, phone_number)
VALUES ('John Smith', '123 Main Street', 1234567890),
       ('Jane Doe', '456 Park Avenue', 9876543210),
       ('Michael Johnson', '789 Elm Road', 5551234567),
       ('Sarah Williams', '321 Oak Lane', 8885551234),
       ('David Brown', '654 Pine Street', 9998887777),
       ('Jennifer Davis', '987 Maple Court', 1112223333),
       ('Robert Wilson', '222 Cedar Avenue', 4445556666),
       ('Emily Jones', '555 Birch Road', 7778889999),
       ('Joshua Taylor', '888 Spruce Lane', 6667778888),
       ('Megan Anderson', '111 Walnut Street', 3334445555),
       ('Daniel Roberts', '444 Ash Road', 2223334444),
       ('Olivia Thompson', '777 Hickory Lane', 5556667777),
       ('William Moore', '000 Willow Court', 8889990000),
       ('Sophia Clark', '333 Birch Road', 1112223333),
       ('James Martinez', '666 Pine Street', 9998887777),
       ('Elizabeth Adams', '222 Oak Lane', 4445556666),
       ('Joseph Hernandez', '555 Cedar Avenue', 7778889999),
       ('Isabella Turner', '888 Elm Road', 6667778888),
       ('Alexander Phillips', '111 Pine Street', 3334445555),
       ('Ella Cooper', '444 Maple Court', 2223334444);


--CREATE INDEX idx_trainers_models_colour_gender ON trainers_models (colour, gender);
SELECT model_name
FROM trainers_models
WHERE colour = 'Black'
  and gender = 'Female';

SELECT product_id, quantity
FROM trainers
WHERE quantity > 15;

SELECT brand_name, bought
FROM trainers
WHERE price = (SELECT MAX(price) FROM trainers);

SELECT model_name
FROM trainers_models
WHERE year_of_issue = 2020
ORDER BY model_name;


SELECT model_name, price
FROM trainers_models
         JOIN trainers ON trainers_models.product_id = trainers.product_id
WHERE year_of_issue = 2021;

SELECT brand_name, COUNT(*) as black_trainers
FROM trainers_models
         JOIN trainers ON trainers_models.product_id = trainers.product_id
WHERE colour = 'Black'
GROUP BY brand_name;

SELECT EXTRACT(MONTH FROM date) AS month, SUM(price) AS total_earned
FROM trainers
         JOIN sales ON trainers.product_id = sales.product_id
GROUP BY month
ORDER BY total_earned DESC
LIMIT 1;


SELECT full_name, date
FROM customers
         JOIN sales ON customers.customer_id = sales.customer_id
         JOIN trainers_models ON sales.product_id = trainers_models.product_id
WHERE model_name = 'Authentic'
ORDER BY full_name;

--CREATE INDEX idx_date ON supplies (EXTRACT(MONTH FROM date));
SELECT organization_name, model_name
FROM supplies
         JOIN trainers_models ON supplies.product_id = trainers_models.product_id
         JOIN suppliers ON supplies.supplier_id = suppliers.supplier_id
WHERE EXTRACT(MONTH FROM date) > 4
  AND EXTRACT(MONTH FROM date) < 10;

SELECT full_name, model_name, price
FROM customers
         JOIN (
    SELECT sales.customer_id, model_name, price
    FROM sales
             JOIN trainers ON sales.product_id = trainers.product_id
             JOIN trainers_models ON trainers.product_id = trainers_models.product_id
    WHERE colour = 'White'
) as filtered_sales ON customers.customer_id = filtered_sales.customer_id;






SELECT colour, SUM(price) as total_price
FROM trainers_models
         JOIN trainers ON trainers_models.product_id = trainers.product_id
GROUP BY colour;
