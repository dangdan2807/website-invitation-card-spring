package N1.DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import N1.entity.ChiTietLoaiSP;
import N1.entity.LoaiSanPham;
import N1.entity.SanPham;

@Repository
public class SanPhamDAOImpl implements SanPhamDAO {
    @Autowired
    private SessionFactory sessionFactory;
    private final int pageSize = 20;

    @Override
    public List<SanPham> getDSSanPham() {
    	
        Session currentSession = sessionFactory.getCurrentSession();
        Query<SanPham> query = currentSession.createQuery("from SanPham", SanPham.class);
        return query.getResultList();
    }

	@Override
	public List<SanPham> getDSSanPham(int page) {
		Session currentSession = sessionFactory.getCurrentSession();
        Query<SanPham> query = currentSession.createQuery("from SanPham", SanPham.class);
        query.setHibernateFirstResult((page-1)*pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
	}

	@Override
	public int getNumberOfPage() {
        return (getDSSanPham().size()+pageSize-1)/pageSize;
	}

}