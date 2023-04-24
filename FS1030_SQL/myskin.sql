-- create tables for database
CREATE TABLE Users(
 user_id INT AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_active TINYINT(1) DEFAULT 1 NOT NULL,
  PRIMARY KEY (user_id)
);

CREATE TABLE Routines(
routine_ID VARCHAR(255),
routine_type VARCHAR(255),
routine_name VARCHAR(255)
);

Create table Products (
product_id INT NOT NULL,
product_name VARCHAR(255) NOT NULL,
product_type VARCHAR(255) NOT NULL,
product_image VARCHAR(255) not null
);

create table Brands(
brand_id INT,
brand_name VARCHAR(255),
brand_image VARCHAR(255)
);

Create table Reviews(
review_id INT,
review_rating VARCHAR(255),
review_description MEDIUMTEXT
);

show tables;
create table blogs (
blog_id INT,
blog_name VARCHAR(255),
blog_description LONGTEXT
);

-- Alter queries to update primary key and created at, update at columns
ALTER TABLE routines 
ADD created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
ADD updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
ADD is_active TINYINT(1) DEFAULT 1 NOT NULL, 
ADD is_deleted TINYINT(1) DEFAULT 0 NOT NULL;
ALTER TABLE routines ADD PRIMARY KEY (routine_ID);

ALTER TABLE brands ADD created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
ADD updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
ADD is_active TINYINT(1) DEFAULT 1 NOT NULL, 
ADD is_deleted TINYINT(1) DEFAULT 0 NOT NULL, 
ADD PRIMARY KEY (brand_ID);

ALTER TABLE products ADD created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
ADD updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
ADD is_active TINYINT(1) DEFAULT 1 NOT NULL, 
ADD is_deleted TINYINT(1) DEFAULT 0 NOT NULL, 
ADD PRIMARY KEY (product_ID);

ALTER TABLE Reviews 
ADD created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
ADD updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
ADD is_active TINYINT(1) DEFAULT 1 NOT NULL, 
ADD is_deleted TINYINT(1) DEFAULT 0 NOT NULL, 
ADD PRIMARY KEY (review_id);

ALTER TABLE blogs ADD created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
ADD updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
ADD is_active TINYINT(1) DEFAULT 1 NOT NULL, 
ADD is_deleted TINYINT(1) DEFAULT 0 NOT NULL, 
ADD PRIMARY KEY (blog_ID);

-- Insert Data into tables
INSERT INTO users (email, password, is_active)
VALUES
('samiha@gmail.com', '1234', 1),
('sarah@gmail.com', '3322', 1),
('dom@gmail.com', '3424', 1),
('chris@hotmail.com', '2342', 0),
('john@outlook.com', '2343', 1),
('sandra@hotmail.com', '6543', 0);

INSERT INTO brands (brand_id, brand_name, brand_image, is_active)
VALUES
(1, 'Tatcha', 'img1', 1),
(2, 'Pixi', 'img2', 1),
(3, 'The-Ordinary', 'img3', 1),
(4, 'supergoop', 'img4', 1),
(5, 'Farmacy', 'img5', 1),
(6, 'Joseon', 'img6', 1);

INSERT INTO products (product_id, product_name, product_type, product_image, price, is_active)
VALUES
(7, 'Rice Wash', 'cleanser', 'img7', 10.99, 1),
(8, 'Glow Toner', 'toner', 'img8', 20.99, 1),
(9, 'Honey Drop', 'Moisturizer', 'img9', 30.00, 1),
(10, 'Glow Serum', 'Serum', 'img10', 42.99, 1);

INSERT INTO routines (routine_ID, routine_type, routine_name)
VALUES ('routine001', 'AM1', 'Morning Rush'),
       ('routine002', 'PM1', 'Evening Relaxation'),
       ('routine003', 'PM2', 'Evening Travel');
       
INSERT INTO Reviews (review_id, review_rating, review_description)
VALUES (11, '5 stars', 'This product is amazing!'),
       (12, '3 stars', 'So good for my skim'),
       (13, '4 stars', 'Will buy again'),
       (14, '2 stars', 'Disappointed with the quality.'),
       (15, '5 stars', 'broke me out'),
       (16, '1 star', 'Do not recommend this product.');

INSERT INTO blogs (blog_id, blog_name, blog_description)
VALUES (17, 'My skincare routine', 'Sharing my skincare routine with the world'),
       (18, 'top 10 products in 2023', 'Your skincare routine is begging for these products'),
       (19, 'Hottest 5 brands', 'Everything from budget to luxury');
       
-- Update Queries
UPDATE blogs SET blog_name = 'The 10 Hottest Brands' WHERE blog_id = 19;
UPDATE brands SET is_deleted = 1 WHERE brand_id = 3;
UPDATE products SET price = '45.00' WHERE product_id = 23;
UPDATE `myskin_finalproject`.`Reviews` SET `review_description` = 'So good for my skin' WHERE (`review_id` = '12');
UPDATE products 
SET price = CASE
        WHEN product_id = 7 THEN 30.00 
        WHEN product_id = 8 THEN 20.99 
        WHEN product_id = 9 THEN 45.00 
        WHEN product_id = 10 THEN 18.99 
    END
WHERE product_id IN (7, 8, 9, 10);

-- Display most expensive products
SELECT * 
FROM products 
WHERE price = (SELECT MAX(price) FROM products);

-- Display products in order of price lowest to highest
SELECT * FROM products
ORDER BY price ASC;

-- Display reviews with less than 4 stars
SELECT *
FROM Reviews
WHERE review_rating < 4;

-- Adjusting column
ALTER TABLE products MODIFY brand_id INT DEFAULT 0 NOT NULL;
SELECT * FROM products;

