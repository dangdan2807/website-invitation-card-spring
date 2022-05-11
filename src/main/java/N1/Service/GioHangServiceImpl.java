package N1.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import N1.DAO.GioHangDAO;
import N1.entity.GioHang;
import N1.entity.SanPham;

@Service
public class GioHangServiceImpl implements GioHangService {

	@Autowired
	private GioHangDAO gioHangDAO;
	
	@Override
	@Transactional
	public void deleteGioHangByIdNguoiDung(int maND) {
		gioHangDAO.deleteGioHangByIdNguoiDung(maND);
		
	}

	@Override
	@Transactional
	public boolean saveGioHang(GioHang gioHang) {
		return gioHangDAO.saveGioHang(gioHang);
	}

	@Override
	@Transactional
	public int getNumOfSanPhamInGioHangByEmail(String email) {
		return gioHangDAO.getNumOfSanPhamInGioHangByEmail(email);
	}
}
