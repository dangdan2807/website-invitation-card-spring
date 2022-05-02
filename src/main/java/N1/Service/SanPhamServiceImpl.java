package N1.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import N1.DAO.SanPhamDAO;
import N1.entity.SanPham;

@Service
public class SanPhamServiceImpl implements SanPhamService {

    @Autowired
    private SanPhamDAO sanPhamDAO;

    @Override
    @Transactional
    public List<SanPham> getDSSanPham() {
        return sanPhamDAO.getDSSanPham();
    }

	@Override
    @Transactional
	public List<SanPham> getDSSanPham(int page) {
		return sanPhamDAO.getDSSanPham(page);
	}

	@Override
    @Transactional
	public int getNumberOfPage() {
		// TODO Auto-generated method stub
		return sanPhamDAO.getNumberOfPage();
	}

}
