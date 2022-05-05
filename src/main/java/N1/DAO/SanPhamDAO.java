package N1.DAO;

import java.util.List;

import N1.entity.SanPham;


public interface SanPhamDAO{
    public List<SanPham> getDSSanPham();
    public List<SanPham> getDSSanPham(int page);
    public int getNumberOfPage();
    public void delete(int maSp);
    public SanPham addSanPham(SanPham sanPham);
    public boolean updateSanPham (int sanPhamId,SanPham sanPham);
    public SanPham getSanPhamByIdSanPham(int sanPhamId);
    public List<SanPham> getSanPhamByTenSanPham(String tenSP);
}
