package N1.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import N1.entity.SanPham;

@Repository
public class SanPhamDAOImpl implements SanPhamDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<SanPham> getDSSanPham() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<SanPham> query = currentSession.createQuery("from SanPham", SanPham.class);
        return query.getResultList();
    }

}