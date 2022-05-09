package N1.Service;

import N1.entity.*;

public interface GioHangService {
	public void deleteGioHangByIdNguoiDung(int maND);
	
	public boolean saveGioHang(GioHang gioHang);
}
