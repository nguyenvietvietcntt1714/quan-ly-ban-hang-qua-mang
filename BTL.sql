-- Bảng Khách hàng
CREATE TABLE KhachHangQM (
    MaKH INT PRIMARY KEY,
    Ten NVARCHAR(100) NOT NULL,
    DiaChi NVARCHAR(255),
    DiaChiNhanHang NVARCHAR(255),
    SDT VARCHAR(15) UNIQUE,
    Email VARCHAR(100) UNIQUE NOT NULL,
    MatKhau NVARCHAR(255) NOT NULL,
    LanDangNhapCuoi DATETIME
);

-- Bảng Lịch sử Khách hàng
CREATE TABLE LichSuKhachHang (
    MaLS INT PRIMARY KEY,
    MaKH INT,
    LanDangNhapCuoi DATETIME,
    NgayDatHangCuoi DATETIME,
    FOREIGN KEY (MaKH) REFERENCES KhachHangQM(MaKH)
);

-- Bảng Sản phẩm
CREATE TABLE SanPhamQM (
    MaSP INT PRIMARY KEY, 
    TenSP NVARCHAR(100) NOT NULL, 
    MoTa TEXT, -- Mô tả sản phẩm
    GiaSP DECIMAL(10,2) NOT NULL, 
    SoLuongTon INT CHECK (SoLuongTon >= 0) 
);


-- Bảng Đơn hàng
CREATE TABLE DonHangQM (
    MaDH INT PRIMARY KEY,
    MaKH INT,
    NgayDatHang DATETIME DEFAULT GETDATE(),
    TrangThai NVARCHAR(50) DEFAULT 'Dang cho',
    FOREIGN KEY (MaKH) REFERENCES KhachHangQM(MaKH)
);

-- Bảng Chi tiết Đơn hàng
CREATE TABLE ChiTietDonHangQM (
    MaChiTietDH INT PRIMARY KEY,
    MaDH INT,
    MaSP INT,
    SoLuongSP INT CHECK (SoLuongSP > 0),
    TongGia DECIMAL(10,2),
    FOREIGN KEY (MaDH) REFERENCES DonHangQM(MaDH),
    FOREIGN KEY (MaSP) REFERENCES SanPhamQM(MaSP)
);

INSERT INTO KhachHangQM (MaKH, Ten, DiaChi, DiaChiNhanHang, SDT, Email, MatKhau, LanDangNhapCuoi) VALUES
(1, 'Pham Thi C', '789 Nguyen Trai, HN', '789 Nguyen Trai, HN', '0901234567', 'unique_c@example.com', 'hashedpassword3', '2024-03-03 16:00:00'),
(2, 'Le Van D', '456 Hai Ba Trung, HCM', '456 Hai Ba Trung, HCM', '0912345678', 'unique_d@example.com', 'hashedpassword4', '2024-03-04 10:15:00'),
(3, 'Nguyen Thi E', '32 Bach Mai, HN', '32 Bach Mai, HN', '0987456321', 'unique_e@example.com', 'hashedpassword5', '2024-03-05 11:45:00'),
(4, 'Tran Van F', '25 Pham Ngu Lao, HCM', '25 Pham Ngu Lao, HCM', '0921234567', 'unique_f@example.com', 'hashedpassword6', '2024-03-06 09:30:00'),
(5, 'Do Thi G', '123 Pasteur, DN', '123 Pasteur, DN', '0938765432', 'unique_g@example.com', 'hashedpassword7', '2024-03-07 13:00:00'),
(6, 'Nguyen Van H', '789 Ly Thuong Kiet, HCM', '789 Ly Thuong Kiet, HCM', '0912987654', 'unique_h@example.com', 'hashedpassword8', '2024-03-08 14:20:00'),
(7, 'Tran Thi I', '67 Hoang Dieu, HN', '67 Hoang Dieu, HN', '0971237890', 'unique_i@example.com', 'hashedpassword9', '2024-03-09 15:45:00'),
(8, 'Le Van J', '58 Truong Chinh, HCM', '58 Truong Chinh, HCM', '0945671234', 'unique_j@example.com', 'hashedpassword10', '2024-03-10 16:00:00'),
(9, 'Nguyen Thi K', '45 Nguyen Van Cu, DN', '45 Nguyen Van Cu, DN', '0967123456', 'unique_k@example.com', 'hashedpassword11', '2024-03-11 17:00:00'),
(10, 'Pham Van L', '22 Le Hong Phong, HCM', '22 Le Hong Phong, HCM', '0934123456', 'unique_l@example.com', 'hashedpassword12', '2024-03-12 18:00:00'),
(11, 'Tran Thi M', '34 Bach Dang, HN', '34 Bach Dang, HN', '0923456789', 'unique_m@example.com', 'hashedpassword13', '2024-03-13 19:00:00');