-- Checkins on tables
describe routines;
select * from routines;
describe users;
select * from users;

-- Add Foreign keys to tables
ALTER TABLE routines
ADD CONSTRAINT fk_routine_users
FOREIGN KEY (user_id) REFERENCES users(user_id);

DESCRIBE routines;

ALTER TABLE products ADD COLUMN brand_id INT NOT NULL;

ALTER TABLE products ADD CONSTRAINT fk_products_brands
FOREIGN KEY (brand_id) REFERENCES brands(brand_id)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Reviews ADD COLUMN product_id INT NOT NULL;
ALTER TABLE Reviews ADD COLUMN user_id INT NOT NULL;

-- Add data into new columns
UPDATE `myskin_finalproject`.`Reviews` SET `product_id` = '7', `user_id` = '1' WHERE (`review_id` = '11');
UPDATE `myskin_finalproject`.`Reviews` SET `product_id` = '8', `user_id` = '2' WHERE (`review_id` = '12');
UPDATE `myskin_finalproject`.`Reviews` SET `product_id` = '9', `user_id` = '3' WHERE (`review_id` = '13');
UPDATE `myskin_finalproject`.`Reviews` SET `product_id` = '10', `user_id` = '5' WHERE (`review_id` = '14');

select * from Reviews;
select * from products;

-- Delete Queries
DELETE FROM `myskin_finalproject`.`Reviews` WHERE (`review_id` = '15');
DELETE FROM `myskin_finalproject`.`Reviews` WHERE (`review_id` = '16');

select * from Reviews;

-- adding foreign key to tables
ALTER TABLE Reviews 
ADD CONSTRAINT FK_Reviews_Products 
FOREIGN KEY (product_id) REFERENCES products(product_id),
ADD CONSTRAINT FK_Reviews_Users 
FOREIGN KEY (user_id) REFERENCES users(user_id);

describe Reviews;

select * from products;

-- Inserting more data
INSERT INTO `myskin_finalproject`.`products` 
(`product_id`, `product_name`, `product_type`, `product_image`, `created_at`, `updated_at`, `is_active`, `is_deleted`, `brand_id`, `price`) 
VALUES 
('21', 'Protini', 'Moisturizer', 'Img21', '2023-04-23 8:54:25', '2023-04-23 8:54:25', '1', '0', '5', '23.99'),
('22', 'Green Tea', 'Cleanser', 'Img22', '2023-04-23 8:54:25', '2023-04-23 8:54:25', '1', '0', '1', '30.99'),
('23', 'Superbounce', 'Serum', 'Img23', '2023-04-23 8:54:25', '2023-04-23 8:54:25', '1', '0', '2', '35.00');

-- Join Queries
-- Display reviews for specific product
SELECT r.review_id, r.review_rating, r.review_description
FROM Reviews r
JOIN products p ON p.product_id = r.product_id
WHERE p.product_name = 'Rice Wash';

-- Display products for specified brand
SELECT brands.brand_name, products.product_name, products.price 
FROM brands 
JOIN products 
ON brands.brand_id = products.brand_id 
WHERE brands.brand_name = 'Tatcha';

-- Display products and brands
SELECT products.product_name, brands.brand_name
FROM products
JOIN brands
ON products.brand_id = brands.brand_id;

-- Display information on all ative brands and products
SELECT b.brand_name, p.product_name, p.product_type, p.price
FROM brands b
JOIN products p ON b.brand_id = p.brand_id
WHERE b.is_active = 1 AND p.is_active = 1;

-- Added routine column to products
ALTER TABLE products ADD COLUMN routine_id INT NOT NULL;

-- Edited routine column and changed it to VARCHAR from INT
ALTER TABLE products DROP COLUMN routine_id;
ALTER TABLE products ADD COLUMN routine_id VARCHAR(255) NOT NULL;

-- Inserted Data into routine column
UPDATE `myskin_finalproject`.`products` SET `routine_id` = 'routine001' WHERE (`product_id` = '7');
UPDATE `myskin_finalproject`.`products` SET `routine_id` = 'routine001' WHERE (`product_id` = '8');
UPDATE `myskin_finalproject`.`products` SET `routine_id` = 'routine001' WHERE (`product_id` = '9');
UPDATE `myskin_finalproject`.`products` SET `routine_id` = 'routine002' WHERE (`product_id` = '10');
UPDATE `myskin_finalproject`.`products` SET `routine_id` = 'routine002' WHERE (`product_id` = '20');
UPDATE `myskin_finalproject`.`products` SET `routine_id` = 'routine003' WHERE (`product_id` = '21');
UPDATE `myskin_finalproject`.`products` SET `routine_id` = 'routine003' WHERE (`product_id` = '22');
UPDATE `myskin_finalproject`.`products` SET `routine_id` = 'routine002' WHERE (`product_id` = '23');

-- Display number of products in routines, grouped by the routine ID
SELECT routine_id, COUNT(product_id) as num_products
FROM products
GROUP BY routine_id;

-- create new table connecting routine and products
CREATE TABLE routine_products (
    routine_id VARCHAR(50) NOT NULL,
    product_id INT NOT NULL,
    PRIMARY KEY (routine_id, product_id),
    FOREIGN KEY (routine_id) REFERENCES routines(routine_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Add data into table
select * from routine_products;
INSERT INTO routine_products (routine_id, product_id)
VALUES 
('routine001', '7'), 
('routine001', '8'),
('routine001', '9'), 
('routine002', '10'),
('routine002', '20'), 
('routine003', '21'),
('routine003', '22'), 
('routine002', '23');

-- Join query to show all products in a specified routine
SELECT p.product_id, p.product_name, p.product_type, p.product_image
FROM products p
JOIN routine_products rp ON p.product_id = rp.product_id
WHERE rp.routine_id = 'routine001';











