package N1.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import N1.DAO.LoaiSanPhamDAO;
import N1.entity.LoaiSanPham;

@Service
public class LoaiSanPhamServiceImpl implements LoaiSanPhamService {
    @Autowired
    private LoaiSanPhamDAO loaiSanPhamDAO;

    @Override
    @Transactional
    public List<LoaiSanPham> findAll() {
        return loaiSanPhamDAO.findAll();
    }

	@Override
    @Transactional
	public List<LoaiSanPham> findAll(int page) {
		return loaiSanPhamDAO.findAll(page);
	}

	@Override
    @Transactional
	public int getNumberOfPage() {
		return loaiSanPhamDAO.getNumberOfPage();
	}

	@Override
    @Transactional
	public void save(LoaiSanPham lsp) {
		loaiSanPhamDAO.save(lsp);
	}

	@Override
    @Transactional
	public void delete(int maLSP) {
		loaiSanPhamDAO.delete(maLSP);
	}
}
