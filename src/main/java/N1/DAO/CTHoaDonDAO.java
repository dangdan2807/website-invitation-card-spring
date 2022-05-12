package N1.DAO;

import java.util.List;

import N1.entity.ChiTietHoaDon;

public interface CTHoaDonDAO {
    public List<ChiTietHoaDon> getDSCTHoaDon();

    public List<ChiTietHoaDon> getDSCTHoaDonByMaHD(int mHD);

    public ChiTietHoaDon addChiTietHoaDon(ChiTietHoaDon chiTietHoaDon);

    public List<ChiTietHoaDon> getChiTietHoaDonByMaHD(int maHD);

    public void delete(ChiTietHoaDon chiTietHoaDon);
}
