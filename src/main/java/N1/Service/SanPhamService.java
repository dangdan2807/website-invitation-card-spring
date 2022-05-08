package N1.Service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import N1.Dto.SanPhamMua;
import N1.entity.SanPham;

public interface SanPhamService {
	public List<SanPham> getDSSanPham();

	public List<SanPham> getDSSanPham(int page);

	public int getNumberOfPage();

	public SanPham getLatestSanPham();

	public List<SanPham> getLatestSanPhams(int quantity);
	
	public List<SanPham> getRatedTopSanPhams(int quantity);
	
	public List<SanPham> getDiscountSanPhams(int quantity);
	
	public int getNumberOfSanPhams();
	public SanPham getSanPhamByIdSanPham(int sanPhamId);
	public List<SanPhamMua> getSanPhamMua(int maNguoiDung);
}