INSERT INTO SanPhamQM (MaSP, TenSP, MoTa, GiaSP, SoLuongTon) VALUES
(1, 'Laptop', 'Laptop Dell Core i7', 1500.00, 5),
(2, 'Smartphone', 'iPhone 14 Pro Max', 1200.00, 9),
(3, 'Tablet', 'Samsung Galaxy Tab S8', 800.00, 2),
(4, 'Smartwatch', 'Apple Watch Series 8', 500.00, 4),
(5, 'Headphones', 'Sony WH-1000XM4', 350.00, 9),
(6, 'Monitor', 'LG UltraGear 27 inch', 450.00, 10),
(7, 'Keyboard', 'Mechanical Gaming Keyboard', 120.00, 16),
(8, 'Mouse', 'Logitech MX Master 3', 100.00, 11),
(9, 'Printer', 'HP LaserJet Pro', 250.00, 22),
(10, 'External', 'Seagate 2TB', 150.00, 13);


-- Dữ liệu mẫu cho bảng DonHangQM 
INSERT INTO DonHangQM (MaDH, MaKH, TrangThai) VALUES
(1, 1, 'Dang cho'),
(2, 2, 'Hoan thanh'),
(3, 3, 'Dang cho'),
(4, 4, 'Hoan thanh');

-- Dữ liệu mẫu cho bảng LichSuKhachHang (Đảm bảo giá trị MaKH tồn tại trong bảng KhachHangQM)
INSERT INTO LichSuKhachHang (MaLS, MaKH, LanDangNhapCuoi, NgayDatHangCuoi) VALUES
(1, 1, '2024-03-03 16:00:00', '2024-03-02 12:00:00'),
(2, 2, '2024-03-04 10:15:00', '2024-03-03 13:00:00'),
(3, 3, '2024-03-05 11:45:00', '2024-03-04 14:00:00'),
(4, 4, '2024-03-06 09:30:00', '2024-03-05 15:00:00'),
(5, 5, '2024-03-07 13:00:00', '2024-03-06 16:00:00'),
(6, 6, '2024-03-08 14:20:00', '2024-03-07 17:00:00'),
(7, 7, '2024-03-09 15:45:00', '2024-03-08 18:00:00'),
(8, 8, '2024-03-10 16:00:00', '2024-03-09 19:00:00'),
(9, 9, '2024-03-11 17:00:00', '2024-03-10 20:00:00'),
(10, 10, '2024-03-12 18:00:00', '2024-03-11 21:00:00'),
(11, 11, '2024-03-13 19:00:00', '2024-03-12 22:00:00');


-- Dữ liệu mẫu cho bảng ChiTietDonHangQM 
INSERT INTO ChiTietDonHangQM (MaChiTietDH, MaDH, MaSP, SoLuongSP, TongGia) VALUES
(1, 1, 1, 2, 3000),  -- Laptop
(2, 1, 3, 1, 800),   -- Tablet
(3, 2, 2, 1, 1200),  -- Smartphone
(4, 2, 4, 2, 1000),  -- Smartwatch
(5, 3, 5, 3, 1050),  -- Headphones
(6, 3, 6, 1, 450),   -- Monitor
(7, 4, 7, 4, 480),   -- Keyboard
(8, 4, 8, 2, 200);   -- Mouse


go
-- Trigger cập nhật trạng thái đơn hàng chỉ khi tất cả sản phẩm đã giao
CREATE TRIGGER trg_CapNhatTrangThaiDonHang
ON ChiTietDonHangQM
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE DonHangQM
    SET TrangThai = CASE 
        WHEN NOT EXISTS (
            SELECT 1 FROM ChiTietDonHangQM ctdh
            WHERE ctdh.MaDH = DonHangQM.MaDH AND ctdh.SoLuongSP > 0
        ) THEN 'Hoan thanh'
        ELSE 'Dang cho'
    END
    WHERE MaDH IN (SELECT DISTINCT MaDH FROM inserted);
