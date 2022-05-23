use furama;
-- "\\w+\\sh[a-z]+$"
SELECT * FROM nhan_vien WHERE ( ho_ten LIKE "H%" OR ho_ten LIKE "L%" ) AND char_length(ho_ten) < 15;

SELECT * FROM khach_hang
WHERE (TIMESTAMPDIFF (year, ngay_sinh, current_date()) BETWEEN 18 AND 50) AND  ( dia_chi = "Đà Nẵng" OR dia_chi = "Quảng Trị");

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần 
-- theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

SELECT kh.ma_khach_hang,lk.ten_loai_khach,kh.ho_ten,COUNT(kh.ma_khach_hang) AS so_lan_dat 
FROM khach_hang AS kh
JOIN loai_khach AS lk  ON  lk.ma_loai_khach = kh.ma_loai_khach
JOIN hop_dong   AS hd  ON  hd.ma_khach_hang = kh.ma_khach_hang
WHERE lk.ten_loai_khach = "Diamond"
GROUP BY kh.ma_khach_hang
ORDER BY so_lan_dat ASC ;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong,
--  ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá,
--  với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng.
--  (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

SELECT kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ma_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,
ifnull((dv.chi_phi_thue + hdct.so_luong * dvdk.gia), dv.chi_phi_thue) AS tong_tien
FROM hop_dong     AS   hd
LEFT JOIN hop_dong_chi_tiet AS  hdct    ON   hdct.ma_hop_dong = hd.ma_hop_dong
LEFT JOIN dich_vu_di_kem    AS  dvdk  ON   dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
LEFT JOIN dich_vu           AS  dv    ON   dv.ma_dich_vu = hd.ma_dich_vu
RIGHT JOIN khach_hang        AS  kh    ON   kh.ma_khach_hang = hd.ma_khach_hang
LEFT JOIN loai_khach        AS  lk    ON   lk.ma_loai_khach = kh.ma_loai_khach;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng 
-- được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

SELECT dv.ma_dich_vu, dv.ten_dich_vu,dv.dien_tich,dv.chi_phi_thue,ldv.ten_loai_dich_vu
FROM dich_vu        AS dv
JOIN loai_dich_vu   AS ldv ON  ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
WHERE dv.ma_dich_vu NOT IN ( SELECT ma_dich_vu FROM hop_dong WHERE ( quarter(ngay_lam_hop_dong)=1 AND year(ngay_lam_hop_dong) =2021) ) ;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ
--  đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

SELECT dv.ma_dich_vu,dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu 
FROM dich_vu   AS  dv
JOIN loai_dich_vu  AS ldv  ON ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
WHERE ( dv.ma_dich_vu IN ( SELECT ma_dich_vu FROM hop_dong WHERE ( year (ngay_lam_hop_dong) =2020 )))
AND  dv.ma_dich_vu   NOT IN ( SELECT ma_dich_vu FROM hop_dong WHERE ( year (ngay_lam_hop_dong) =2021 ) );

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
SELECT kh.ho_ten FROM khach_hang AS kh
GROUP BY kh.ho_ten; 
 
SELECT DISTINCT ho_ten FROM khach_hang;

SELECT kh.ho_ten FROM khach_hang  kh UNION  SELECT ho_ten FROM khach_hang;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021
--  thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

 SELECT month(ngay_lam_hop_dong) AS thang , COUNT(ngay_lam_hop_dong) AS so_khach_hang_dat_phong
 FROM hop_dong
 WHERE year(ngay_lam_hop_dong) = 2020
 GROUP BY thang;
 
--  10.Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
--  Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, 
--  so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

SELECT hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, sum(so_luong) AS so_luong_dich_vu_di_kem
FROM hop_dong_chi_tiet AS hdct
JOIN dich_vu_di_kem    AS dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
JOIN hop_dong          AS hd   ON hdct.ma_hop_dong = hd.ma_hop_dong
GROUP BY hd.ma_hop_dong;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” 
-- và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

SELECT * FROM dich_vu_di_kem AS dvdk
JOIN hop_dong_chi_tiet AS hdct ON  hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
JOIN hop_dong          AS hd   ON  hd.ma_hop_dong = hdct.ma_hop_dong
JOIN khach_hang        AS kh   ON  kh.ma_khach_hang = hd.ma_khach_hang
JOIN loai_khach        AS lk   ON  lk.ma_loai_khach = kh.ma_loai_khach
WHERE (lk.ten_loai_khach = "Diamond" AND ( kh.dia_chi = "Vinh" OR kh.dia_chi = "Quảng Ngãi"));
 
--  12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng),
--  ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của
--  tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

