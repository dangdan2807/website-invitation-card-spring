package N1.Service;

import java.util.List;

import N1.entity.HoaDon;

public interface HoaDonService {
    public List<HoaDon> getDSHoaDon();
    public HoaDon addHoaDon(HoaDon hoaDon);
}
