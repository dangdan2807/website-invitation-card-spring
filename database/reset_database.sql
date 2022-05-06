USE master;
GO
ALTER DATABASE web_invitation_cards SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
drop database web_invitation_cards;


use web_invitation_cards
go

update TOP (1) DanhGia
set thoiGian = '2021-04-01 10:00:00'
where maSP = 6
and thoiGian != '2022-04-01'
and xepHang = 1