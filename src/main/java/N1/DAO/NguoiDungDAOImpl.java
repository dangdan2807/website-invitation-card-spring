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

    @Override
    public NguoiDung addNguoiDung(NguoiDung nguoiDung) {
       Session currenSession=sessionFactory.getCurrentSession();
       currenSession.saveOrUpdate(nguoiDung);
        return nguoiDung;
    }

    @Override
    public boolean updateNguoiDung(NguoiDung nguoiDung) {
        Session currentSession=sessionFactory.getCurrentSession();
        
        String email=nguoiDung.getTaiKhoan().getTenDangNhap();
        NguoiDung nguoiDungCapNhat=findNguoiDungByEmail(email);
        if(nguoiDungCapNhat==null){
            return false;
        }
        nguoiDungCapNhat.setDiaChi(nguoiDung.getDiaChi());
        nguoiDungCapNhat.setTenND(nguoiDung.getTenND());
        nguoiDungCapNhat.setSdt(nguoiDung.getSdt());

        //xử lý tài khoản
        TaiKhoan taiKhoanCapNhat=nguoiDungCapNhat.getTaiKhoan();
        TaiKhoan taiKhoanCu=nguoiDung.getTaiKhoan();
        // thay đổi matKhau
        taiKhoanCapNhat.setMatKhau(taiKhoanCu.getMatKhau());
        nguoiDungCapNhat.setTaiKhoan(taiKhoanCapNhat);
        currentSession.saveOrUpdate(nguoiDungCapNhat);
        return true;
    }

    @Override
    public NguoiDung findNguoiDungByEmail(String email) {
        Session currentSession=sessionFactory.getCurrentSession();
        String query="SELECT * FROM NguoiDung WHERE email ='"+email+"'";
        NguoiDung nguoiDung=(NguoiDung) currentSession.createNativeQuery(query, NguoiDung.class).getSingleResult();
        return nguoiDung;
    }

    @Override
    public NguoiDung findNguoiDungById(int id) {
        Session currentSession=sessionFactory.getCurrentSession();
        return currentSession.find(NguoiDung.class, id);
    }

	@Override
	public List<NguoiDung> getDSNguoiDung() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(int maND) {
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.delete(currentSession.find(NguoiDung.class, maND));
	}


}
