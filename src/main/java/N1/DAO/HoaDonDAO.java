package N1.DAO;

import java.util.Date;
import java.util.List;

import N1.entity.HoaDon;

public interface HoaDonDAO {
    public List<HoaDon> getDSHoaDon();
    public List<HoaDon> getHoaDonMoiNhat();
    public List<HoaDon> findHoaDonByDate(Date ngayLapHoaDon);
    public List<HoaDon> findHoaDonBySDTKhachHang(String soDienThoai);
    public HoaDon findHoaDonById(int maHD);
    public HoaDon addHoaDon(HoaDon hoaDon);
}
