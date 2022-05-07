package N1.Service;

import java.util.Date;

public interface ThongKeService {
	public long tongDoanhThu(Date from, Date to);
	public long tongLoiNhuan(Date from, Date to);
	public int tongSoDonHang(Date from, Date to);
	public int tongSoThiepBan(Date from, Date to);
}
