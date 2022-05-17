USE quan_ly_sinh_vien;

SELECT max(credit) FROM `subject`;

SELECT * 
FROM `subject` s
JOIN mark_student AS m ON m.sub_id = s.sub_id
WHERE m.mark IN ( SELECT max(mark) FROM mark_student);

SELECT s.student_id,s.student_name, avg(mark) AS diem_trung_binh 
FROM student s
JOIN mark_student AS m ON s.student_id =m.student_id
GROUP BY s.student_id
ORDER BY diem_trung_binh DESC; 

