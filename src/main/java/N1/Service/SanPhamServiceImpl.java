package N1.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	public List<SanPham> getDSSanPham(int page, String sort) {
		return sanPhamDAO.getDSSanPham(page, sort);
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
	public List<SanPham> getLatestSanPhams(int quantity) {
		return sanPhamDAO.getLatestSanPhams(quantity);
	}

	@Override
	@Transactional
	public List<SanPham> getRatedTopSanPhams(int quantity) {
		return sanPhamDAO.getRatedTopSanPhams(quantity);
	}

	@Override
	@Transactional
	public List<SanPham> getDiscountSanPhams(int quantity) {
		return sanPhamDAO.getDiscountSanPhams(quantity);
	}

	@Override
	@Transactional
	public int getNumberOfSanPhams() {
		return sanPhamDAO.getNumberOfSanPhams();
	}

	@Override
	@Transactional
	public List<SanPham> getReviewSanPhams(int quantity) {
		return sanPhamDAO.getReviewSanPhams(quantity);
	}

	@Transactional
	public void save(SanPham sanPham) {
		sanPhamDAO.addSanPham(sanPham);
	}

	@Override
	@Transactional
	public void delete(int maSp) {
		sanPhamDAO.delete(maSp);
	}
}
