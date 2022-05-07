package N1.DTO;

import java.math.BigDecimal;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import N1.utils.Datetime;

@Repository
public class ThongKeDTOImpl implements ThongKeDTO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public long tongDoanhThu(Date from, Date to) {
		Session session = sessionFactory.getCurrentSession();
		Long doanhThu = ((BigDecimal)session.createNativeQuery("select doanhThu=SUM(tongTien) from HoaDon\r\n"
				+ "where ngayLHD >= '"+Datetime.sqlDateFormat(from)+"' and ngayLHD <= '"+Datetime.sqlDateFormat(to)+"';").getSingleResult()).longValue();
		return doanhThu;
	}

	@Override
	public long tongLoiNhuan(Date from, Date to) {
		Session session = sessionFactory.getCurrentSession();
		long tongLoiNhuan = ((BigDecimal)session.createNativeQuery("select loiNhuan=SUM((giaBan-giaMua)*cthd.soLuong) from HoaDon as hd \r\n"
				+ "inner join ChiTietHoaDon as cthd \r\n"
				+ "on hd.maHD = cthd.maHD \r\n"
				+ "inner join SanPham as sp \r\n"
				+ "on sp.maSP = cthd.maSP \r\n"
				+ "where ngayLHD >= '"+Datetime.sqlDateFormat(from)+"' and ngayLHD <= '"+Datetime.sqlDateFormat(to)+"';").getSingleResult()).longValue();
		return tongLoiNhuan;
	}

	@Override
	public int tongSoDonHang(Date from, Date to) {
		Session session = sessionFactory.getCurrentSession();
		int doanhThu = (int) session.createNativeQuery("select soDonHang=COUNT(maHD) from HoaDon\r\n"
				+ "where ngayLHD >= '"+Datetime.sqlDateFormat(from)+"' and ngayLHD <= '"+Datetime.sqlDateFormat(to)+"';").getSingleResult();
		return doanhThu;
	}

	@Override
	public int tongSoThiepBan(Date from, Date to) {
		Session session = sessionFactory.getCurrentSession();
		int tongSoLuong = (int) session.createNativeQuery("select tongSoLuong=SUM(tongSoLuong) from HoaDon\r\n"
				+ "where ngayLHD >= '"+Datetime.sqlDateFormat(from)+"' and ngayLHD <= '"+Datetime.sqlDateFormat(to)+"';").getSingleResult();
		return tongSoLuong;
	}

}
