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
	public List<DanhGia> getDanhGiasBySanPhamIdAndPageNumber(int idSanPham, int pageNumber) {
		return danhGiaDAO.getDanhGiasByIdSanPhamAndPageNumber(idSanPham, pageNumber);
	}

	@Override
	@Transactional
	public List<DanhGia> getDsDanhGias() {
		return danhGiaDAO.getDsDanhGias();
	}

	@Override
	@Transactional
	public int getNumberOfDanhGiaBySanPhamId(int sanPhamId) {
		return danhGiaDAO.getNumberOfDanhGiaBySanPhamId(sanPhamId);
	}

	@Override
	@Transactional
	public boolean addDanhGia(DanhGia danhGia) {
		return danhGiaDAO.addDanhGia(danhGia);
	}
}
