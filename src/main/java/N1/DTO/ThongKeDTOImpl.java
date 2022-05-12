package N1.DTO;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import N1.Service.ThongKeServiceImpl;
import N1.Service.ThongKeServiceImpl.LabelCount;
import N1.utils.Datetime;

@Repository
public class ThongKeDTOImpl implements ThongKeDTO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public long tongDoanhThu(Date from, Date to) {
		to = Datetime.tomorrow(to);
		Session session = sessionFactory.getCurrentSession();
		Long doanhThu = ((BigDecimal)session.createNativeQuery("select doanhThu=COALESCE(SUM(tongTien), 0) from HoaDon\r\n"
				+ "where ngayLHD >= '"+Datetime.sqlDateFormat(from)+"' and ngayLHD < '"+Datetime.sqlDateFormat(to)+"';").getSingleResult()).longValue();
		return doanhThu;
	}

	@Override
	public long tongLoiNhuan(Date from, Date to) {
		to = Datetime.tomorrow(to);
		Session session = sessionFactory.getCurrentSession();
		long tongLoiNhuan = ((BigDecimal)session.createNativeQuery("select loiNhuan=COALESCE(SUM((giaBan-giaMua)*cthd.soLuong), 0) from HoaDon as hd \r\n"
				+ "inner join ChiTietHoaDon as cthd \r\n"
				+ "on hd.maHD = cthd.maHD \r\n"
				+ "inner join SanPham as sp \r\n"
				+ "on sp.maSP = cthd.maSP \r\n"
				+ "where ngayLHD >= '"+Datetime.sqlDateFormat(from)+"' and ngayLHD < '"+Datetime.sqlDateFormat(to)+"';").getSingleResult()).longValue();
		return tongLoiNhuan;
	}

	@Override
	public int tongSoDonHang(Date from, Date to) {
		to = Datetime.tomorrow(to);
		Session session = sessionFactory.getCurrentSession();
		int doanhThu = (int) session.createNativeQuery("select soDonHang=COUNT(maHD) from HoaDon\r\n"
				+ "where ngayLHD >= '"+Datetime.sqlDateFormat(from)+"' and ngayLHD < '"+Datetime.sqlDateFormat(to)+"';").getSingleResult();
		return doanhThu;
	}

	@Override
	public int tongSoThiepBan(Date from, Date to) {
		to = Datetime.tomorrow(to);
		Session session = sessionFactory.getCurrentSession();
		int tongSoLuong = (int) session.createNativeQuery("select tongSoLuong=COALESCE(SUM(tongSoLuong), 0) from HoaDon\r\n"
				+ "where ngayLHD >= '"+Datetime.sqlDateFormat(from)+"' and ngayLHD < '"+Datetime.sqlDateFormat(to)+"';").getSingleResult();
		return tongSoLuong;
	}

	@Override
	public LabelCount soDanhMucBanRa(Date from, Date to) {
		to = Datetime.tomorrow(to);
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> results = session.createNativeQuery("select lsp.tenLSP, soLuong = COALESCE(SUM(cthd.soLuong), 0)\r\n"
				+ "from HoaDon as hd \r\n"
				+ "inner join ChiTietHoaDon as cthd \r\n"
				+ "on hd.maHD = cthd.maHD \r\n"
				+ "inner join SanPham as sp \r\n"
				+ "on sp.maSP = cthd.maSP \r\n"
				+ "inner join ChiTietLoaiSP as ctlsp\r\n"
				+ "on sp.maSP = ctlsp.maSP\r\n"
				+ "inner join LoaiSanPham as lsp\r\n"
				+ "on ctlsp.maLSP = lsp.maLSP\r\n"
				+ "where ngayLHD >= '"+Datetime.sqlDateFormat(from)+"' and ngayLHD < '"+Datetime.sqlDateFormat(to)+"'\r\n"
				+ "group by lsp.maLSP, lsp.tenLSP;").getResultList();
		
		List<String> label = new ArrayList<>();
		List<Integer> count = new ArrayList<>();
		results.stream().forEach(item -> {
            label.add(item[0].toString());
            count.add(Integer.parseInt(item[1].toString()));
        });
		ThongKeServiceImpl tk = new ThongKeServiceImpl();
		LabelCount soDanhMucBanRa = tk.new LabelCount(label, count);
		return soDanhMucBanRa;
	}

	@Override
	public LabelCount soSanPhamBanRa(Date from, Date to) {
		to = Datetime.tomorrow(to);
		Session session = sessionFactory.getCurrentSession();
		List<Object[]> results = session.createNativeQuery("select tenSp, soLuong=COALESCE(SUM(cthd.soLuong), 0)\r\n"
				+ "from HoaDon as hd \r\n"
				+ "inner join ChiTietHoaDon as cthd \r\n"
				+ "on hd.maHD = cthd.maHD \r\n"
				+ "inner join SanPham as sp \r\n"
				+ "on sp.maSP = cthd.maSP \r\n"
				+ "where ngayLHD >= '"+Datetime.sqlDateFormat(from)+"' and ngayLHD < '"+Datetime.sqlDateFormat(to)+"'\r\n"
				+ "group by sp.maSp, tenSp;").getResultList();
		
		List<String> label = new ArrayList<>();
		List<Integer> count = new ArrayList<>();
		results.stream().forEach(item -> {
            label.add(item[0].toString());
            count.add(Integer.parseInt(item[1].toString()));
        });
		ThongKeServiceImpl tk = new ThongKeServiceImpl();
		LabelCount soSanPhamBanRa = tk.new LabelCount(label, count);
		return soSanPhamBanRa;
	}

	

}
