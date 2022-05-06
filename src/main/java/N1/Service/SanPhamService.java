package N1.Service;

import java.util.List;

import N1.entity.SanPham;

public interface SanPhamService {
	public List<SanPham> getDSSanPham();

	public List<SanPham> getDSSanPham(int page);

	public List<SanPham> getDSSanPham(int page, String sort);
	
	public SanPham getSanPhamByIdSanPham(int sanPhamId);

	public int getNumberOfPage();

	public void save(SanPham sanPham);

	public void delete(int maSp);

	public SanPham getLatestSanPham();

	public List<SanPham> getLatestSanPhams(int numOfLines);

	public List<SanPham> getRatedTopSanPhams(int numOfLines);

	public List<SanPham> getDiscountSanPhams(int numOfLines);

	public int getNumberOfSanPhams();

	public List<SanPham> getReviewSanPhams(int numOfLines);
	
	public List<SanPham> getFeaturedSanPhams(int numOfLines);
	
	public List<SanPham> getSanPhamsByCategoryId(int categoryId, int numOfLines);

	public List<SanPham> getRandomSanPhamsByCategoryId(int categoryId, int numOfLines, int currentSanPhamId);
}
