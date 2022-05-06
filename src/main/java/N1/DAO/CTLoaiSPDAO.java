package N1.DAO;

import java.util.List;

import N1.entity.ChiTietLoaiSP;
import N1.entity.SanPham;

public interface CTLoaiSPDAO {
    public List<ChiTietLoaiSP> getDSChiTietLoaiSP();
    public List<ChiTietLoaiSP> getDSCTLSPByMaSP(int maSp);
    public void save(ChiTietLoaiSP chiTietLoaiSP);
    public void updateChiTietLoaiSP(SanPham sanPham);
    public void delete(ChiTietLoaiSP chiTietLoaiSP);
}