END;


go
--Kiem tra so luong ton kho truoc khi them vao don hang
CREATE TRIGGER trg_CheckStockBeforeInsert
ON ChiTietDonHangQM
FOR INSERT
AS
BEGIN
    DECLARE @MaSP INT, @SoLuong INT;
    
    SELECT @MaSP = i.MaSP, @SoLuong = i.SoLuongSP 
    FROM inserted i;
    
    IF (SELECT SoLuongTon FROM SanPhamQM WHERE MaSP = @MaSP) < @SoLuong
    BEGIN
        RAISERROR('Không đủ hàng trong kho!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

go
-- Cập nhật số lượng tồn kho khi đặt hàng
CREATE TRIGGER trg_UpdateStockOnInsert
ON ChiTietDonHangQM
AFTER INSERT
AS
BEGIN
    UPDATE S
    SET S.SoLuongTon = S.SoLuongTon - i.SoLuongSP
    FROM SanPhamQM S
    JOIN inserted i ON S.MaSP = i.MaSP;
END;

go
--cap nhat lan dang nhap cuoi cua khach hang
CREATE TRIGGER trg_UpdateLastLogin
ON LichSuKhachHang
AFTER INSERT
AS
BEGIN
    -- Cập nhật thời gian đăng nhập cuối cùng cho khách hàng trong bảng KhachHangQM
    UPDATE KhachHangQM
    SET LanDangNhapCuoi = GETDATE()
    WHERE MaKH IN (SELECT MaKH FROM inserted);
END;
go
CREATE TRIGGER trg_UpdateLichSuKhachHang
ON KhachHangQM
AFTER UPDATE
AS
BEGIN
    UPDATE LichSuKhachHang
    SET LanDangNhapCuoi = GETDATE()  -- Cập nhật thời gian đăng nhập cuối cùng
    WHERE MaKH IN (SELECT MaKH FROM inserted);
END;


go
-- Cập nhật số lượng tồn kho khi xóa chi tiết đơn hàng
CREATE TRIGGER trg_RestoreStockOnDelete
ON ChiTietDonHangQM
AFTER DELETE
AS
BEGIN
    -- Cập nhật lại số lượng tồn kho cho sản phẩm sau khi xóa chi tiết đơn hàng
    UPDATE S
    SET S.SoLuongTon = S.SoLuongTon + d.SoLuongSP
    FROM SanPhamQM S
    JOIN deleted d ON S.MaSP = d.MaSP;
END;

go
--cap nhat tong gia tri don hang sau khi thay doi bang chi tiet don hang
CREATE TRIGGER trg_UpdateTotalOrder
ON ChiTietDonHangQM
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    UPDATE DonHangQM
    SET TongGia = (SELECT SUM(SP.GiaSP * CT.SoLuongSP) 
                    FROM ChiTietDonHangQM CT
                    JOIN SanPham SP ON CT.MaSP = SP.MaSP
                    WHERE CT.MaDH = DonHangQM.MaDH)
    WHERE EXISTS (SELECT 1 FROM inserted WHERE inserted.MaDH = DonHangQM.MaDH)
          OR EXISTS (SELECT 1 FROM deleted WHERE deleted.MaDH = DonHangQM.MaDH);
END;



-- View sản phẩm có giá cao nhất (nếu có nhiều sản phẩm cùng giá, hiển thị tất cả)
CREATE VIEW View_SanPhamGiaCaoNhat AS
SELECT * FROM SanPhamQM WHERE GiaSP = (SELECT MIN(GiaSP) FROM SanPhamQM);

CREATE VIEW View_SanPhamGiaCaoNhat AS
SELECT * FROM SanPhamQM WHERE GiaSP = (SELECT MAX(GiaSP) FROM SanPhamQM);

CREATE VIEW View_DanhSachKhachHang AS
SELECT MaKH, Ten, DiaChi, Email, SDT
FROM KhachHangQM;

CREATE VIEW View_DonHangDangCho AS
SELECT MaDH, MaKH, NgayDatHang, TrangThai
FROM DonHangQM
WHERE TrangThai = 'Dang cho';

CREATE VIEW View_ChiTietDonHangDayDu AS
SELECT dh.MaDH, kh.Ten AS TenKhachHang, sp.TenSP, ctdh.SoLuongSP, ctdh.TongGia, dh.TrangThai
FROM ChiTietDonHangQM ctdh
JOIN DonHangQM dh ON ctdh.MaDH = dh.MaDH
JOIN SanPhamQM sp ON ctdh.MaSP = sp.MaSP
JOIN KhachHangQM kh ON dh.MaKH = kh.MaKH;

CREATE VIEW View_KhachHangChuaDatHang AS
SELECT kh.MaKH, kh.Ten, kh.Email
FROM KhachHangQM kh
LEFT JOIN DonHangQM dh ON kh.MaKH = dh.MaKH
WHERE dh.MaDH IS NULL;

CREATE VIEW View_TongChiTieuKhachHang AS
SELECT kh.MaKH, kh.Ten, SUM(ctdh.TongGia) AS TongChiTieu
FROM KhachHangQM kh
JOIN DonHangQM dh ON kh.MaKH = dh.MaKH
JOIN ChiTietDonHangQM ctdh ON dh.MaDH = ctdh.MaDH
GROUP BY kh.MaKH, kh.Ten;




go
-- Function tính tổng giá trị đơn hàng (kèm trạng thái đơn hàng)
CREATE FUNCTION func_TongGiaTriDonHang()
RETURNS TABLE
AS
RETURN
(
    SELECT dh.MaDH, dh.TrangThai, SUM(ctdh.TongGia) AS TongGiaTri
    FROM DonHangQM dh
    JOIN ChiTietDonHangQM ctdh ON dh.MaDH = ctdh.MaDH
    GROUP BY dh.MaDH, dh.TrangThai
);

-- Truy vấn hiển thị tổng giá trị đơn hàng
SELECT * FROM func_TongGiaTriDonHang();


go
CREATE FUNCTION fn_GetTotalCustomers()
RETURNS INT
AS
BEGIN
    DECLARE @Total INT;
    SELECT @Total = COUNT(*) FROM KhachHangQM;
    RETURN @Total;
END;
SELECT dbo.fn_GetTotalCustomers() AS SoLuongKhachHang;


go
CREATE FUNCTION fn_GetTotalOrderAmount(@MaDH INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @TotalAmount DECIMAL(18,2);
    SELECT @TotalAmount = SUM(SP.GiaSP * CT.SoLuongSP) 
    FROM ChiTietDonHangQM CT
    JOIN SanPhamQM SP ON CT.MaSP = SP.MaSP
    WHERE CT.MaDH = @MaDH;
    RETURN @TotalAmount;
END;

SELECT dbo.fn_GetTotalOrderAmount(2) AS TongTienDonHang;



--Stored Produre
go
--lay tat ca du lieu cua bang khachhangqm
CREATE PROCEDURE sp_GetAllCustomers
AS
BEGIN
    SELECT * FROM KhachHangQM;
END;

EXEC sp_GetAllCustomers

go
--Tim khach hang theo Email
CREATE PROCEDURE sp_GetCustomerByEmail
    @Email VARCHAR(100)
AS
BEGIN
    SELECT * FROM KhachHangQM WHERE Email = @Email;
END;

EXEC sp_GetCustomerByEmail @Email = 'unique_e@example.com';

go
--lay tat ca du lieu tu bang donhangqm
CREATE PROCEDURE sp_GetAllOrders
AS
BEGIN
    SELECT * FROM DonHangQM;
END;

EXEC sp_GetAllOrders


go
--lay danh sach don hang cua mot khach hang
CREATE PROCEDURE sp_GetOrdersByCustomer
    @MaKH INT
AS
BEGIN
    SELECT * FROM DonHangQM WHERE MaKH = @MaKH;
END;

EXEC sp_GetOrdersByCustomer 1


go
--them mot khach hang moi
CREATE PROCEDURE sp_AddCustomer
	@MaKH INT,
    @Ten NVARCHAR(100),
    @DiaChi NVARCHAR(255),
    @DiaChiNhanHang NVARCHAR(255),
    @SDT VARCHAR(15),
    @Email VARCHAR(100),
    @MatKhau NVARCHAR(255)
AS
BEGIN
    INSERT INTO KhachHangQM (MaKH, Ten, DiaChi, DiaChiNhanHang, SDT, Email, MatKhau, LanDangNhapCuoi)
    VALUES (@MaKH, @Ten, @DiaChi, @DiaChiNhanHang, @SDT, @Email, @MatKhau, GETDATE());
END;


EXEC sp_AddCustomer
	@MaKH = 12,
    @Ten = N'Nguyen Van An', 
    @DiaChi = N'123 Le Loi, HCM', 
    @DiaChiNhanHang = N'123 Le Loi, HCM', 
    @SDT = '0966455311', 
    @Email = 'nguyenvanan@gmail.com', 
    @MatKhau = 'hashedpassword14';


go
CREATE PROCEDURE sp_LoginCustomer
    @Email VARCHAR(100),
    @MatKhau NVARCHAR(255)
AS
BEGIN
    DECLARE @MatKhauDB NVARCHAR(255);

    -- Kiểm tra xem email có tồn tại trong hệ thống không
    IF NOT EXISTS (SELECT 1 FROM KhachHangQM WHERE Email = @Email)
    BEGIN
        PRINT 'Email không tồn tại.';
        RETURN;
    END

    -- Lấy mật khẩu đã mã hóa từ cơ sở dữ liệu
    SELECT @MatKhauDB = MatKhau FROM KhachHangQM WHERE Email = @Email;

    -- So sánh mật khẩu nhập vào với mật khẩu trong cơ sở dữ liệu
    IF @MatKhau = @MatKhauDB
    BEGIN
        -- Cập nhật thời gian đăng nhập lần cuối
        UPDATE KhachHangQM 
        SET LanDangNhapCuoi = GETDATE()
        WHERE Email = @Email;
        
        PRINT 'Đăng nhập thành công!';
    END
    ELSE
    BEGIN
        PRINT 'Mật khẩu không chính xác.';
    END
END;

EXEC sp_LoginCustomer
	@Email = 'unique_c@example.com',
	@MatKhau = 'hashedpassword3'

select * from KhachHangQM
select * from LichSuKhachHang
go
--Cap nhat trang thai don hang
CREATE PROCEDURE sp_UpdateOrderStatus
    @MaDH INT,
    @TrangThai NVARCHAR(50)
AS
BEGIN
    UPDATE DonHangQM
    SET TrangThai = @TrangThai
    WHERE MaDH = @MaDH;
END;

EXEC sp_UpdateOrderStatus
	@MaDH = 1,
	@TrangThai = 'Hoan thanh';


go
--Xoa khach hang theo MaKH
CREATE PROCEDURE sp_DeleteCustomer
    @MaKH INT
AS
BEGIN
    DELETE FROM KhachHangQM WHERE MaKH = @MaKH;
END;

EXEC sp_DeleteCustomer
	@MaKH = 12;


go
--chen san pham moi vao bang donhangqm
CREATE PROCEDURE sp_AddProduct
	@MaSP INT,
    @TenSP NVARCHAR(100),
    @MoTa TEXT,
    @GiaSP DECIMAL(10,2)
AS
BEGIN
    INSERT INTO SanPhamQM (MaSP, TenSP, MoTa, GiaSP)
    VALUES (@MaSP, @TenSP, @MoTa, @GiaSP);
END;

EXEC sp_AddProduct
	@MaSP = 11,
	@TenSP = 'Mouse',
	@MoTa = 'Logitech L102',
	@GiaSP = '50.00';


go
CREATE INDEX idx_LichSuKhachHang_MaKH
ON LichSuKhachHang (MaKH);

CREATE INDEX idx_DonHang_MaKH 
ON DonHangQM (MaKH);

CREATE INDEX idx_DonHang_TrangThai 
ON DonHangQM (TrangThai);

CREATE INDEX idx_ChiTietDonHang_MaSP 
ON ChiTietDonHangQM (MaSP);

CREATE INDEX idx_ChiTietDonHang_MaDH 
ON ChiTietDonHangQM (MaDH);

CREATE INDEX idx_SanPham_MaSP 
ON SanPhamQM (MaSP);

CREATE INDEX idx_DonHang_NgayDatHang 
ON DonHangQM (NgayDatHang);

CREATE INDEX idx_DonHang_MaKH_NgayDatHang 
ON DonHangQM (MaKH, NgayDatHang);

