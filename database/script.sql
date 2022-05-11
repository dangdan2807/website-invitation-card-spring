USE master
GO

--drop database web_invitation_cards
go

USE web_invitation_cards
GO

insert into ChucVu(tenChucVu)
VALUES 
(N'ROLE_ADMIN'),
(N'ROLE_CUSTOMER')
GO

insert into TaiKhoan(tenDangNhap, matKhau, tinhTrang, maChucVu) 
VALUES
-- password: 123
('huynhtuananh@gmail.com', '{bcrypt}$2a$10$dNHpGRTvK6/bLsRhEZcOXucuEuO2MUNPtGkIbQcocy8vXDGIg7fhu', 1, 1),
('vantin@gmail.com', '{bcrypt}$2a$10$dNHpGRTvK6/bLsRhEZcOXucuEuO2MUNPtGkIbQcocy8vXDGIg7fhu', 1, 2),
('vanbinh@gmail.com', '{bcrypt}$2a$10$dNHpGRTvK6/bLsRhEZcOXucuEuO2MUNPtGkIbQcocy8vXDGIg7fhu', 1, 2),
('vanan@gmail.com', '{bcrypt}$2a$10$dNHpGRTvK6/bLsRhEZcOXucuEuO2MUNPtGkIbQcocy8vXDGIg7fhu', 1, 1),-- tương ứng 1,2,3,4
('tranvannhan@gmail.com', '{bcrypt}$2a$10$dNHpGRTvK6/bLsRhEZcOXucuEuO2MUNPtGkIbQcocy8vXDGIg7fhu', 1, 1),
('dothituongviplic@gmail.com', '{bcrypt}$2a$10$dNHpGRTvK6/bLsRhEZcOXucuEuO2MUNPtGkIbQcocy8vXDGIg7fhu', 1, 1),
('chibao@gmail.com', '{bcrypt}$2a$10$dNHpGRTvK6/bLsRhEZcOXucuEuO2MUNPtGkIbQcocy8vXDGIg7fhu', 1, 1),
('phamdangdan@gmail.com', '{bcrypt}$2a$10$dNHpGRTvK6/bLsRhEZcOXucuEuO2MUNPtGkIbQcocy8vXDGIg7fhu', 1, 1),

('buivinhphuc@gmail.com', '{bcrypt}$2a$10$dNHpGRTvK6/bLsRhEZcOXucuEuO2MUNPtGkIbQcocy8vXDGIg7fhu', 1, 2),
('buixuanhong@gmail.com', '{bcrypt}$2a$10$dNHpGRTvK6/bLsRhEZcOXucuEuO2MUNPtGkIbQcocy8vXDGIg7fhu', 1, 2),
('dominhtuan@gmail.com', '{bcrypt}$2a$10$dNHpGRTvK6/bLsRhEZcOXucuEuO2MUNPtGkIbQcocy8vXDGIg7fhu', 1, 2),
('buithunga@gmail.com', '{bcrypt}$2a$10$dNHpGRTvK6/bLsRhEZcOXucuEuO2MUNPtGkIbQcocy8vXDGIg7fhu', 1, 2),
('thanhnhan@gmail.com', '{bcrypt}$2a$10$dNHpGRTvK6/bLsRhEZcOXucuEuO2MUNPtGkIbQcocy8vXDGIg7fhu', 1, 2),
('mithanh@gmail.com', '{bcrypt}$2a$10$dNHpGRTvK6/bLsRhEZcOXucuEuO2MUNPtGkIbQcocy8vXDGIg7fhu', 1, 2),
('daotrungthu@gmail.com', '{bcrypt}$2a$10$dNHpGRTvK6/bLsRhEZcOXucuEuO2MUNPtGkIbQcocy8vXDGIg7fhu', 1, 2),
('bichlieu@gmail.com', '{bcrypt}$2a$10$dNHpGRTvK6/bLsRhEZcOXucuEuO2MUNPtGkIbQcocy8vXDGIg7fhu', 1, 2),
('bahong@gmail.com', '{bcrypt}$2a$10$dNHpGRTvK6/bLsRhEZcOXucuEuO2MUNPtGkIbQcocy8vXDGIg7fhu', 1, 2),
('leducdung@gmail.com', '{bcrypt}$2a$10$dNHpGRTvK6/bLsRhEZcOXucuEuO2MUNPtGkIbQcocy8vXDGIg7fhu', 1, 2),
('ngochaunhu@gmail.com', '{bcrypt}$2a$10$dNHpGRTvK6/bLsRhEZcOXucuEuO2MUNPtGkIbQcocy8vXDGIg7fhu', 1, 2),
('dinhthuan@gmail.com', '{bcrypt}$2a$10$dNHpGRTvK6/bLsRhEZcOXucuEuO2MUNPtGkIbQcocy8vXDGIg7fhu', 1, 2)
GO

