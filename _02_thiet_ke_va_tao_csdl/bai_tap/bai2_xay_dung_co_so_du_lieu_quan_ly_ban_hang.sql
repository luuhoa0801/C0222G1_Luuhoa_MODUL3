CREATE DATABASE quan_ly_ban_hang;
USE quan_ly_ban_hang;

CREATE TABLE customer(
c_id      INT   PRIMARY KEY,
c_name    VARCHAR(50) ,
c_age     DATETIME
);
-- thay doi du lieu truong c_age -> DATE
ALTER TABLE customer MODIFY c_age DATE;

INSERT INTO customer value(1,"Hòa",10/10/1995);
SELECT * FROM customer;


CREATE TABLE `order`(
o_id          INT    PRIMARY KEY,
c_id          INT,
o_date        DATETIME,
o_total_price VARCHAR(50),
FOREIGN KEY (c_id) REFERENCES customer(c_id)
);
ALTER TABLE `order` MODIFY o_date DATE;
DELETE FROM `order` WHERE o_id =5;

INSERT INTO `order` VALUE(2,1,"2022-06-07",1000);
SELECT * FROM `order`;

CREATE TABLE product(
p_id     INT    PRIMARY KEY,
p_name   VARCHAR(50),
p_price  VARCHAR(50)
);
CREATE TABLE order_detail(
o_id    INT,
p_id    INT,
od_qty  INT,
PRIMARY KEY (o_id, p_id),
FOREIGN KEY (o_id) REFERENCES `order` (o_id),
FOREIGN KEY (p_id) REFERENCES product(p_id)
);
-- DROP DATABASE quan_ly_ban_hang;
