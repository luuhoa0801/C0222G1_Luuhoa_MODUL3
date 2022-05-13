DROP DATABASE cong_viec;
CREATE DATABASE cong_viec;
USE cong_viec;
CREATE TABLE phieu_xuat(
so_px     INT         PRIMARY KEY,
ngay_xuat DATE
);

CREATE TABLE vat_tu(
ma_vtu    INT          PRIMARY KEY,
ten_vtu    VARCHAR (50)
);

CREATE TABLE phieu_nhap(
so_pn    INT        PRIMARY KEY,
ngay_nhap DATE
);

CREATE TABLE nhacc(
ma_ncc   INT         PRIMARY KEY,
ten_ncc  VARCHAR (50),
dia_chi  VARCHAR (50)
);

CREATE TABLE sdt_nhacc(
ma_ncc   INT,
sdt      INT PRIMARY KEY,
FOREIGN KEY (ma_ncc) REFERENCES nhacc ( ma_ncc)
);

CREATE TABLE don_dh(
so_dh    INT      PRIMARY KEY,
ngay_dh  DATE,
ma_ncc INT,
FOREIGN KEY (ma_ncc) REFERENCES nhacc (ma_ncc)
);


CREATE TABLE chi_tiet_phieu_xuat(
so_px     INT ,
ma_vtu    INT ,
dg_xuat  VARCHAR (50),
sl_xuat  INT NOT NULL ,
PRIMARY KEY (so_px , ma_vtu),
FOREIGN KEY (so_px) REFERENCES phieu_xuat(so_px),
FOREIGN KEY (ma_vtu) REFERENCES vat_tu(ma_vtu)
);

CREATE TABLE chi_tiet_phieu_nhap(
ma_vtu   INT ,
so_pn    INT ,
dg_nhap  VARCHAR (50),
sl_nhap  INT ,
PRIMARY KEY (ma_vtu , so_pn),
FOREIGN KEY (ma_vtu) REFERENCES vat_tu(ma_vtu),
FOREIGN KEY (so_pn) REFERENCES phieu_nhap(so_pn)
);

CREATE TABLE chi_tiet_don_dat_hang(
ma_vtu INT,
so_dh  INT,
PRIMARY KEY (ma_vtu, so_dh),
FOREIGN KEY (ma_vtu) REFERENCES vat_tu (ma_vtu),
FOREIGN KEY (so_dh) REFERENCES don_dh (so_dh)
);











