USE furama;
INSERT INTO vi_tri (ten_vi_tri) VALUE 
("Quản li 1"),
("Quản li 2"),
("nhân viên 1");

INSERT INTO trinh_do (ten_trinh_do) VALUE 
 ("cao đẳng"),
 ("Đại học");
 
INSERT INTO bo_phan (ten_bo_phan) VALUE
("hành chính"),
("làm nhân viên"),
("làm nhân viên");

INSERT INTO nhan_vien (ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) VALUE
("Lưu Hòa","1995-01-08",1234567890,100.0,"0789280347","luuhoa@gmail.com","Quảng Nam",1,2,3),
("Nguyễn Luân","1995-10-08",1234567899,100.0,"0789280777","luan@gmail.com","Bình Định",2,1,2),
("Nguyễn Trung Kiên","1999-11-08",1234567999,100.0,"0789280333","trungkien@gmail.com","Đà Nẵng",2,2,1);

INSERT INTO loai_khach( ten_loai_khach) VALUE
 
 ("Diamond"),
 ("Platinium"),
 ("Gold"),
 ("Silver"),
 ("Member");
 
INSERT INTO khach_hang (ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi) VALUE 
(2,"Nguyễn Hoàng Hảo","1999-05-05",0,111111,07891111, "hao@email.com" , "Đà Nẵng"),
(3,"Nguyễn Long","2000-01-01",1,11111,0789222222,"long@gmail.com","Quảng Trị"),
(1,"Trần Mạnh Cường","1996-03-03",0,2222,078913333, "cuong@email.com" , "Quảng Bình"),
(2,"Huỳnh Nhật Hoàng","1996-04-04",0,4444,0789444444, "hoang@email.com" , "Vinh"),
(2,"Huỳnh Nhật Hoàng","1996-04-04",0,4444,0789444444, "hoang@email.com" , "Vinh"),
(2,"Nguyễn Văn Vinh","1997-04-04",0,4444,07895555, "vinh@email.com" , "Quảng trị");


INSERT INTO dich_vu_di_kem ( ten_dich_vu_di_kem, gia, don_vi, trang_thai) VALUES
("Xem Phim",99.0,"1 suất","sẵn sàng"),
( "spa", 1000.0, "VNĐ", "sẵn sàng"),
( "Hát karaoke", 2000.0, "VNĐ", "sẵn sàng"),
( "Cafe bãi biển", 3000.0, "VNĐ", "sẵn sàng");

INSERT INTO kieu_thue ( ten_kieu_thue) VALUE
 ("Thuê theo ngày"),
 ("Thuê theo tháng"),
 ("Thuê theo giờ");
 
INSERT INTO loai_dich_vu(ten_loai_dich_vu) VALUE
 ("Loại thường"),
 ("Loại vip");

INSERT INTO dich_vu( ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da,
ma_kieu_thue, ma_loai_dich_vu, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang) VALUE
 ("Villa Beach Front",11.1,10000.0,3,1,2,"Bình thường","không",11.0,2),
 ("House Princess 01",31.1,10000.0,3,1,2,"Bình thường","không",11.0,3),
 ("Room Twin 01",21.1,20000.0,3,2,2,"Bình thường","không",21.0,4);

INSERT INTO hop_dong (ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) VALUE
 ("2020-01-01","2020-01-02",1000.0,1,2,1),
 ("2020-02-02","2020-02-03",1000.0,2,1,2),
 ("2020-03-02","2020-03-05",1000.0,1,2,3),
 ("2021-03-02","2021-03-05",1000.0,1,4,1),
 ("2020-11-02","2020-12-03",1000.0,2,1,2),
 ("2021-03-02","2020-02-03",1000.0,2,1,1),
 ("2021-01-02","2020-02-03",1000.0,2,2,2),
 ("2021-02-12","2020-03-10",1000.0,2,3,3),
 ("2021-09-01","2020-10-10",1000.0,2,4,1),
 ("2020-10-02","2020-12-03",1000.0,2,1,1);
 
 
INSERT INTO hop_dong_chi_tiet(ma_hop_dong, ma_dich_vu_di_kem, so_luong) VALUE
(1,1,3),
(1,2,3),
(2,2,3),
(5,1,3),
(6,1,3),
(7,1,3),
(8,1,3),
(9,1,3),
(4,1,3);



