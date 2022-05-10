package N1.DAO;

import N1.entity.*;

public interface GioHangDAO {
	public void deleteGioHangByIdNguoiDung(int maND);
	
	public boolean saveGioHang(GioHang gioHang);
}
