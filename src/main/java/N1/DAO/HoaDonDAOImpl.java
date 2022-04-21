package N1.DAO;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import N1.entity.HoaDon;
import N1.entity.NguoiDung;

@Repository
public class HoaDonDAOImpl implements HoaDonDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<HoaDon> getDSHoaDon() {
        Session currentSession = sessionFactory.getCurrentSession();
        String queryStr = "SELECT hd.maHD, hd.ngayLHD, hd.tongSoLuong, hd.tongTien, hd.maKH "
                + "FROM HoaDon hd, NguoiDung nd "
                + "WHERE hd.maKH = nd.maND";
        List<Object[]> results = currentSession.createNativeQuery(queryStr).getResultList();
        List<HoaDon> dataList = new ArrayList<>();

        results.stream().forEach(item -> {
            int maHD = Integer.parseInt(item[0].toString());
            Date ngayLHD = (Date) item[1];
            int tongSoLuong = Integer.parseInt(item[2].toString());
            double tongTien = Double.parseDouble(item[3].toString());
            int maND = Integer.parseInt(item[4].toString());

            NguoiDung nguoiDung = new NguoiDung(maND);
            HoaDon hoaDon = new HoaDon(maHD, ngayLHD, tongSoLuong, tongTien, nguoiDung);
            dataList.add(hoaDon);
        });

        return dataList;
    }
}
