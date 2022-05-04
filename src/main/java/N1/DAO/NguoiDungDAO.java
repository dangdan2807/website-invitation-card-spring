package N1.DAO;

import java.util.List;

import N1.entity.NguoiDung;

public interface NguoiDungDAO {
    public List<NguoiDung> getDSNguoiDung();
    public NguoiDung addNguoiDung(NguoiDung nguoiDung);
    public boolean updateNguoiDung(NguoiDung nguoiDung);
    public NguoiDung findNguoiDungByEmail(String email);
    public NguoiDung findNguoiDungById(int id);
}
