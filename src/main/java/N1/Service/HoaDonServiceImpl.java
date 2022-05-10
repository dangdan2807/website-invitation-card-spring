package N1.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import N1.entity.HoaDon;
import N1.DAO.HoaDonDAO;

@Service
public class HoaDonServiceImpl implements HoaDonService {
	@Autowired
	private HoaDonDAO hoaDonDAO;

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
	public List<HoaDon> findHoaDonByUserId(int maND) {
		
		return hoaDonDAO.findHoaDonByUserId(maND);
	}

	@Override
	public HoaDon findHoaDonById(int maHD) {
		
		return hoaDonDAO.findHoaDonById(maHD);
	}

}
