package N1.DAO;

import java.util.List;

import N1.entity.*;

public interface NguoiDungDAO {
    public List<NguoiDung> findAll();
    public List<NguoiDung> findAll(int page);
    public int getNumberOfPage(); 
    public void delete(int maND);
    public List<NguoiDung> getDSNguoiDung();
    public NguoiDung addNguoiDung(NguoiDung nguoiDung);
    public boolean updateNguoiDung(NguoiDung nguoiDung);
    public NguoiDung findNguoiDungByEmail(String email);
    public NguoiDung findNguoiDungById(int id);
}
