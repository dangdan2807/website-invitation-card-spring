package N1.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import N1.entity.ChiTietHoaDon;
import N1.entity.HoaDon;
import N1.DAO.CTHoaDonDAO;
import N1.DAO.HoaDonDAO;

@Service
public class HoaDonServiceImpl implements HoaDonService {
	@Autowired
	private HoaDonDAO hoaDonDAO;
	
	@Autowired
	private CTHoaDonDAO ctHoaDonDAO;

	@Override
	@Transactional
	public List<HoaDon> getDSHoaDon() {
		return hoaDonDAO.getDSHoaDon();
	}

	@Override
	@Transactional
	public HoaDon addHoaDon(HoaDon hoaDon) {

		return hoaDonDAO.addHoaDon(hoaDon);
	}

	@Transactional
	public List<HoaDon> findAll() {
		return hoaDonDAO.findAll();
	}

	@Override
	@Transactional
	public List<HoaDon> findAll(int page) {
		return hoaDonDAO.findAll(page);
	}

	@Override
	@Transactional
	public int getNumberOfPage() {
		return hoaDonDAO.getNumberOfPage();
	}

	@Override
	@Transactional
	public HoaDon findHoaDonById(int maHD) {
		// TODO Auto-generated method stub
		return hoaDonDAO.findHoaDonById(maHD);
	}

	@Override
	@Transactional
	public void delete(int maHD) {
		hoaDonDAO.delete(maHD);
	}

	@Override
	@Transactional
	public  void saveHoaDon(HoaDon hoaDon) {
		int tongTien = 0;
		int soLuong = 0;
		
		for(int i=0; i<hoaDon.getDsCTHoaDon().size(); i++) {
			ChiTietHoaDon cthd = hoaDon.getDsCTHoaDon().get(i);
			tongTien += cthd.getSanPham().getGiaSauGiamGia() * cthd.getSoLuong();
			soLuong += cthd.getSoLuong();
		}
		hoaDon.setTongTien(tongTien);
		hoaDon.setTongSoLuong(soLuong);
		hoaDonDAO.addHoaDon(hoaDon);
		List<ChiTietHoaDon> dscthd = ctHoaDonDAO.getChiTietHoaDonByMaHD(hoaDon.getMaHD());
		dscthd.forEach(cthd -> {
			cthd.setHoaDon(hoaDon);
			ctHoaDonDAO.delete(cthd);
		});
		hoaDon.getDsCTHoaDon().forEach(cthd -> {
			ctHoaDonDAO.addChiTietHoaDon(cthd);
		});
	}

	@Override
	@Transactional
	public List<HoaDon> findHoaDonByUserId(int maND) {
		
		return hoaDonDAO.findHoaDonByUserId(maND);
	}


}
