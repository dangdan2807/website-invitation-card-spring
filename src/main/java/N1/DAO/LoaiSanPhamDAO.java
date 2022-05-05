package N1.DAO;

import java.util.List;

import N1.entity.LoaiSanPham;

public interface LoaiSanPhamDAO {
    public List<LoaiSanPham> getDSLoaiSanPham();
    public boolean addLoaiSanPham(LoaiSanPham loaiSanPham);
}
