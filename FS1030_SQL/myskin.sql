
create table users(
 user_id INT AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  is_active TINYINT(1) DEFAULT 1 NOT NULL,
  PRIMARY KEY (user_id)
);

Create table routines(
routine_ID varchar(255),
routine_type varchar(255),
routine_name varchar(255)
);

Create table products (
product_id INT NOT NULL,
product_name varchar(255) NOT NULL,
product_type varchar(255) NOT NULL,
product_image varchar(255) not null
);

create table brands(
brand_id int,
brand_name varchar(255),
brand_image varchar(255)
);

Create table Reviews(
review_id INT,
review_rating varchar(255),
review_description MEDIUMTEXT
);

show tables;
create table blogs (
blog_id int,
blog_name varchar(255),
blog_description longtext
);

ALTER TABLE routines ADD created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, ADD updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, ADD is_active TINYINT(1) DEFAULT 1 NOT NULL, ADD is_deleted TINYINT(1) DEFAULT 0 NOT NULL;
ALTER TABLE routines ADD PRIMARY KEY (routine_ID);

show tables;
ALTER TABLE brands ADD created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, ADD updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, ADD is_active TINYINT(1) DEFAULT 1 NOT NULL, ADD is_deleted TINYINT(1) DEFAULT 0 NOT NULL, ADD PRIMARY KEY (brand_ID);
ALTER TABLE products ADD created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, ADD updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, ADD is_active TINYINT(1) DEFAULT 1 NOT NULL, ADD is_deleted TINYINT(1) DEFAULT 0 NOT NULL, ADD PRIMARY KEY (product_ID);
ALTER TABLE Reviews ADD created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, ADD updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, ADD is_active TINYINT(1) DEFAULT 1 NOT NULL, ADD is_deleted TINYINT(1) DEFAULT 0 NOT NULL, ADD PRIMARY KEY (review_id);
ALTER TABLE blogs ADD created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, ADD updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, ADD is_active TINYINT(1) DEFAULT 1 NOT NULL, ADD is_deleted TINYINT(1) DEFAULT 0 NOT NULL, ADD PRIMARY KEY (blog_ID);
insert into users (email, password, is_active)
VALUES
('samiha@gmail.com', '1234', 1),
('sarah@gmail.com', '3322', 1),
('dom@gmail.com', '3424', 1),
('chris@hotmail.com', '2342', 0),
('john@outlook.com', '2343', 1),
('sandra@hotmail.com', '6543', 0);

insert into brands (brand_id, brand_name, brand_image, is_active)
VALUES
(1, 'Tatcha', 'img1', 1),
(2, 'Pixi', 'img2', 1),
(3, 'The-Ordinary', 'img3', 1),
(4, 'supergoop', 'img4', 1),
(5, 'Farmacy', 'img5', 1),
(6, 'Joseon', 'img6', 1);

insert into products (product_id, product_name, product_type, product_image, is_active)
VALUES
(7, 'Rice Wash', 'cleanser', 'img7', 1),
(8, 'Glow Toner', 'toner', 'img8', 1),
(9, 'Honey Drop', 'Moisturizer', 'img9', 1),
(10, 'Glow Serum', 'Serum', 'img10', 1);

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
       
show tables;

show columns from routines;
select * from routines;

update blogs set blog_name = 'The 10 Hottest Brands' WHERE blog_id = 19;

UPDATE brands set is_deleted = 1 where brand_id = 3;

select * from brands;




