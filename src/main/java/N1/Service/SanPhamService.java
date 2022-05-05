package N1.Service;

import java.util.List;

import N1.entity.SanPham;

public interface SanPhamService {
	public List<SanPham> getDSSanPham();

	public List<SanPham> getDSSanPham(int page);

	public List<SanPham> getDSSanPham(int page, String sort);

	public int getNumberOfPage();

	public void save(SanPham sanPham);

	public void delete(int maSp);

	public SanPham getLatestSanPham();

	public List<SanPham> getLatestSanPhams(int quantity);

	public List<SanPham> getRatedTopSanPhams(int quantity);

	public List<SanPham> getDiscountSanPhams(int quantity);

	public int getNumberOfSanPhams();

	public List<SanPham> getReviewSanPhams(int quantity);
}
