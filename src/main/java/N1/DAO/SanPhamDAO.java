package N1.DAO;

import java.util.List;

import N1.entity.SanPham;

public interface SanPhamDAO {
	public List<SanPham> getDSSanPham();

	public List<SanPham> getDSSanPham(int page, String sort);

	public int getNumberOfPage();

	public SanPham addSanPham(SanPham sanPham);

	public boolean updateSanPham(int sanPhamId, SanPham sanPham);

    public List<SanPham> getDSSanPham(int page);

	public SanPham getSanPhamByIdSanPham(int sanPhamId);

	public List<SanPham> getSanPhamByTenSanPham(String tenSP);

	public SanPham getLatestSanPham();

	public List<SanPham> getLatestSanPhams(int numOfLines);
	
	public List<SanPham> getRatedTopSanPhams(int numOfLines);
	
	public List<SanPham> getDiscountSanPhams(int numOfLines);
	
	public int getNumberOfSanPhams();
	
	public List<SanPham> getReviewSanPhams(int numOfLines);

    public void delete(int maSp);
    
    public List<SanPham> getFeaturedSanPhams(int numOfLines);
    
    public List<SanPham> getSanPhamsByCategoryId(int categoryId, int numOfLines);
    
    public List<SanPham> getRandomSanPhamsByCategoryId(int categoryId, int numOfLines, int currentSanPhamId);
}
