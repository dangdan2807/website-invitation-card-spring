package N1.DAO;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
	
    @Override
    public List<HoaDon> getHoaDonMoiNhat() {
        List<HoaDon> hoaDons = new ArrayList<HoaDon>();
        Session currenSession = sessionFactory.getCurrentSession();

        Query<HoaDon> theQuery = currenSession.createQuery("from HoaDon order by ngayLHD desc", HoaDon.class);
        hoaDons = theQuery.getResultList();
        return hoaDons;
    }

    @Override
    public List<HoaDon> findHoaDonByDate(Date ngayLapHoaDon) {
        List<HoaDon> hoaDons = new ArrayList<HoaDon>();
        Session currenSession = sessionFactory.getCurrentSession();
        // convert date to datetime
        String pattern = "yyyy-MM-dd";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        String dateBegin = simpleDateFormat.format(ngayLapHoaDon) + " 00:00:00.000";
        String dateEnd = simpleDateFormat.format(ngayLapHoaDon) + " 23:59:59.000";

        // java.sql.Timestamp ngayLap = new java.sql.Timestamp(ngayLapHoaDon.getTime());
        String query = "SELECT * FROM HoaDon where ngayLHD BETWEEN " + dateBegin + "AND " + dateEnd;
        hoaDons = currenSession.createQuery(query, HoaDon.class).getResultList();

        return hoaDons;
    }

    @Override
    public List<HoaDon> findHoaDonBySDTKhachHang(String soDienThoai) {
        Session currentSession = sessionFactory.getCurrentSession();
        String query = " SELECT hd.* FROM HoaDon hd JOIN NguoiDung nd ON hd.maKH=nd.maND"
                + "  where nd.sdt=" + soDienThoai;
        List<Object[]> results = currentSession.createNativeQuery(query).getResultList();
        List<HoaDon> hoaDons = new ArrayList<>();

        results.stream().forEach(item -> {
            int maHD = Integer.parseInt(item[0].toString());
            Date ngayLHD = (Date) item[1];
            int tongSoLuong = Integer.parseInt(item[2].toString());
            double tongTien = Double.parseDouble(item[3].toString());
            int maND = Integer.parseInt(item[4].toString());
            NguoiDung nguoiDung = new NguoiDung(maND);
            HoaDon hoaDon = new HoaDon(maHD, ngayLHD, tongTien, tongSoLuong, nguoiDung);
            hoaDons.add(hoaDon);
        });

        return hoaDons;
    }

    @Override
    @Transactional
    public HoaDon addHoaDon(HoaDon hoaDon) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(hoaDon);
        return hoaDon;
    }

    @Override
    @Transactional
    public HoaDon findHoaDonById(int maHD) {
        Session currentSession = sessionFactory.getCurrentSession();
        HoaDon hoaDon = currentSession.find(HoaDon.class, maHD);
        return hoaDon;
    }
}
