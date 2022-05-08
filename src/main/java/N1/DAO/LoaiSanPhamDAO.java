package N1.DAO;

import java.util.List;

import N1.entity.LoaiSanPham;

public interface LoaiSanPhamDAO {
	public List<LoaiSanPham> findAll();

	public List<LoaiSanPham> findAll(int page);
	
	public LoaiSanPham findById(int id);

	public int getNumberOfPage();

	public void save(LoaiSanPham lsp);

	public void delete(int maLSP);

	public List<LoaiSanPham> getDSLoaiSanPham();

	public boolean addLoaiSanPham(LoaiSanPham loaiSanPham);
}
