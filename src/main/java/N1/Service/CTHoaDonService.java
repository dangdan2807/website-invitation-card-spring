package N1.Service;

import java.util.List;

import N1.entity.ChiTietHoaDon;

public interface CTHoaDonService {
    public List<ChiTietHoaDon> getDSCTHoaDon();
    public ChiTietHoaDon addChiTietHoaDon(ChiTietHoaDon chiTietHoaDon);
    public List<ChiTietHoaDon> getChiTietHoaDonByMaHD(int maHD);
}
