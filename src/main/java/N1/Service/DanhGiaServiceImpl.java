package N1.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import N1.DAO.DanhGiaDAO;
import N1.entity.DanhGia;

@Service
public class DanhGiaServiceImpl implements DanhGiaService {
	@Autowired
	private DanhGiaDAO danhGiaDAO;

	@Override
	@Transactional
	public List<DanhGia> getDanhGiasByIdSanPham(int idSanPham) {
		return danhGiaDAO.getDanhGiasByIdSanPham(idSanPham);
	}

	@Override
	@Transactional
	public List<DanhGia> getDsDanhGias() {
		return danhGiaDAO.getDsDanhGias();
	}
}
