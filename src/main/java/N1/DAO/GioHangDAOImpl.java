package N1.DAO;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import N1.DTO.SanPhamMua;
import N1.entity.*;

@Repository
public class GioHangDAOImpl implements GioHangDAO {

	@Autowired
	private SessionFactory sessionFactory;
	private final int pageSize = 20;

	@Override
	public void deleteGioHangByIdNguoiDung(int maND) {
		Session currentSession = sessionFactory.getCurrentSession();
		String query = "delete from gioHang where maND = "+maND+";";
		currentSession.createNativeQuery(query).executeUpdate();
	}
	
	@Override
	public void deleteGioHangByIdNguoiDungAndSanPhamMuas(int maND, List<SanPhamMua> sanPhamMuas) {
		Session currentSession = sessionFactory.getCurrentSession();
		String query = "select * from GioHang where maND=" + maND + " and maSp in ("; 
		for(int i = 0; i < sanPhamMuas.size(); i++) {
			query += sanPhamMuas.get(i).getMaSp();
			if ((sanPhamMuas.size() - 1) == i) {
				query += ") ";
			} else {
				query += ", ";
			}
		}
		
		List<GioHang> gioHang = currentSession.createNativeQuery(query, GioHang.class).getResultList();
		gioHang.forEach(e -> {
//			currentSession.delete(e);
		});

	}

	@Override
	public boolean saveGioHang(GioHang gioHang) {
		Session currentSession = sessionFactory.getCurrentSession();
		String query = " SELECT * FROM GioHang "
				+ "where maND = " + gioHang.getNguoiDung().getMaND()
				+ " AND maSp = " + gioHang.getSanPham().getMaSp();
		Query<GioHang> result = currentSession.createNativeQuery(query, GioHang.class);
		result.setMaxResults(1);

		List<GioHang> gioHangs = result.getResultList();
		GioHang tempGioHang = null;
		if (gioHangs.size() > 0) {
			tempGioHang = gioHangs.get(0);
			if (tempGioHang != null) {
				int soLuong = tempGioHang.getSoLuong() + gioHang.getSoLuong();
				tempGioHang.setSoLuong(soLuong);
				currentSession.saveOrUpdate(tempGioHang);
			}
		} else {
			currentSession.saveOrUpdate(gioHang);
		}
		return true;
	}
	
	@Override
	public int getNumOfSanPhamInGioHangByEmail(String email) {
		Session currentSession = sessionFactory.getCurrentSession();
		String queryStr = "SELECT count(*) FROM GioHang gh "
				+ "where gh.maND in ( "
					+ "select top(1) nd.maND from TaiKhoan tk, NguoiDung nd "
					+ "where tk.maTaiKhoan = nd.maTaiKhoan "
					+ "and tk.tenDangNhap = '" + email + "' )";
		int result = (int) currentSession.createNativeQuery(queryStr).getSingleResult();
		return result;
	}

	@Override
	public List<GioHang> getDSGioHang() {
		Session currentSession = sessionFactory.getCurrentSession();
		List<Object[]> results = currentSession.createNativeQuery("select * from GioHang").getResultList();
		List<GioHang> dataList = new ArrayList<>();

		results.stream().forEach(item -> {
			int maND = Integer.parseInt(item[0].toString());
			int maSp = Integer.parseInt(item[1].toString());
			int soLuong = Integer.parseInt(item[2].toString());

			SanPham sanPham = new SanPham(maSp);
			NguoiDung nguoiDung = new NguoiDung(maND);
			GioHang gioHang = new GioHang(nguoiDung, sanPham, soLuong);
			dataList.add(gioHang);
		});

		return dataList;

	}

	@Override
	public List<GioHang> findAll() {
		Session currentSession = sessionFactory.getCurrentSession();
		return currentSession.createQuery("from GioHang", GioHang.class).getResultList();
	}

	@Override
	public List<GioHang> findAll(int page) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<GioHang> query = currentSession.createQuery("from GioHang", GioHang.class);
		query.setHibernateFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public int getNumberOfPage() {
		return (findAll().size() + pageSize - 1) / pageSize;
	}

	@Override
	public GioHang addGioHang(GioHang gioHang) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(gioHang);
		return gioHang;
	}

	@Override
	public List<GioHang> findGioHangByUserId(int maND) {
		Session currentSession = sessionFactory.getCurrentSession();
		String queryStr = "select * from GioHang where maND = " + maND;
		List<GioHang> results = currentSession.createNativeQuery(queryStr, GioHang.class).getResultList();
		
		return results;
	}

}
