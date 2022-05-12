package N1.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import N1.entity.*;

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

    @Override
    public NguoiDung addNguoiDung(NguoiDung nguoiDung) {
       Session currenSession=sessionFactory.getCurrentSession();
       currenSession.saveOrUpdate(nguoiDung);
        return nguoiDung;
    }
    
    

    @Override
    @Transactional
    public boolean updateNguoiDung(NguoiDung nguoiDung) {
        Session currentSession=sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(nguoiDung);
        return true;
    }

    @Override
    @Transactional
    public NguoiDung findNguoiDungByEmail(String email) {
        Session currentSession=sessionFactory.getCurrentSession();
        String query="select nd.* from NguoiDung nd join TaiKhoan tk\r\n"
        		+ "on nd.maTaiKhoan=tk.maTaiKhoan \r\n"
        		+ "where tk.tenDangNhap='"+email+"'";
        Query<NguoiDung> results = currentSession.createNativeQuery(query, NguoiDung.class);
        return results.getSingleResult();
       
    }

    @Override
    @Transactional
    public NguoiDung findNguoiDungById(int id) {
        Session currentSession=sessionFactory.getCurrentSession();
        return currentSession.find(NguoiDung.class, id);
    }

	@Override
	public List<NguoiDung> getDSNguoiDung() {
		Session currentSession=sessionFactory.getCurrentSession();
		Query<NguoiDung> results = currentSession.createQuery("from NguoiDung", NguoiDung.class);
		return results.getResultList();
	}

	@Override
	public void delete(int maND) {
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.delete(currentSession.find(NguoiDung.class, maND));
	}


}
