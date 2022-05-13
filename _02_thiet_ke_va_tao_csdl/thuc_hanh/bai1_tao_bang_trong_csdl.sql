create database quan_li_diem_thi;
use quan_li_diem_thi;
create table if not EXISTS hoc_sinh(
ma_hs varchar(20) primary key,
ten_hs varchar(50),
ngay_sinh datetime,
lop varchar(20),
gt varchar(20)
);
create table if not EXISTS mon_hoc(
ma_mh varchar (20) primary key,
ten_mh varchar(50)
);
create table if not EXISTS bang_diem(
ma_hs varchar(20),
ma_mh varchar(20),
diem_thi int,
ngay_kt datetime,
primary key (ma_hs, ma_mh),
foreign key (ma_hs) references hoc_sinh(ma_hs),
foreign key (ma_mh) references mon_hoc(ma_mh)
);
create table if not EXISTS giao_vien(
ma_gv varchar(20) primary key,
ten_gv varchar (20),
sdt varchar(10)
);
-- thay doi truong khi khai bao sai
-- ALTER TABLE `quan_li_diem_thi`.`giao_vien` 
-- CHANGE COLUMN `ma_gc` `ma_gv` VARCHAR(20) NULL DEFAULT NULL ;

-- Chỉnh sửa lại bảng MonHoc bổ sung thêm trường MaGV là khoá ngoại của bảng MonHoc
alter table mon_hoc add ma_gv varchar (20);
alter table mon_hoc add constraint fk_ma_gv foreign key (ma_gv) references giao_vien(ma_gv);
