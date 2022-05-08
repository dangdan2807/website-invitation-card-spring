package N1.DAO;

import java.util.List;

import N1.DTO.SanPhamMua;
import N1.entity.SanPham;

public interface SanPhamDAO {
	public List<SanPham> getDSSanPham();

	public List<SanPham> getDSSanPham(int pageNumber);

	public List<SanPham> getSanPhamsByCategoryId(int pageNumber, String sort, String tenSanPham, double minPrice,
			double maxPrice, int categoryId);

	public int getNumberOfPage();

	public SanPham addSanPham(SanPham sanPham);

	public boolean updateSanPham(int sanPhamId, SanPham sanPham);

	public SanPham getSanPhamByIdSanPham(int sanPhamId);

	public SanPham getLatestSanPham();

	public List<SanPham> getLatestSanPhams(int quantity);

	public List<SanPham> getRatedTopSanPhams(int quantity);

	public List<SanPham> getDiscountSanPhams(int quantity);

	public int getNumberOfSanPhams();

	public List<SanPhamMua> getSanPhamMua(int maNguoiDung);

	public List<SanPham> getDSSanPham(int pageNumber, String sort, String tenSanPham, double minPrice, double maxPrice);

	public List<SanPham> getSanPhamsByTenSanPham(String tenSP);

	public List<SanPham> getSanPhamsByTenSanPhamAndPage(String tenSP, int pageNumber, String sort);

	public int getNumberOfSanPhamsByTenSp(String tenSanPham);

	public int getNumberOfSanPhamsByTenSpAndPrice(String tenSanPham, double minPrice, double maxPrice);

	public int getNumberOfSanPhamsByCategoryId(String tenSanPham, double minPrice, double maxPrice, int categoryId);

	public List<SanPham> getReviewSanPhams(int numOfLines);

	public void delete(int maSp);

	public List<SanPham> getFeaturedSanPhams(int numOfLines);

	public List<SanPham> getSanPhamsByCategoryId(int categoryId, int numOfLines);

	public List<SanPham> getRandomSanPhamsByCategoryId(int categoryId, int numOfLines, int currentSanPhamId);
}
