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

}
