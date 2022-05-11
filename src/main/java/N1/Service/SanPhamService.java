package N1.Service;

import java.util.List;

import N1.DTO.SanPhamMua;
import N1.entity.SanPham;

public interface SanPhamService {
	public List<SanPham> getDSSanPham();

	public List<SanPham> getDSSanPham(int page);

	public List<SanPham> getDSSanPham(int page, String sort, String tenSanPham, double minPrice, double maxPrice);

	public List<SanPham> getSanPhamsByCategoryId(int page, String sort, String tenSanPham, double minPrice,
			double maxPrice, int categoryId);

	public SanPham getSanPhamByIdSanPham(int sanPhamId);

	public List<SanPham> getSanPhamsByTenSanPham(String tenSP);

	public List<SanPham> getSanPhamsByTenSanPhamAndPage(String tenSP, int page, String sort);

	public int getNumberOfPage();

	public void save(SanPham sanPham);

	public void delete(int maSp);

	public SanPham getLatestSanPham();

	public List<SanPham> getLatestSanPhams(int numOfLines);

	public List<SanPham> getRatedTopSanPhams(int numOfLines);

	public List<SanPham> getDiscountSanPhams(int numOfLines);

	public int getNumberOfSanPhams();

	public int getNumberOfSanPhamsByTenSp(String tenSanPham);

	public int getNumberOfSanPhamsByTenSpAndPrice(String tenSanPham, double minPrice, double maxPrice);
	
	public int getNumberOfSanPhamsByCategoryId(String tenSanPham, double minPrice, double maxPrice, int categoryId);

	public List<SanPham> getReviewSanPhams(int numOfLines);

	public List<SanPham> getFeaturedSanPhams(int numOfLines);

	public List<SanPham> getSanPhamsByCategoryId(int categoryId, int numOfLines);

	public List<SanPhamMua> getSanPhamMua(int maNguoiDung);

	public List<SanPham> getRandomSanPhamsByCategoryId(int categoryId, int numOfLines, int currentSanPhamId);
}
