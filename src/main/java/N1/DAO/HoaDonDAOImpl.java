package N1.DAO;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import N1.entity.HoaDon;
import N1.entity.LoaiSanPham;
import N1.entity.NguoiDung;

@Repository
public class HoaDonDAOImpl implements HoaDonDAO {
    @Autowired
    private SessionFactory sessionFactory;

    private final int pageSize = 20;
    
    @Override
    @SuppressWarnings("unchecked")
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
            HoaDon hoaDon = new HoaDon(maHD, ngayLHD, tongTien, tongSoLuong, nguoiDung);
            dataList.add(hoaDon);
        });

        return dataList;
    }

	@Override
	public List<HoaDon> findAll() {
    	Session currentSession = sessionFactory.getCurrentSession();
        Query<HoaDon> query = currentSession.createQuery("from HoaDon", HoaDon.class);
        return query.getResultList();
	}

	@Override
	public List<HoaDon> findAll(int page) {
    	Session currentSession = sessionFactory.getCurrentSession();
        Query<HoaDon> query = currentSession.createQuery("from HoaDon", HoaDon.class);
        query.setHibernateFirstResult((page-1)*pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
	}

	@Override
	public int getNumberOfPage() {
		return (findAll().size() + pageSize - 1)/pageSize;
	}
}
