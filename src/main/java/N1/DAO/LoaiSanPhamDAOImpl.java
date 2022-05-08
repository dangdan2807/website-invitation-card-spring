package N1.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import N1.entity.LoaiSanPham;

@Repository
public class LoaiSanPhamDAOImpl implements LoaiSanPhamDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<LoaiSanPham> getDSLoaiSanPham() {
    	Session currentSession = sessionFactory.getCurrentSession();
        String queryStr = "FROM LoaiSanPham";
        Query<LoaiSanPham> results = currentSession.createQuery(queryStr, LoaiSanPham.class);
        return results.getResultList();
    }

    @Override
    public boolean addLoaiSanPham(LoaiSanPham loaiSanPham) {
       Session currentSession=sessionFactory.getCurrentSession();
       currentSession.saveOrUpdate(loaiSanPham);
        return true;
    }
}
