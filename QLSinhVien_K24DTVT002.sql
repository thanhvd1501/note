/* =====================================================
   BAI THUC HANH CO SO DU LIEU
   Ho ten: Nguyễn Quang Chiến
   Ma sinh vien: K24DTVT002
   Lop: D24TXVT01-K
   ===================================================== */


-- 1. TAO DATABASE


CREATE DATABASE QLSinhVien_K24DTVT002;
GO

USE QLSinhVien_K24DTVT002;
GO



-- 2. TAO BANG KHOA


CREATE TABLE Khoa
(
    Ma VARCHAR(4) NOT NULL,
    Ten VARCHAR(100) NOT NULL,

    CONSTRAINT PK_Khoa PRIMARY KEY (Ma)
);
GO



-- 3. TAO BANG SINHVIEN


CREATE TABLE SinhVien
(
    Ma INT NOT NULL,
    Ten VARCHAR(100) NOT NULL,
    NgaySinh DATE NOT NULL,
    MaKhoa VARCHAR(4),
    DiaChi VARCHAR(200),

    CONSTRAINT PK_SinhVien PRIMARY KEY (Ma),

    CONSTRAINT FK_SinhVien_Khoa
        FOREIGN KEY (MaKhoa)
        REFERENCES Khoa(Ma)
);
GO



-- 4. THEM COT DIENTHOAI


ALTER TABLE SinhVien
ADD DienThoai VARCHAR(15);
GO



-- 5. MO RONG COT DIENTHOAI


ALTER TABLE SinhVien
ALTER COLUMN DienThoai VARCHAR(20);
GO


-- 6. THEM DU LIEU KHOA

INSERT INTO Khoa (Ma, Ten)
VALUES
('CNTT', 'Cong nghe thong tin'),
('QTKD', 'Quan tri kinh doanh'),
('NNA', 'Ngon ngu Anh');
GO



-- 7. THEM DU LIEU SINH VIEN


INSERT INTO SinhVien
    (Ma, Ten, NgaySinh, MaKhoa, DiaChi, DienThoai)
VALUES
(1, 'Nguyen Van An',   '2004-01-15', 'CNTT', 'Ha Noi',    '0912345678'),
(2, 'Tran Minh Duc',   '2004-03-20', 'CNTT', 'Hai Phong', '0987654321'),
(3, 'Le Hoang Nam',    '2003-11-05', 'CNTT', 'Nam Dinh',  '0901234567'),
(4, 'Pham Quang Huy',  '2004-06-12', 'CNTT', 'Ha Noi',    '0934567890'),
(5, 'Do Thu Ha',       '2004-02-14', 'QTKD', 'Ha Noi',    '0961234567'),
(6, 'Bui Ngoc Mai',    '2003-09-25', 'QTKD', 'Bac Ninh',  '0972345678'),
(7, 'Hoang Gia Bao',   '2004-07-08', 'QTKD', 'Hai Duong', '0943456789'),
(8, 'Nguyen Minh Anh', '2004-05-17', 'NNA',  'Ha Noi',    '0924567890'),
(9, 'Tran Thu Trang',  '2003-12-01', 'NNA',  'Hung Yen',  '0915678901'),
(10,'Le Khanh Linh',   '2004-08-23', 'NNA',  'Ha Nam',    '0986789012');
GO



-- CAU 1


SELECT *
FROM Khoa;



-- CAU 2


SELECT *
FROM SinhVien;



-- CAU 3


SELECT
    Ma,
    Ten,
    NgaySinh,
    DiaChi,
    DienThoai
FROM SinhVien;



-- CAU 4


SELECT
    sv.Ma,
    sv.Ten AS TenSinhVien,
    sv.NgaySinh,
    sv.DiaChi,
    sv.DienThoai,
    k.Ten AS TenKhoa
FROM SinhVien sv
INNER JOIN Khoa k
    ON sv.MaKhoa = k.Ma;



-- CAU 5


SELECT
    sv.Ma,
    sv.Ten,
    sv.NgaySinh,
    sv.DiaChi,
    sv.DienThoai,
    k.Ten AS TenKhoa
FROM SinhVien sv
INNER JOIN Khoa k
    ON sv.MaKhoa = k.Ma
WHERE sv.MaKhoa = 'CNTT';



-- CAU 6


SELECT
    k.Ma AS MaKhoa,
    k.Ten AS TenKhoa,
    COUNT(sv.Ma) AS SoLuongSinhVien
FROM Khoa k
LEFT JOIN SinhVien sv
    ON k.Ma = sv.MaKhoa
GROUP BY
    k.Ma,
    k.Ten;