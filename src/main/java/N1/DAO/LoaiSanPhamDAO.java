package N1.DAO;

import java.util.List;

import N1.entity.LoaiSanPham;

public interface LoaiSanPhamDAO {
    public List<LoaiSanPham> findAll();
    public List<LoaiSanPham> findAll(int page);
    public int getNumberOfPage();
}