SELECT hd.ma_hop_dong, nv.ho_ten AS ho_ten_nhan_vien, kh.ho_ten AS ho_ten_khach_hang, kh.so_dien_thoai, dv.ten_dich_vu, 
sum(hdct.so_luong) as so_luong_dich_vu_di_kem, hd.tien_dat_coc
FROM hop_dong_chi_tiet AS hdct
JOIN hop_dong   hd   ON hd.ma_hop_dong = hdct.ma_hop_dong
JOIN nhan_vien  nv  ON nv.ma_nhan_vien = hd.ma_nhan_vien
JOIN khach_hang kh  ON kh.ma_khach_hang = hd.ma_khach_hang
JOIN dich_vu    dv  ON dv.ma_dich_vu = hd.ma_dich_vu
WHERE dv.ma_dich_vu IN ( SELECT hd.ma_dich_vu  FROM hop_dong hd WHERE  quarter(ngay_lam_hop_dong) = 4 AND year(ngay_lam_hop_dong) = 2020 )
AND dv.ma_dich_vu NOT IN ( SELECT hd.ma_dich_vu FROM hop_dong hd WHERE  quarter(ngay_lam_hop_dong) IN (1,2) AND year(ngay_lam_hop_dong) = 2021)
GROUP BY hd.ma_hop_dong;

--  13.Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ
--  có số lần sử dụng nhiều như nhau).

SELECT dvdk.ten_dich_vu_di_kem,dvdk.gia,dvdk.don_vi,dvdk.trang_thai, count(hdct.ma_dich_vu_di_kem) AS so_lan_thue FROM hop_dong_chi_tiet  hdct
JOIN dich_vu_di_kem  dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
JOIN hop_dong        hd   ON hd.ma_hop_dong = hdct.ma_hop_dong 
JOIN khach_hang      kh   ON kh.ma_khach_hang = hd.ma_khach_hang
GROUP BY hdct.ma_hop_dong 
HAVING so_lan_thue = (SELECT count(hdct.ma_dich_vu_di_kem) AS so_lan_thue FROM hop_dong_chi_tiet  hdct GROUP BY hdct.ma_hop_dong ORDER BY so_lan_thue DESC LIMIT 1);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.Thông tin hiển thị bao gồm ma_hop_dong,
--  ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung(được tính dựa trên việc count các ma_dich_vu_di_kem).

SELECT hd.ma_hop_dong,ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem) AS so_lan_su_dung
FROM dich_vu_di_kem   dvdk
JOIN hop_dong_chi_tiet  hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
JOIN hop_dong           hd   ON hd.ma_hop_dong = hdct.ma_hop_dong
JOIN dich_vu            dv   ON dv.ma_dich_vu = hd.ma_dich_vu
JOIN loai_dich_vu       ldv  ON ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
GROUP BY hdct.ma_hop_dong
HAVING so_lan_su_dung = (SELECT count(hdct.ma_dich_vu_di_kem) AS so_lan_thue
 FROM hop_dong_chi_tiet  hdct GROUP BY hdct.ma_hop_dong ORDER BY so_lan_thue ASC LIMIT 1);

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai,
--  dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

SELECT nv.ma_nhan_vien, nv.ho_ten,td.ten_trinh_do,bp.ten_bo_phan,nv.so_dien_thoai, nv.dia_chi,count(nv.ma_nhan_vien) AS so_lan_lap 
FROM nhan_vien  nv 
JOIN trinh_do   td  ON td.ma_trinh_do = nv.ma_trinh_do
JOIN bo_phan    bp  ON bp.ma_bo_phan = nv.ma_bo_phan
JOIN hop_dong   hd  ON hd.ma_nhan_vien = nv.ma_nhan_vien
GROUP BY nv.ma_nhan_vien
HAVING so_lan_lap <= 3 AND nv.ma_nhan_vien IN 
(SELECT hd.ma_nhan_vien FROM hop_dong hd WHERE year(hd.ngay_lam_hop_dong) in (2020,2021)); 

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

