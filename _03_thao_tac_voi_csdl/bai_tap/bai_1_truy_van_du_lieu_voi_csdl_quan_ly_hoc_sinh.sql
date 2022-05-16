CREATE DATABASE IF NOT EXISTS quan_ly_sinh_vien;
USE quan_ly_sinh_vien;
CREATE TABLE class(
class_id   INT          AUTO_INCREMENT     PRIMARY KEY,
class_name VARCHAR (60) NOT NULL,
start_date DATETIME     NOT NULL,
`status`   BIT
);

INSERT INTO class VALUES (NULL,'A1','2008-12-20',1);
INSERT INTO class VALUES (NULL,'A2','2008-12-22',1);
INSERT INTO class VALUES (NULL,'B3',current_date(),0);  
     --  --thêm chưa dc


CREATE TABLE student(
student_id   INT     PRIMARY KEY  AUTO_INCREMENT  ,
student_name VARCHAR(30) NOT NULL,
address      VARCHAR(20),
phone        VARCHAR(60),
`status`     BIT,
class_id     INT         ,
FOREIGN KEY (class_id) REFERENCES class (class_id)
);

INSERT INTO student (student_name,address,phone,`status`,class_id) VALUES ('Hung','Ha Noi','0912113113',1,1);
INSERT INTO student (student_name,address,`status`,class_id)
VALUES ('Hoa','Hai phong',1,2);
INSERT INTO student (student_name,address,phone,`status`,class_id)
VALUES ('Manh','HCM','0123123123',0,3);
 

CREATE TABLE `subject`(
sub_id     INT       AUTO_INCREMENT      PRIMARY KEY,
sub_name   VARCHAR (30) NOT NULL,
credit     TINYINT   NOT NULL DEFAULT 1 CHECK ( credit >= 1),
`status`   BIT     DEFAULT 1 
);

INSERT INTO `subject`
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

CREATE TABLE mark_student(
mark_id  INT            AUTO_INCREMENT       PRIMARY KEY,
sub_id   INT  NOT NULL,
student_id INT NOT NULL,
mark      FLOAT   DEFAULT 0 CHECK ( mark BETWEEN 0 AND 100),
examtimes TINYINT DEFAULT 1,
UNIQUE ( sub_id, student_id),
FOREIGN KEY (sub_id) REFERENCES `subject` (sub_id),
FOREIGN KEY (student_id) REFERENCES student ( student_id)
);

INSERT INTO mark_student (sub_id, student_id, mark, examtimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);

SELECT * FROM student WHERE student_name LIKE "h%";
SELECT * FROM class WHERE  MONTH(start_date) = 12;
SELECT * FROM `subject` WHERE (3<= credit AND credit <=5 ) ;

SELECT  s.student_name, sub.sub_name , m.mark
FROM  mark_student AS m
INNER JOIN student AS s ON m.student_id = s.student_id
INNER JOIN `subject` AS sub ON sub.sub_id = m.sub_id
ORDER BY m.mark DESC,  s.student_name ASC;

UPDATE student SET class_id = 2
WHERE student_name = "Hung";



