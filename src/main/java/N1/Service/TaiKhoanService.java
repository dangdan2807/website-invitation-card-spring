package N1.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import N1.entity.NguoiDung;
import N1.entity.TaiKhoan;

@Service
public interface TaiKhoanService {
    public List<TaiKhoan> getDSTaiKhoan();
    public boolean doesUserExist(String email);
    public NguoiDung createUser(NguoiDung nguoiDung);
    public boolean updateTaiKhoan(TaiKhoan taiKhoan);
}
