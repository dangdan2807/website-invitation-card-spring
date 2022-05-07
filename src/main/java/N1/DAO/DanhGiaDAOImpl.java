package N1.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import N1.entity.DanhGia;

@Repository
public class DanhGiaDAOImpl implements DanhGiaDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<DanhGia> getDanhGiasByIdSanPham(int idSanPham) {
		Session currentSession = sessionFactory.getCurrentSession();
		String query = "select * from DanhGia dg where dg.maSP =" + idSanPham;
		Query<DanhGia> results = currentSession.createNativeQuery(query, DanhGia.class);
		return results.getResultList();
	}

	@Override
	public List<DanhGia> getDsDanhGias() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<DanhGia> results = currentSession.createQuery("from DanhGia", DanhGia.class);
		return results.getResultList();
	}

}
