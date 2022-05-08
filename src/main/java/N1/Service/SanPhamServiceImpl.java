package N1.Service;

import java.text.NumberFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import N1.DAO.CTLoaiSPDAO;
import N1.DAO.CTLoaiSPDAOImpl;
import N1.DAO.SanPhamDAO;

import N1.Dto.SanPhamMua;
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
	public List<SanPham> getDSSanPham(int page, String sort, String tenSanPham, double minPrice, double maxPrice) {
		return sanPhamDAO.getDSSanPham(page, sort, tenSanPham, minPrice, maxPrice);
	}

	@Override
	@Transactional
	public List<SanPham> getSanPhamsByCategoryId(int page, String sort, String tenSanPham, double minPrice,
			double maxPrice, int categoryId) {
		return sanPhamDAO.getSanPhamsByCategoryId(page, sort, tenSanPham, minPrice, maxPrice, categoryId);
	}

	@Override
	@Transactional
	public SanPham getSanPhamByIdSanPham(int sanPhamId) {
		return sanPhamDAO.getSanPhamByIdSanPham(sanPhamId);
	}

	@Override
	@Transactional
	public List<SanPham> getSanPhamsByTenSanPham(String tenSP) {
		return sanPhamDAO.getSanPhamsByTenSanPham(tenSP);
	}

	@Override
	@Transactional
	public List<SanPham> getSanPhamsByTenSanPhamAndPage(String tenSP, int page, String sort) {
		return sanPhamDAO.getSanPhamsByTenSanPhamAndPage(tenSP, page, sort);
	}

	@Override
	@Transactional
	public int getNumberOfSanPhamsByTenSpAndPrice(String tenSanPham, double minPrice, double maxPrice) {
		return sanPhamDAO.getNumberOfSanPhamsByTenSpAndPrice(tenSanPham, minPrice, maxPrice);
	}

	@Override
	@Transactional
	public int getNumberOfPage() {
		return sanPhamDAO.getNumberOfPage();
	}

	@Override
	@Transactional
	public SanPham getLatestSanPham() {
		return sanPhamDAO.getLatestSanPham();
	}

	@Override
	@Transactional
	public List<SanPham> getLatestSanPhams(int numOfLines) {
		return sanPhamDAO.getLatestSanPhams(numOfLines);
	}

	@Override
	@Transactional
	public List<SanPham> getRatedTopSanPhams(int numOfLines) {
		return sanPhamDAO.getRatedTopSanPhams(numOfLines);
	}

	@Override
	@Transactional
	public List<SanPham> getDiscountSanPhams(int numOfLines) {
		return sanPhamDAO.getDiscountSanPhams(numOfLines);
	}

	@Override
	@Transactional
	public int getNumberOfSanPhams() {
		return sanPhamDAO.getNumberOfSanPhams();
	}

	@Override
	@Transactional
	public List<SanPhamMua> getSanPhamMua( int maNguoiDung) {
		return sanPhamDAO.getSanPhamMua(maNguoiDung);
	}
	
	@Override
	@Transactional
	public int getNumberOfSanPhamsByTenSp(String tenSanPham) {
		return sanPhamDAO.getNumberOfSanPhamsByTenSp(tenSanPham);
	}
	
	@Override
	@Transactional
	public int getNumberOfSanPhamsByCategoryId(String tenSanPham, double minPrice, double maxPrice, int categoryId) {
		return sanPhamDAO.getNumberOfSanPhamsByCategoryId(tenSanPham, minPrice, maxPrice, categoryId);
	}

	@Override
	@Transactional
	public List<SanPham> getReviewSanPhams(int numOfLines) {
		return sanPhamDAO.getReviewSanPhams(numOfLines);
	}

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

	@Override
	@Transactional
	public List<SanPham> getFeaturedSanPhams(int numOfLines) {
		return sanPhamDAO.getFeaturedSanPhams(numOfLines);
	}

	@Override
	@Transactional
	public List<SanPham> getSanPhamsByCategoryId(int categoryId, int numOfLines) {
		return sanPhamDAO.getSanPhamsByCategoryId(categoryId, numOfLines);
	}

	@Override
	@Transactional
	public List<SanPham> getRandomSanPhamsByCategoryId(int categoryId, int numOfLines, int currentSanPhamId) {
		return sanPhamDAO.getRandomSanPhamsByCategoryId(categoryId, numOfLines, currentSanPhamId);
	}
}
