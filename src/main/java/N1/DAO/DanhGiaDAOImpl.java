package N1.DAO;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import N1.entity.DanhGia;

@Repository
public class DanhGiaDAOImpl implements DanhGiaDAO {
	private int pageSize = 5;
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<DanhGia> getDanhGiasByIdSanPhamAndPageNumber(int idSanPham, int pageNumber) {
		Session currentSession = sessionFactory.getCurrentSession();
		String query = "select * from DanhGia dg where dg.maSP =" + idSanPham
					+ " order by dg.thoiGian desc";
		Query<DanhGia> results = currentSession.createNativeQuery(query, DanhGia.class);
		results.setHibernateFirstResult((pageNumber - 1) * pageSize);
		results.setMaxResults(pageSize);
		return results.getResultList();
	}

	@Override
	public List<DanhGia> getDsDanhGias() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<DanhGia> results = currentSession.createQuery("from DanhGia", DanhGia.class);
		return results.getResultList();
	}

	@Override
	public int getNumberOfDanhGiaBySanPhamId(int sanPhamId) {
		Session currentSession = sessionFactory.getCurrentSession();
		String queryStr = "select count(*) from DanhGia dg where dg.maSP =" + sanPhamId;
		int result = (int) currentSession.createNativeQuery(queryStr).getSingleResult();
		return result;
	}

	@Override
	public boolean addDanhGia(DanhGia danhGia) {
		Session currentSession = sessionFactory.getCurrentSession();
		danhGia.setMaDanhGia(0);
		Calendar calendar = Calendar.getInstance();
		danhGia.setThoiGian(calendar.getTime());
		currentSession.saveOrUpdate(danhGia);
		return true; 
	}

}
