package N1.Service;

import java.util.List;

import N1.entity.NguoiDung;

public interface NguoiDungService {
    public List<NguoiDung> findAll();
    public List<NguoiDung> findAll(int page);
    public int getNumberOfPage();
    public void save(NguoiDung nguoiDung);
    public NguoiDung findNguoiDungById(int id);
    public NguoiDung findNguoiDungByEmail(String email);
}