DELETE FROM nhan_vien nv
WHERE  nv.ma_nhan_vien NOT IN (SELECT hd.ma_nhan_vien FROM hop_dong hd WHERE year(ngay_lam_hop_dong) BETWEEN 2019 AND 2021 );

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng
--  với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

UPDATE khach_hang  
SET ma_loai_khach = 1
WHERE ma_loai_khach = 2 
AND khach_hang.ma_khach_hang IN (SELECT id_khach_hang_update.ma_khach_hang FROM
(SELECT kh.ma_khach_hang FROM hop_dong  hd 
LEFT JOIN hop_dong_chi_tiet   hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
LEFT JOIN dich_vu_di_kem      dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
LEFT JOIN dich_vu             dv   ON dv.ma_dich_vu = hd.ma_dich_vu
LEFT JOIN khach_hang          kh   ON kh.ma_khach_hang = hd.ma_khach_hang 
WHERE year(hd.ngay_lam_hop_dong) = 2021 AND (dv.chi_phi_thue + (hdct.so_luong * dvdk.gia)) > 10000
GROUP BY kh.ma_khach_hang) AS id_khach_hang_update);

-- UPDATE khach_hang
-- SET ma_loai_khach = 1
-- WHERE ma_loai_khach = 2
-- AND khach_hang.ma_khach_hang IN 
-- ( SELECT ma_khach_hang FROM hop_dong  hd
-- JOIN hop_dong_chi_tiet  hdct ON hdct.ma_hop_dong = hd.ma_hop_dong 
-- JOIN dich_vu_di_kem     dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
-- JOIN dich_vu            dv   ON dv.ma_dich_vu = hd.ma_dich_vu
-- WHERE year(ngay_lam_hop_dong) = 2021
-- GROUP BY ma_khach_hang
-- HAVING sum( dv.chi_phi_thue + (hdct.so_luong * dvdk.gia) ) > 10000 );

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

DELETE  FROM khach_hang 
WHERE khach_hang.ma_khach_hang  NOT IN (
 SELECT hd.ma_khach_hang FROM hop_dong hd 
 JOIN khach_hang kh ON kh.ma_khach_hang = hd.ma_khach_hang 
 WHERE year(hd.ngay_lam_hop_dong) = 2020 GROUP BY ma_khach_hang);

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

UPDATE dich_vu_di_kem 
SET gia = gia *2 
WHERE ma_dich_vu_di_kem IN
( SELECT hdct.ma_dich_vu_di_kem FROM hop_dong_chi_tiet  hdct
JOIN hop_dong        hd   ON hd.ma_hop_dong = hdct.ma_hop_dong 
WHERE year(hd.ngay_lam_hop_dong) = 2020
GROUP BY hdct.ma_dich_vu_di_kem
HAVING count(hdct.ma_dich_vu_di_kem) >= 2 ) ;
  
-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
--  thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

SELECT ma_nhan_vien, ho_ten, email, so_dien_thoai,ngay_sinh, dia_chi FROM nhan_vien 
UNION
SELECT ma_khach_hang, ho_ten ,email, so_dien_thoai,ngay_sinh,dia_chi FROM khach_hang ;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu”
--  và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.

CREATE VIEW v_nhan_vien AS SELECT * FROM nhan_vien  nv 
WHERE nv.ma_nhan_vien IN 
( SELECT nv.ma_nhan_vien FROM hop_dong hd 
JOIN nhan_vien nv ON nv.ma_nhan_vien = hd.ma_nhan_vien
WHERE nv.dia_chi = "Quảng Nam" AND date(hd.ngay_lam_hop_dong) = "2020-01-01" ) ; 

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” 
-- đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.

UPDATE nhan_vien 
SET dia_chi = "Liên Chiểu"
WHERE ma_nhan_vien IN ( SELECT * FROM ( SELECT ma_nhan_vien FROM v_nhan_vien) AS abc  );

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó
--  với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.

delimiter //
CREATE PROCEDURE sp_xoa_khach_hang ( IN p_ma_khach_hang INT )
BEGIN 
SELECT * FROM khach_hang  kh WHERE p_ma_khach_hang = kh.ma_khach_hang ;
END //
delimiter ;

CALL sp_xoa_khach_hang(1);


 

