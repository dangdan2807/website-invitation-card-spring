package N1.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import N1.entity.ChucVu;
import N1.entity.NguoiDung;
import N1.entity.TaiKhoan;

@Repository
public class NguoiDungDAOImpl implements NguoiDungDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<NguoiDung> getDSNguoiDung() {
        Session currentSession = sessionFactory.getCurrentSession();
        String queryStr = "SELECT nd.maND, nd.tenND, nd.diaChi, nd.sdt, "
                + "tk.tenDangNhap, tk.tinhTrang, "
                + "cv.maChucVu, cv.tenChucVu "
                + "FROM NguoiDung nd, TaiKhoan tk, ChucVu cv "
                + "WHERE nd.email = tk.tenDangNhap "
                + "AND tk.maChucVu = cv.maChucVu";
        List<Object[]> results = currentSession.createNativeQuery(queryStr).getResultList();
        List<NguoiDung> dataList = new ArrayList<>();

        results.stream().forEach(item -> {
            int maHD = Integer.parseInt(item[0].toString());
            String tenND = item[1].toString();
            String diaChi = item[2].toString();
            String sdt = item[3].toString();
            String tenDangNhap = item[4].toString();
            int tinhTrang = Integer.parseInt(item[5].toString());
            int maChucVu = Integer.parseInt(item[6].toString());
            String tenChucVu = item[7].toString();

            ChucVu chucVu = new ChucVu(maChucVu, tenChucVu);
            TaiKhoan taiKhoan = new TaiKhoan(tenDangNhap, tinhTrang, chucVu);
            dataList.add(new NguoiDung(maHD, tenND, diaChi, sdt, taiKhoan));
        });
        return dataList;
    }

}
