package N1.DAO;

import java.util.ArrayList;
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

      @Override
      public SanPham addSanPham(SanPham sanPham) {
          Session currentSession=sessionFactory.getCurrentSession();
          currentSession.saveOrUpdate(sanPham);
          return sanPham;
      }

      @Override
      public boolean updateSanPham(int sanPhamId, SanPham sanPham) {
          Session currentSession=sessionFactory.getCurrentSession();
          SanPham sanPham2=getSanPhamByIdSanPham(sanPhamId);
          if(sanPham2==null)
          {
              return false;
          }  
          sanPham2.setGiaMua(sanPham.getGiaMua());
          sanPham2.setHinhAnh(sanPham.getHinhAnh());
          sanPham2.setMoTa(sanPham.getMoTa());
          sanPham2.setTenSp(sanPham.getTenSp());
          sanPham2.setGiamGia(sanPham.getGiaMua());
          currentSession.saveOrUpdate(sanPham2);

          return true;
      }

      @Override
      public SanPham getSanPhamByIdSanPham(int sanPhamId) {
          Session currentSession=sessionFactory.getCurrentSession();
          SanPham sanPham=null;
         sanPham= currentSession.find(SanPham.class, sanPhamId);
          return sanPham;
      }

      @Override
      public List<SanPham> getSanPhamByTenSanPham(String tenSP) {
          Session currentSession=sessionFactory.getCurrentSession();
          List<SanPham> sanPhams=new ArrayList<>();
          String query=" SELECT * FROM SanPham where tenSp like N'%"+tenSP+"%'";
          sanPhams=currentSession.createQuery(query, SanPham.class).getResultList();
          return sanPhams;
      }

	@Override
	public void delete(int maSp) {
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.delete(currentSession.find(SanPham.class, maSp));
	}

}