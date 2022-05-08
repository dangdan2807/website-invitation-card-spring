package N1.Service;

import java.text.NumberFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import N1.DAO.SanPhamDAO;
import N1.Dto.SanPhamMua;
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
	public List<SanPhamMua> getSanPhamMua( int maNguoiDung) {
		
		return sanPhamDAO.getSanPhamMua(maNguoiDung);
	}

	@Override
	@Transactional
	public SanPham getSanPhamByIdSanPham(int sanPhamId) {
		
		return sanPhamDAO.getSanPhamByIdSanPham(sanPhamId);
	}

}
