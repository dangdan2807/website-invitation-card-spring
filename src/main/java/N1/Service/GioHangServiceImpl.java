package N1.Service;

import java.util.List;

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
	public List<GioHang> getDSGioHang() {
		// TODO Auto-generated method stub
		return gioHangDAO.getDSGioHang();
	}

	@Override
	@Transactional
	public List<GioHang> findAll() {
		// TODO Auto-generated method stub
		return gioHangDAO.findAll();
	}

	@Override
	@Transactional
	public List<GioHang> findAll(int page) {
		// TODO Auto-generated method stub
		return gioHangDAO.findAll(page);
	}

	@Override
	@Transactional
	public int getNumberOfPage() {
		// TODO Auto-generated method stub
		return gioHangDAO.getNumberOfPage();
	}

	@Override
	@Transactional
	public GioHang addGioHang(GioHang gioHang) {
		// TODO Auto-generated method stub
		return gioHangDAO.addGioHang(gioHang);
	}

	@Override
	@Transactional
	public List<GioHang> findGioHangByUserId(int maND) {
		// TODO Auto-generated method stub
		return gioHangDAO.findGioHangByUserId(maND);
	}

}
