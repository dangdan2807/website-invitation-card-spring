package N1.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import N1.entity.ChucVu;
import N1.entity.TaiKhoan;

@Repository
public class TaiKhoanDAOImpl implements TaiKhoanDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<TaiKhoan> getDSTaiKhoan() {
        Session currentSession = sessionFactory.getCurrentSession();
        String queryStr = "SELECT tk.tenDangNhap, tk.tinhTrang, ck.maChucVu, ck.tenChucVu "
                + "FROM TaiKhoan tk, ChucVu ck "
                + "WHERE tk.maChucVu = ck.maChucVu";
        List<Object[]> results = currentSession.createNativeQuery(queryStr).getResultList();
        List<TaiKhoan> dataList = new ArrayList<>();

        results.stream().forEach(item -> {
            String tenDangNhap = item[0].toString();
            int tinhTrang = Integer.parseInt(item[1].toString());
            int maChucVu = Integer.parseInt(item[2].toString());
            String tenChucVu = item[3].toString();
            ChucVu chucVu = new ChucVu(maChucVu, tenChucVu);
            dataList.add(new TaiKhoan(tenDangNhap, tinhTrang, chucVu));
        });
        return dataList;
    }

}
