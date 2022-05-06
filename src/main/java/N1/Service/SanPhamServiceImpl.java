package N1.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import N1.DAO.CTLoaiSPDAO;
import N1.DAO.CTLoaiSPDAOImpl;
import N1.DAO.SanPhamDAO;
import N1.entity.ChiTietLoaiSP;
import N1.entity.SanPham;

@Service
public class SanPhamServiceImpl implements SanPhamService {

    @Autowired
    private SanPhamDAO sanPhamDAO;
    
    @Autowired
    private CTLoaiSPDAO ctLoaiSPDAO;

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

	@Override
    @Transactional
	public void save(SanPham sanPham) {
		sanPhamDAO.addSanPham(sanPham);
		List<ChiTietLoaiSP> dsctlsp = ctLoaiSPDAO.getDSCTLSPByMaSP(sanPham.getMaSp());
		System.out.println(dsctlsp);
		dsctlsp.forEach(ctlsp -> {
			ctlsp.setSanPham(sanPham);
			ctLoaiSPDAO.delete(ctlsp);
		});
		sanPham.getDsLoaiSP().forEach(ctlsp -> {
			ctlsp.setSanPham(sanPham);
			ctLoaiSPDAO.save(ctlsp);
		});
	}

	@Override
    @Transactional
	public void delete(int maSp) {
		sanPhamDAO.delete(maSp);
	}

}
