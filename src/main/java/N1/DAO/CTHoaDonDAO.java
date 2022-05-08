package N1.DAO;

import java.util.List;

import N1.entity.ChiTietHoaDon;

public interface CTHoaDonDAO {
    public List<ChiTietHoaDon> getDSCTHoaDon();
    public ChiTietHoaDon addChiTietHoaDon(ChiTietHoaDon chiTietHoaDon);
}
