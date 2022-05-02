package N1.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import N1.DAO.ChucVuDAO;
import N1.entity.ChucVu;

@Service
public class ChucVuServiceImpl implements ChucVuService {

	@Autowired
	private ChucVuDAO chucVuDAO;
	
	@Override
	@Transactional
	public List<ChucVu> getDSChucVu() {
		return chucVuDAO.getDSChucVu();
	}

}
