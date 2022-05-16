use furama;
SELECT * FROM nhan_vien WHERE ( ho_ten LIKE "H%" OR ho_ten LIKE "T%" OR ho_ten LIKE "K%" ) AND char_length(ho_ten) <30;
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



