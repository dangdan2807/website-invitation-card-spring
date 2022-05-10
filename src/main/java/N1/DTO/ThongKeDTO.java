package N1.Dto;

import java.util.Date;
import java.util.List;
import java.util.Map;

import N1.Service.ThongKeServiceImpl.LabelCount;

public interface ThongKeDTO {
	public long tongDoanhThu(Date from, Date to);
	public long tongLoiNhuan(Date from, Date to);
	public int tongSoDonHang(Date from, Date to);
	public int tongSoThiepBan(Date from, Date to);
	public LabelCount soDanhMucBanRa(Date from, Date to);
	public LabelCount soSanPhamBanRa(Date from, Date to);
	
}
