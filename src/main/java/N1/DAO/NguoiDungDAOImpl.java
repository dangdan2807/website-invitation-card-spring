package N1.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import N1.entity.ChucVu;
import N1.entity.NguoiDung;
import N1.entity.SanPham;
import N1.entity.TaiKhoan;

@Repository
public class NguoiDungDAOImpl implements NguoiDungDAO {
    @Autowired
    private SessionFactory sessionFactory;

    private final int pageSize = 20;
    
    @Override
    public List<NguoiDung> findAll() {
    	Session currentSession = sessionFactory.getCurrentSession();
        Query<NguoiDung> query = currentSession.createQuery("from NguoiDung", NguoiDung.class);
        return query.getResultList();
    }

	@Override
	public List<NguoiDung> findAll(int page) {
		Session currentSession = sessionFactory.getCurrentSession();
        Query<NguoiDung> query = currentSession.createQuery("from NguoiDung", NguoiDung.class);
        query.setHibernateFirstResult((page-1)*pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
	}

	@Override
	public int getNumberOfPage() {
		return (findAll().size() + pageSize - 1)/pageSize;
	}

}
