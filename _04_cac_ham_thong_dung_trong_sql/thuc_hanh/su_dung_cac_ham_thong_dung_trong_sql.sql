USE quan_ly_sinh_vien;
SELECT address, COUNT(student_id) AS 'Số lượng học viên'
FROM student
GROUP BY address;

SELECT s.student_id,s.student_name, AVG(mark)
FROM student s JOIN mark_student m on s.student_id = m.student_id
GROUP BY s.student_id, s.student_name;

SELECT s.student_id,s.student_name, AVG(mark)
FROM student s JOIN mark_student m on s.student_id = m.student_id
GROUP BY s.student_id, s.student_name;

SELECT s.student_id,s.student_name, AVG(mark)
FROM student s JOIN mark_student m on s.student_id = m.student_id
GROUP BY s.student_id, s.student_name
HAVING AVG(mark) >15;

SELECT s.student_id, s.student_name, AVG(mark)
FROM student s JOIN mark_student m on s.student_id = m.student_id
GROUP BY s.student_id, s.student_name
HAVING AVG(mark) >= ALL (SELECT AVG(mark) FROM mark_student GROUP BY mark_student.student_id);

