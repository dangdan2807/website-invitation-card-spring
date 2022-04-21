package N1.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import N1.entity.ChiTietHoaDon;
import N1.entity.SanPham;

@Repository
public class CTHoaDonDAOImpl implements CTHoaDonDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<ChiTietHoaDon> getDSCTHoaDon() {
        Session currentSession = sessionFactory.getCurrentSession();
        String queryStr = "SELECT ct.maHD, ct.soLuong, ct.thanhTien, "
                + "sp.maSp, sp.tenSp, sp.giaSP, sp.hinhAnh "
                + "FROM ChiTietHoaDon ct, SanPham sp "
                + "WHERE ct.maSp = sp.maSp ";

        List<Object[]> results = currentSession.createNativeQuery(queryStr).getResultList();
        List<ChiTietHoaDon> dataList = new ArrayList<>();
        results.stream().forEach(item -> {
            int maHD = Integer.parseInt(item[0].toString());
            int soLuong = Integer.parseInt(item[1].toString());
            double thanhTien = Double.parseDouble(item[2].toString());
            int maSp = Integer.parseInt(item[3].toString());
            String tenSp = item[4].toString();
            double giaSp = Double.parseDouble(item[5].toString());
            String hinhAnh = item[6].toString();
            SanPham sanPham = new SanPham(maSp, tenSp, hinhAnh, giaSp);
            ChiTietHoaDon ctHoaDon = new ChiTietHoaDon(sanPham, soLuong, thanhTien);
            dataList.add(ctHoaDon);
        });

        return dataList;
    }

}
