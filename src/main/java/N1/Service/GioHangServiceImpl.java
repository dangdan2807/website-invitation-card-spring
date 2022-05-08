package N1.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import N1.DAO.GioHangDAO;

@Service
public class GioHangServiceImpl implements GioHangService {

	@Autowired
	private GioHangDAO gioHangDAO;
	@Override
	@Transactional
	public void deleteGioHangByIdNguoiDung(int maND) {
		gioHangDAO.deleteGioHangByIdNguoiDung(maND);
		
	}

}
