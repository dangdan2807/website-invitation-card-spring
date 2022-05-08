package N1.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import N1.DAO.CTHoaDonDAO;
import N1.entity.ChiTietHoaDon;

@Service
public class CTHoaDonServiceImpl implements CTHoaDonService {
	@Autowired
	private CTHoaDonDAO ctHoaDonDAO;

	@Override
	@Transactional
	public List<ChiTietHoaDon> getDSCTHoaDon() {
		return ctHoaDonDAO.getDSCTHoaDon();
	}

	@Override
	@Transactional
	public ChiTietHoaDon addChiTietHoaDon(ChiTietHoaDon chiTietHoaDon) {
		
		return ctHoaDonDAO.addChiTietHoaDon(chiTietHoaDon);
	}

}
