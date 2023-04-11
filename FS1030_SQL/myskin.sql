
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
