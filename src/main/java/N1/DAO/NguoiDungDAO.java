package N1.DAO;

import java.util.List;

import N1.entity.NguoiDung;

public interface NguoiDungDAO {
    public List<NguoiDung> findAll();
    public List<NguoiDung> findAll(int page);
    public int getNumberOfPage(); 
}
