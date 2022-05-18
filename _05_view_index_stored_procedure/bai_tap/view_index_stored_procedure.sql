CREATE DATABASE demo;
USE demo;
CREATE TABLE products(
id            INT          PRIMARY KEY  AUTO_INCREMENT,
product_code  VARCHAR (50) ,
product_name  VARCHAR(50) ,
product_price  DOUBLE,
product_amount INT,
product_description   VARCHAR(50),
product_status        VARCHAR(50)
);

INSERT INTO products (product_code,product_name,product_price,product_amount,product_description,product_status) VALUE
 ("honda", "wave", 10000.0, 100, "có", "sẵn sàng"),
 ("suzuki", "xipo", 15000.0, 150, "có", "sẵn sàng"),
 ("yamaha", "ex", 20000.0, 50, "có", "sẵn sàng"),
 ("honda", "ba", 40000.0, 90, "có", "sẵn sàng"),
 ("honda", "ab", 20000.0, 50, "có", "sẵn sàng"),
 ("benz", "oto", 30000.0, 200, "có", "chưa sẵn sàng");
 
  SELECT * FROM products WHERE product_code = "honda" ;
 
 -- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
 CREATE INDEX in_product_code ON products (product_code );
 
 EXPLAIN SELECT * FROM products WHERE product_code = "honda";
 
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
 CREATE INDEX in_product_name_price ON products (product_name,product_price);
 
 EXPLAIN SELECT product_name FROM products WHERE product_name = "wave"; 

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW product_view AS
SELECT p.product_code, p.product_name, p.product_price, p.product_status 
FROM products p ;
SELECT * FROM product_view;

-- CREATE OR REPLACE  VIEW product_view AS 
-- SELECT p.product_code, p.product_name 
-- FROM products p 
-- WHERE 

-- Tiến hành sửa đổi view
UPDATE product_view SET product_code = "Mec" WHERE product_name = "oto";

-- Tiến hành xoá view
DROP VIEW product_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE products_sp()
BEGIN 
SELECT * FROM products ;
END //
DELIMITER ; 

CALL products_sp; 

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE products_sp1()
BEGIN 
INSERT INTO products (product_code,product_name,product_price,product_amount,product_description,product_status) VALUES
("Mez", "oto", 50000.0, 10, "có", "sẵn sàng");
END //
DELIMITER ; 
CALL products_sp1;

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE products_sp2(IN id_new INT,price DOUBLE)
BEGIN 
UPDATE products p SET product_price = price  WHERE p.id = id_new;
END //
DELIMITER ; 
CALL products_sp2(1,55555.0);

-- Tạo store procedure xoá sản phẩm theo id

DELIMITER //
CREATE PROCEDURE products_sp4(IN id_delete INT)
BEGIN 
DELETE FROM products
WHERE id_delete = id;
END //
DELIMITER ; 

CALL products_sp4(3);