insert into NguoiDung(tenND, diaChi, sdt, maTaiKhoan, hinhAnh)
VALUES 
(N'Nguyen Van Tin', N'Hai Ba Trung', '0123456789', 1, 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
(N'Pham Van Binh', N'Le Loi', '0789126789', 2, 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
(N'Nguyen Van An', N'Nguyen Tat Thanh', '0333456789', 3, 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
(N'Huynh Tuan Anh', N'Le Loi', '0789126689', 4, 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
(N'Tran Van Nhan', N'Nguyen Tat Thanh', '0373456789', 5, 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
(N'Do Thi Tuong Vi', N'Quang Trung', '0974006652', 6, 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
(N'Nguyen Huynh Chi Bao', N'Phan Dinh Phung', '0964567898', 7, 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
(N'Pham Dang Dan', N'Pham Van Dong', '0372345689', 8, 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
(N'Bui Vinh Phuc', N'Quang Trung','0903912540', 9, 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
(N'Bui Xuan Hong', N'Phan Dinh Phung', '0989209286', 10, 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
(N'Do Minh Tuan', N'Pham Van Dong', '0903631264', 11, 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
(N'Bui Thu Nga', N'Hai Ba Trung', '0964567897', 12, 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
(N'Dang Huynh Thanh Nhan', N'Le Loi', '0986020829', 13, 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
(N'Dinh Thi Mi Thanh', N'Nguyen Cong Phuong', '0866718337', 14, 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
(N'Dao Trung Thu', N'Hoang Sa', '0903683668', 15, 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
(N'	Dang Thi Bich Lieu', N'Le Van Chi', '0907225050', 16, 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
(N'Bui Ba Hong', N'Pham Van Dong', '0989991211', 17, 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
(N'Le Duc Dung', N'Nguyen Van Bao','0903734355', 18, 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
(N'Ngo Chau Nhu', N'Nguyen Thai Son', '0918793284', 19, 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
(N'Nguyen Dinh Thuan', N'Phan Huy Ich', '0909522702', 20, 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png')
GO

insert into SanPham(tenSp, hinhAnh, giaSP,moTa,giamGia,giaMua)
VALUES
-- thiệp cưới
(N'Thiệp cưới C443', N'https://inanuuviet.com/wp-content/uploads/2018/09/b109-cr-800x800.png', 10000,N'Glorious -C443 Những chi tiết khắc họa hình ảnh đẹp tráng lệ, thể hiện sự hài hòa giữa đôi chim công và đá quý',5,3000),
(N'Thiệp cưới C518', N'https://inanuuviet.com/wp-content/uploads/2018/09/avar-cr-800x800-300x300.png', 7000,N'Fairy Garden -C518 Tình yêu là những ánh sáng lấp lánh Đèn vàng thắp lên bên ô cửa nhỏ',5,2000),
(N'Thiệp cưới C556', N'https://inanuuviet.com/wp-content/uploads/2018/09/215-cr-800x800-300x300.png', 5000,N'Gorgeous- C556 Tinh tế - Hiện đại',5,1000),
(N'Thiệp cưới C560', N'https://inanuuviet.com/wp-content/uploads/2018/09/avar-cr-800x800-1.png', 10000,N'Postcard 1- C560 Take me to your heart take me to your soul',5,3000),
(N'Thiệp cưới C574', N'https://inanuuviet.com/wp-content/uploads/2018/09/24909617_580511882280290_7348579202905289575_n-300x300.jpg', 10000,N'Save the date -C574 The Simple Love',5,3000),
(N'Thiệp cưới C577', N'https://inanuuviet.com/wp-content/uploads/2018/09/avar-cr-800x800-300x300.jpg', 9000,N'Long Phụng - C577 Truyền thống hiện đại',5,3000),
(N'Thiệp cưới C578', N'https://inanuuviet.com/wp-content/uploads/2018/09/BH7705_img-cr-800x800-300x300.jpg', 10000,N'Song Hỷ - C578 Truyền thống - Hiện đại ',5,3000),
(N'Thiệp cưới C579', N'https://inanuuviet.com/wp-content/uploads/2018/09/35-cr-800x800-300x300.jpg', 12000,N'Moon Light - C579 Sang Trọng - Tinh tế -Hiện đại',5,3000),
(N'Thiệp cưới C590', N'https://inanuuviet.com/wp-content/uploads/2018/09/avar-cr-800x800-1-300x300.jpg', 10000,N'Our story - C590 Sang trọng - Tinh tế',5,3000),
(N'Thiệp cưới TL-366',N'https://inanuuviet.com/wp-content/uploads/2018/09/TL-366-300x300.jpg', 5000,N'Song Hỷ - 366 Truyền thống - Tinh tế',5,2000),
(N'Thiệp cưới TL- 223',N'https://inanuuviet.com/wp-content/uploads/2018/09/TL-223-do-300x300.jpg', 15000,N'Vĩnh Cửu - 223 Rực rỡ - Tinh tế',5,5000),
(N'Thiệp cưới TL-238',N'https://inanuuviet.com/wp-content/uploads/2018/09/TL-238-.jpg', 15000,N'Kỷ niệm - 238 Viên mãn - Hiện đại ',5,5000),
(N'Thiệp cưới TL- 1705',N'https://inanuuviet.com/wp-content/uploads/2018/09/TL-1705.jpg', 10000,N'Nhẹ nhàng - 1705 Hiện đại - Tinh tế',5,5000),
(N'Thiệp cưới DR10',N'https://inanuuviet.com/wp-content/uploads/2018/09/2-cr-800x800-300x300.png', 15000,N'Đơn giản - DR10 Sang trọng - Tao nhã ',5,5000),

(N'Thiệp cưới DQ-2026 Kraft', N'https://inanuuviet.com/wp-content/uploads/2019/08/Dq-2026-kraft.jpg', 10000,N'Glorious -DQ-2026 Kraft Những chi tiết khắc họa hình ảnh đẹp tráng lệ',5,3000),
(N'Thiệp cưới DQ-2027 Đỏ gân', N'https://inanuuviet.com/wp-content/uploads/2019/08/Dq2027-do-gan.jpg', 15000,N'Fairy Garden -DQ-2027 Đỏ gân Tình yêu là những ánh sáng lấp lánh Đèn vàng thắp lên bên ô cửa nhỏ',5,2000),
(N'Thiệp cưới DQ-2027 Giấy Kraft', N'https://inanuuviet.com/wp-content/uploads/2019/08/Dq-2027-gi%E1%BA%A5y-Kraft-300x300.jpg', 5000,N'Gorgeous- DQ-2027 Giấy Kraft Tinh tế - Hiện đại',5,1000),
(N'Thiệp cưới DQ-2030', N'https://inanuuviet.com/wp-content/uploads/2019/09/1557717994-DQ2030OFFSET-300x300.jpg', 10000,N'Postcard 1- DQ-2030 Take me to your heart take me to your soul',5,3000),
(N'Thiệp cưới DQ-2031', N'https://inanuuviet.com/wp-content/uploads/2019/09/DQ-2031-300x300.jpg', 10000,N'Save the date -DQ-2031 The Simple Love',5,3000),
(N'Thiệp cưới DQ-2032', N'https://inanuuviet.com/wp-content/uploads/2019/09/DQ-2032-300x300.jpg', 9000,N'Long Phụng - DQ-2032 Truyền thống hiện đại',5,3000),
(N'Thiệp cưới DQ-2033 Đỏ nhung', N'https://inanuuviet.com/wp-content/uploads/2019/09/DQ-2033-%C4%91%E1%BB%8F-nhung-300x300.jpg', 10000,N'Đỏ nhung - DQ-2033 Truyền thống - Hiện đại ',5,3000),
(N'Thiệp cưới DQ-2034 Kem nhũ', N'https://inanuuviet.com/wp-content/uploads/2019/09/Dq-2034-kem-nh%C5%A9-300x300.jpg', 12000,N'Kem nhũ - DQ-2034 Sang Trọng - Tinh tế -Hiện đại',5,3000),
(N'Thiệp cưới DQ-2035 Đỏ nhung', N'https://inanuuviet.com/wp-content/uploads/2019/09/DQ-2035-%C4%91%E1%BB%8F-nhung-300x300.jpg', 10000,N'Đỏ nhung - DQ-2035 Sang trọng - Tinh tế',5,3000),
(N'Thiệp cưới DQ-2011 Vàng lợt',N'https://inanuuviet.com/wp-content/uploads/2020/09/dq-2111-vang-lot-300x300.jpg', 12000,N'Song Hỷ - DQ-2011 Truyền thống - Tinh tế',5,5000),
(N'Thiệp cưới DQ-2014 Bạc',N'https://inanuuviet.com/wp-content/uploads/2019/07/Thi%E1%BB%87p-c%C6%B0%E1%BB%9Bi-DQ-2014-B%E1%BA%A1c-300x300.jpg', 15000,N'Vĩnh Cửu - DQ-2014 Bạc Nhẹ nhàng - Tinh tế',5,5000),
(N'Thiệp cưới DQ-2014 Nâu',N'https://inanuuviet.com/wp-content/uploads/2019/07/Thi%E1%BB%87p-c%C6%B0%E1%BB%9Bi-DQ-2014-N%C3%A2u-300x300.jpg', 15000,N'Kỷ niệm - DQ-2014 Nâu Viên mãn - Hiện đại ',5,5000),
(N'Thiệp cưới DQ-2012 Offset',N'https://inanuuviet.com/wp-content/uploads/2019/05/DQ-2012-300x300.jpg', 10000,N'Nhẹ nhàng - DQ-2012 Offset Hiện đại - Tinh tế',5,5000),
(N'Thiệp cưới DQ-2026 Dương gân',N'https://inanuuviet.com/wp-content/uploads/2019/08/Dq-2026-d%C6%B0%C6%A1ng-g%C3%A2n-300x300.jpg', 15000,N'Đơn giản - DQ-2026 Sang trọng - Tao nhã ',5,5000),

-- thiệp sinh nhật

(N'Thiệp sinh nhật HQ-204',N'https://cf.shopee.vn/file/f2aaaf64511012169be03cb080c729fb',5000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,1000),
(N'Thiệp sinh nhật HQ-205',N'https://inatp.com/wp-content/uploads/2021/05/t1.jpg',5000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,1000),
(N'Thiệp sinh nhật PNL-008',N'https://inatp.com/wp-content/uploads/2021/05/t2.jpg',5000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,1000 ),
(N'Thiệp sinh nhật PNL-007',N'https://ducquyencards.com/upload/images/2017/06/1497427475-SNN1506K.jpg',6000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,2000),
(N'Thiệp sinh nhật HQ-206',N'https://ducquyencards.com/upload/images/2017/06/1497422413-SNL1503E.jpg',8000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,2000),
(N'Thiệp sinh nhật HQ-207',N'https://ducquyencards.com/upload/images/2017/06/1497422633-SNL1503K.jpg',10000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,3000),
(N'Thiệp sinh nhật SNL-1503',N'https://ducquyencards.com/upload/images/2017/06/1497422137-SNL1503A.jpg',12000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,3000),
(N'Thiệp sinh nhật SNN-1506D',N'https://ducquyencards.com/upload/images/2017/06/1497427159-SNN1506D.jpg',10000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,2000),
(N'Thiệp sinh nhật SNN-1506G',N'https://ducquyencards.com/upload/images/2017/06/1497427316-SNN1506G.jpg',10000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,3000),
(N'Thiệp sinh nhật SNN-1901C',N'https://ducquyencards.com/upload/images/2019/10/1572149085-SNLL1901C.jpg',10000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,3000),
(N'Thiệp sinh nhật ILSN1109A',N'https://ducquyencards.com/upload/images/2017/06/420x420-1497428894-ILSN1109A.jpg',10000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,2000),
(N'Thiệp sinh nhật ILSN1109B',N'https://ducquyencards.com/upload/images/2017/06/420x420-1497429006-ILSN1109B.jpg',10000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,3000),
(N'Thiệp sinh nhật ILSN1109C',N'https://ducquyencards.com/upload/images/2017/06/420x420-1497429082-ILSN1109C.jpg',10000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,3000),

-- thiệp chúc mừng ngày phụ nữ

(N'Thiệp chúc mừng ngày phụ nữ 8-3 PNDL1623',N'https://ducquyencards.com/upload/images/2017/06/1498102054-PNDL1623A.jpg',8000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,3000),
(N'Thiệp chúc mừng ngày phụ nữ 8-3 PNDL1623C',N'https://ducquyencards.com/upload/images/2017/06/1498102105-PNDL1623C.jpg',8000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,3000),
(N'Thiệp chúc mừng ngày phụ nữ 8-3 PNDL1623D',N'https://ducquyencards.com/upload/images/2017/06/420x420-1498102130-PNDL1623D.jpg',8000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,3000),
(N'Thiệp chúc mừng ngày phụ nữ 8-3 PNDL1623E',N'https://ducquyencards.com/upload/images/2017/06/1498102172-PNDL1623E.jpg',8000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,3000),
(N'Thiệp chúc mừng ngày phụ nữ 8-3 PNDL1624B',N'https://ducquyencards.com/upload/images/2017/06/420x420-1498102241-PNL1624B.jpg',8000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,3000),
(N'Thiệp chúc mừng ngày phụ nữ 8-3 PNT1625A',N'https://ducquyencards.com/upload/images/2017/06/420x420-1498102360-PNT1625A.jpg',8000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,3000),
(N'Thiệp chúc mừng ngày phụ nữ 8-3 PNT1625D',N'https://ducquyencards.com/upload/images/2017/06/420x420-1498102442-PNT1625D.jpg',8000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,3000),
(N'Thiệp chúc mừng ngày phụ nữ 8-3 PNT1625E',N'https://ducquyencards.com/upload/images/2017/06/420x420-1498102465-PNT1625E.jpg',8000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,3000),
(N'Thiệp chúc mừng ngày phụ nữ 8-3 PNT1625C',N'https://ducquyencards.com/upload/images/2017/06/420x420-1498102410-PNT1625C.jpg',8000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,3000),
(N'Thiệp chúc mừng ngày phụ nữ 8-3 PNT1627A',N'https://ducquyencards.com/upload/images/2017/06/420x420-1498102680-PNIL1627A.jpg',8000,N'Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon',5,3000),

-- thiệp chúc mừng ngày nhà giáo Việt Nam

(N'Thiệp chúc mừng ngày nhà giáo Việt Nam TCL1601A',N'https://ducquyencards.com/upload/images/2017/06/420x420-1497442559-TCL1601A.jpg',10000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,3000),
(N'Thiệp chúc mừng ngày nhà giáo Việt Nam TCL1601B',N'https://ducquyencards.com/upload/images/2017/06/420x420-1497442650-TCL1601b.jpg',8000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,3000),
(N'Thiệp chúc mừng ngày nhà giáo Việt Nam TCL1601D',N'https://ducquyencards.com/upload/images/2017/06/420x420-1497442800-TCL1601D.jpg',5000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,3000),
(N'Thiệp chúc mừng ngày nhà giáo Việt Nam TCL1601C',N'https://ducquyencards.com/upload/images/2017/06/420x420-1497442713-TCL1601C.jpg',10000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,3000),
(N'Thiệp chúc mừng ngày nhà giáo Việt Nam TCL1601E',N'https://ducquyencards.com/upload/images/2017/06/420x420-1497442848-TCL1601E.jpg',9000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,3000),
(N'Thiệp chúc mừng ngày nhà giáo Việt Nam TCL1601F',N'https://ducquyencards.com/upload/images/2017/06/420x420-1497442910-TCL1601F.jpg',6000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,3000),
(N'Thiệp chúc mừng ngày nhà giáo Việt Nam TCT1602A',N'https://ducquyencards.com/upload/images/2017/06/420x420-1497443000-TCT1602A.jpg',8000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,3000),
(N'Thiệp chúc mừng ngày nhà giáo Việt Nam TCT1602B',N'https://ducquyencards.com/upload/images/2017/06/420x420-1497443074-TCT1602B.jpg',10000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,3000),
(N'Thiệp chúc mừng ngày nhà giáo Việt Nam TCT1602C',N'https://ducquyencards.com/upload/images/2017/06/420x420-1497443226-TCT1602C.jpg',9000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,3000),
(N'Thiệp chúc mừng ngày nhà giáo Việt Nam TCT1602D',N'https://ducquyencards.com/upload/images/2017/06/420x420-1497443252-TCT1602D.jpg',10000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,3000),
(N'Thiệp chúc mừng ngày nhà giáo Việt Nam TCT1602E',N'https://ducquyencards.com/upload/images/2017/06/420x420-1497443316-TCT1602E.jpg',8000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,3000),
(N'Thiệp chúc mừng ngày nhà giáo Việt Nam TCT1602F',N'https://ducquyencards.com/upload/images/2017/06/420x420-1497443346-TCT1602F.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.

* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,3000),

-- thiệp giáng sinh
(N'Thiệp giáng sinh GSL1607A',N'https://ducquyencards.com/upload/images/2017/06/420x420-1497445715-GSL1607A.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,1000),
(N'Thiệp giáng sinh GSL1607B',N'https://ducquyencards.com/upload/images/2017/06/420x420-1497445820-GSL1607B.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,1000),
(N'Thiệp giáng sinh GSL1607C',N'https://ducquyencards.com/upload/images/2017/06/420x420-1497445855-GSL1607C.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,1000),
(N'Thiệp giáng sinh GSL1607D',N'https://ducquyencards.com/upload/images/2017/06/420x420-1497446287-GSL1607D.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.

* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,1000),
(N'Thiệp giáng sinh GSL1607E',N'https://ducquyencards.com/upload/images/2017/06/420x420-1497446324-GSL1607E.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.

* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,1000),
(N'Thiệp giáng sinh GSL1607F',N'https://ducquyencards.com/upload/images/2017/06/420x420-1497446379-GSL1607F.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,1000),

(N'Thiệp giáng sinh DQPT616Do',N'https://ducquyencards.com/upload/images/2017/05/1495996796-DQPT616Do.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.

* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,1000),

(N'Thiệp giáng sinh DQPT616XanhDuong',N'https://ducquyencards.com/upload/images/2017/05/420x420-1495996823-DQPT616XanhDuong.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.

* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,1000),
(N'Thiệp giáng sinh DQPT617TimHoaCa',N'https://ducquyencards.com/upload/images/2017/05/420x420-1495996867-DQPT617TimHoaCa.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.

* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,1000),
(N'Thiệp giáng sinh DQPT618KemGo',N'https://ducquyencards.com/upload/images/2017/05/420x420-1495996901-DQPT618KemGo.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.

* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,1000),
(N'Thiệp giáng sinh DQPT619Do',N'https://ducquyencards.com/upload/images/2017/05/420x420-1495996918-DQPT619Do.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.

* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,1000),
(N'Thiệp giáng sinh DQPT619Xanhreu',N'https://ducquyencards.com/upload/images/2017/05/420x420-1495996932-DQPT619Xanhreu.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,1000),

--thiệp tình nhân

(N'Thiệp tình nhân TNDL1621A ',N'https://ducquyencards.com/upload/images/2017/06/420x420-1498101626-TNDL1621A.jpg',8000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,2000),
(N'Thiệp tình nhân TNDL1621B ',N'https://ducquyencards.com/upload/images/2017/06/420x420-1498101653-TNDL1621B.jpg',10000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,3000),

(N'Thiệp tình nhân TNDL1621C ',N'https://ducquyencards.com/upload/images/2017/06/420x420-1498101675-TNDL1621C.jpg',6000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,2000),
(N'Thiệp tình nhân TNDL1621D ',N'https://ducquyencards.com/upload/images/2017/06/420x420-1498101699-TNDL1621D.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,1000),

(N'Thiệp tình nhân TNDL1621E ',N'https://ducquyencards.com/upload/images/2017/06/420x420-1498101725-TNDL1621E.jpg',8000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,2000),

(N'Thiệp tình nhân TNDL1621F ',N'https://ducquyencards.com/upload/images/2017/06/420x420-1498101746-TNDL1621F.jpg',9000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,3000),

(N'Thiệp tình nhân TNT1622A ',N'https://ducquyencards.com/upload/images/2017/06/420x420-1498101780-TNT1622A.jpg',10000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,3000),

(N'Thiệp tình nhân TNT1622B ',N'https://ducquyencards.com/upload/images/2017/06/420x420-1498101810-TNT1622B.jpg',12000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,3000),

(N'Thiệp tình nhân TNT1622C ',N'https://ducquyencards.com/upload/images/2017/06/420x420-1498101838-TNT1622C.jpg',8000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,2000),

(N'Thiệp tình nhân TNT1622D ',N'https://ducquyencards.com/upload/images/2017/06/420x420-1498101858-TNT1622D.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,2000),

-- thiệp Tết cổ truyền

(N'Thiệp Tết cố truyền LT1321A ',N'https://ducquyencards.com/upload/images/2021/12/1639560801-LT1321A.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,2000),
(N'Thiệp Tết cố truyền LT1321B ',N'https://ducquyencards.com/upload/images/2017/06/420x420-1498099505-LT1321B.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,2000),
(N'Thiệp Tết cố truyền TDL2156A ',N'https://ducquyencards.com/upload/images/2021/12/1639558608-TDL2156A.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,2000),
(N'Thiệp Tết cố truyền TDL2156B ',N'https://ducquyencards.com/upload/images/2021/12/1639558656-TDL2156B.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,2000),
(N'Thiệp Tết cố truyền TDL1712E ',N'https://ducquyencards.com/upload/images/2017/11/420x420-1511496820-TDL1712E.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,2000),
(N'Thiệp Tết cố truyền TDL1712F ',N'https://ducquyencards.com/upload/images/2017/11/420x420-1511496879-TDL1712F.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,2000),
(N'Thiệp Tết cố truyền TDL1712G ',N'https://ducquyencards.com/upload/images/2017/11/420x420-1511496905-TDL1712G.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,2000),
(N'Thiệp Tết cố truyền TDL1307S ',N'https://ducquyencards.com/upload/images/2017/06/420x420-1498099193-TDL1307S.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,2000),
(N'Thiệp Tết cố truyền TDL1612D ',N'https://ducquyencards.com/upload/images/2017/06/420x420-1498099281-TDL1612D.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,2000),
(N'Thiệp Tết cố truyền TDL1612H ',N'https://ducquyencards.com/upload/images/2018/11/420x420-1543311516-TDL1612H.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,2000),
(N'Thiệp Tết cố truyền TDL1612C ',N'https://ducquyencards.com/upload/images/2017/06/420x420-1498099251-TDL1612C.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,2000),
(N'Thiệp Tết cố truyền TDL1712D ',N'https://ducquyencards.com/upload/images/2018/11/420x420-1543311560-TDL1712D.jpg',7000,N' Mỗi thiệp đã bao gồm một bao thư màu kem và một tờ giấy lót phía trong để khách hàng có thể in nội dung lời chúc phù hợp vào trong sau đó dán trở lại trong thiệp.
* Thiệp + bao thư + tờ giấy lót: tất cả được bỏ vào trong 1 bao nilon.',5,2000)
GO

insert into LoaiSanPham(tenLSP, hinhAnh)
VALUES
(N'Thiệp cưới', 'https://inanuuviet.com/wp-content/uploads/2018/09/avar-cr-800x800-300x300.png'),
(N'Thiệp sinh nhật', 'https://ducquyencards.com/upload/images/2017/06/420x420-1497428894-ILSN1109A.jpg'),
(N'Thiệp mừng 8-3', 'https://ducquyencards.com/upload/images/2017/06/420x420-1498102680-PNIL1627A.jpg'),
(N'Thiệp giáng sinh', 'https://ducquyencards.com/upload/images/2017/06/420x420-1497445820-GSL1607B.jpg'),
(N'Thiệp Tết cổ truyền', 'https://ducquyencards.com/upload/images/2021/12/1639560801-LT1321A.jpg'),
(N'Thiệp Tình nhân 14-2', 'https://ducquyencards.com/upload/images/2017/06/420x420-1498101653-TNDL1621B.jpg'),
(N'Thiệp mừng ngáy 20-11', 'https://ducquyencards.com/upload/images/2017/06/420x420-1497442559-TCL1601A.jpg')
GO

insert into ChiTietLoaiSP(maLSP, maSp)
VALUES
-- thiệp cưới
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9),
(1,10),
(1,11),
(1,12),
(1,13),
(1,14),
(1,15),
(1,16),
(1,17),
(1,18),
(1,19),
(1,20),
(1,21),
(1,22),
(1,23),
(1,24),
(1,25),
(1,26),
(1,27),
(1,28),
(1,29),
(1,30),
-- thiệp sinh nhật
(2,31),
(2,32),
(2,33),
(2,34),
(2,35),
(2,36),
(2,37),
(2,38),
(2,39),
(2,40),
(2,41),
(2,42),
(2,43),
-- thiệp 8-3
(3,44),
(3,45),
(3,46),
(3,47),
(3,48),
(3,49),
(3,50),
(3,51),
(3,52),
(3,53),
-- thiệp giáng sinh
(4,66),
(4,67),
(4,68),
(4,69),
(4,70),
(4,71),
(4,72),
(4,73),
(4,74),
(4,75),
(4,76),
(4,77),
(4,64),
(4,65),
-- thiệp Tết cổ truyên
(5,88),
(5,89),
(5,90),
(5,91),
(5,92),
(5,93),
(5,94),
(5,95),
(5,96),
(5,97),
-- thiệp tình nhân
(6,78),
(6,79),
(6,80),
(6,81),
(6,82),
(6,83),
(6,84),
(6,85),
(6,86),
(6,87),
-- thiệp  20-11
(7,54),
(7,55),
(7,56),
(7,57),
(7,58),
(7,59),
(7,60),
(7,61),
(7,62),
(7,63)
GO

insert HoaDon (maKH, ngayLHD, tongSoLuong, tongTien, ngayGiaoHang, trangThaiDonHang, diaChiGiaoHang)
values
(2, '2022-4-26',10,66500,'2022-4-26',N'Chưa thanh toán',N'132 Hai Ba Trung, Quan 2, Thanh pho Ho Chi Minh'),
(10, '2022-4-26',100,475000,'2022-4-26',N'Chưa thanh toán',N'552 Quang Trung, Quan Go Vap, Thanh pho Ho Chi Minh'),
(12, '2022-4-26',20,228000,'2022-4-26',N'Chưa thanh toán',N'478 Pham Van Dong, Quan Binh Thanh, Thanh pho Ho Chi Minh'),
(3, '2022-4-26',30,228000,'2022-4-26',N'Chưa thanh toán',N'132 Hai Ba Trung, Quan 2, Thanh pho Ho Chi Minh'),
(15, '2022-4-26',70,798000,'2022-4-26',N'Chưa thanh toán',N'47 Nguyen Cong Phuong, Quan 12, Thanh pho Ho Chi Minh'),
(16, '2022-4-26',5,33250,'2022-4-26',N'Chưa thanh toán',N'124 Hoang Sa, Quan 3, Thanh pho Ho Chi Minh'),
(10, '2022-4-26',200,2850000,'2022-4-26',N'Chưa thanh toán',N'478 Pham Van Dong, Quan Binh Thanh, Thanh pho Ho Chi Minh'),
(17, '2022-4-26',10,66500,'2022-4-26',N'Chưa thanh toán',N'55 Le Van Chi, TP Thu Duc, Thanh pho Ho Chi Minh'),
(19, '2022-4-26',80,912000,'2022-4-26',N'Chưa thanh toán',N'435 Phan Huy Ich, Quan Go Vap, Thanh pho Ho Chi Minh'),
(15, '2022-4-26',90,76950,'2022-4-26',N'Chưa thanh toán',N'47 Nguyen Cong Phuong, Quan 12, Thanh pho Ho Chi Minh')
go 

insert ChiTietHoaDon(maHD, maSp, soLuong, giaBan)
values
(1,6,90,9000),
(2,82,10,10000),
(3,5,100,5000),
(4,8,20,12000),
(5,62,30,8000),
(6,35,70,12000),
(7,97,5,7000),
(8,11,200,15000),
(9,65,10,7000),
(10,24,80,12000)
GO

-- xếp hạng là sao
insert DanhGia(maND, maSP, noiDung, thoiGian, xepHang)
values
(2,6,'San pham dep, giao hang nhanh chong','2022-4-26',5),
(3,82,'San pham dep, giao hang nhanh chong','2022-4-26',4),
(4,5,'San pham dep, giao hang nhanh chong','2022-4-26',3),
(5,8,'San pham dep, giao hang nhanh chong','2022-4-26',2),
(6,62,'San pham dep, giao hang nhanh chong','2022-4-26',1),
(7,35,'San pham dep, giao hang nhanh chong','2022-4-26',1),
(8,97,'San pham dep, giao hang nhanh chong','2022-4-26',2),
(9,11,'San pham dep, giao hang nhanh chong','2022-4-26',3),
(10,65,'San pham dep, giao hang nhanh chong','2022-4-26',4),
(11,24,'San pham dep, giao hang nhanh chong','2022-4-26',5)
GO

insert GioHang(maND, maSp, soLuong)
values
(2,6,90),
(3,82,100),
(4,5,100),
(5,8,20),
(6,62,30),
(7,35,70),
(8,97,5),
(9,11,200),
(10,65,10),
(11,24,80)
GO

USE master
GO
