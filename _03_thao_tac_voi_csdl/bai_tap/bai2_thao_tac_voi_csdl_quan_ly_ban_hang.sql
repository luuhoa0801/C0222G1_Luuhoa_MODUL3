CREATE DATABASE quan_ly_ban_hang;
USE quan_ly_ban_hang;

CREATE TABLE customer(
c_id      INT   PRIMARY KEY   AUTO_INCREMENT,
c_name    VARCHAR(50) ,
c_age     TINYINT
);
-- thay doi du lieu truong c_age -> DATE
-- ALTER TABLE customer MODIFY c_age DATE;

CREATE TABLE `order`(
o_id          INT    PRIMARY KEY  AUTO_INCREMENT ,
c_id          INT,
o_date        DATE,
o_total_price VARCHAR(50),
FOREIGN KEY (c_id) REFERENCES customer(c_id)
);

CREATE TABLE product(
p_id     INT    PRIMARY KEY  AUTO_INCREMENT ,
p_name   VARCHAR(50),
p_price  VARCHAR(50)
);

CREATE TABLE order_detail(
o_id    INT,
p_id    INT,
od_qty  INT ,
PRIMARY KEY (o_id, p_id),
FOREIGN KEY (o_id) REFERENCES `order` (o_id),
FOREIGN KEY (p_id) REFERENCES product(p_id)
);

INSERT INTO customer (c_name,c_age) VALUES 
("Minh Quan",10),
("Ngoc Oanh", 20),
("Hong Ha", 50);

INSERT INTO `order` (c_id, o_date, o_total_price) VALUES
("1","2006-03-21",NULL),
("2","2006-03-26",NULL),
("1","2006-03-16",NULL);

INSERT INTO product (p_name, p_price) VALUES
("May Giat",3),
("Tu Lanh",5),
("Dieu Hoa",7),
("Quat",1),
("Bep Dien",2);

INSERT INTO order_detail (o_id, p_id, od_qty) VALUES
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

SELECT o.o_id,  o.o_date,  o.o_total_price
FROM  `order` AS o ; 

SELECT c.c_name,  p.p_name
FROM  (((order_detail  AS od 
INNER JOIN `order`  AS o ON o.o_id = od.o_id)
INNER JOIN customer AS c ON  c.c_id = o.c_id)
INNER JOIN product  AS p  ON od.p_id = p.p_id);

-- hiển thị danh sách các khách hàng k order
SELECT *  
FROM customer AS c
WHERE c.c_id NOT IN (SELECT c_id FROM `order`);

SELECT o.o_id, o.o_date, ( od.od_qty * p.p_price) 
FROM order_detail AS od
INNER JOIN `order` AS o ON o.o_id = od.o_id
INNER JOIN product AS p ON p.p_id = od.p_id;



