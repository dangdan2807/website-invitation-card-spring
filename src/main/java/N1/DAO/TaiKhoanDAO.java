package N1.DAO;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetails;

import N1.entity.NguoiDung;
import N1.entity.TaiKhoan;

public interface TaiKhoanDAO {
    public List<TaiKhoan> getDSTaiKhoan();
    public boolean doesUserExist(String email);
    public NguoiDung createUser(NguoiDung nguoiDung);
    public boolean updateTaiKhoan(TaiKhoan taiKhoan);
}
