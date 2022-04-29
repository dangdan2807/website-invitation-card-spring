package N1.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import N1.entity.ChiTietLoaiSP;
import N1.entity.LoaiSanPham;
import N1.entity.SanPham;

@Repository
public class SanPhamDAOImpl implements SanPhamDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<SanPham> getDSSanPham() {
        Session currentSession = sessionFactory.getCurrentSession();
        String queryStr = "SELECT sp.maSp, sp.tenSp, sp.giaSP, sp.hinhAnh "
                + "FROM SanPham sp ";
        List<Object[]> results = currentSession.createNativeQuery(queryStr).getResultList();
        List<SanPham> dataList = new ArrayList<>();
        results.stream().forEach(item -> {
            int maSp = Integer.parseInt(item[0].toString());
            String tenSp = item[1].toString();
            double giaSp = Double.parseDouble(item[2].toString());
            String hinhAnh = item[3].toString();
            // SanPham sanPham = new SanPham(maSp, tenSp, hinhAnh, giaSp);
            // dataList.add(sanPham);
        });
        return dataList;
    }

}