package N1.DAO;

import java.util.List;

import N1.entity.HoaDon;

public interface HoaDonDAO {
    public List<HoaDon> getDSHoaDon();
    public List<HoaDon> findAll();
    public List<HoaDon> findAll(int page);
    public int getNumberOfPage();
}
