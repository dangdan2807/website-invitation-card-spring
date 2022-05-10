package N1.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import N1.entity.ChucVu;
import N1.entity.NguoiDung;
import N1.entity.TaiKhoan;

@Repository
public class TaiKhoanDAOImpl implements TaiKhoanDAO {
    @Autowired
    private SessionFactory sessionFactory;
    
    @Autowired
    private NguoiDungDAO nguoiDungDAO;

    @Override
    public List<TaiKhoan> getDSTaiKhoan() {
        Session currentSession = sessionFactory.getCurrentSession();
        String queryStr = "SELECT tk.tenDangNhap, tk.tinhTrang, ck.maChucVu, ck.tenChucVu "
                + "FROM TaiKhoan tk, ChucVu ck "
                + "WHERE tk.maChucVu = ck.maChucVu";
        List<Object[]> results = currentSession.createNativeQuery(queryStr).getResultList();
        List<TaiKhoan> dataList = new ArrayList<>();

        results.stream().forEach(item -> {
            String tenDangNhap = item[0].toString();
            int tinhTrang = Integer.parseInt(item[1].toString());
            int maChucVu = Integer.parseInt(item[2].toString());
            String tenChucVu = item[3].toString();
            ChucVu chucVu = new ChucVu(maChucVu, tenChucVu);
            dataList.add(new TaiKhoan(tenDangNhap, tinhTrang, chucVu));
        });
        return dataList;
    }

	@Override
	public boolean doesUserExist(String email) {
		Session currentSession = sessionFactory.getCurrentSession();
        String queryStr = "SELECT * FROM TaiKhoan where tenDangNhap = '"+email+"'";
        try{
        	currentSession.createNativeQuery(queryStr).getSingleResult();
        	return true;
        }catch (Exception e) {
        	return false;
		}
	}

	@Override
	public NguoiDung createUser(NguoiDung nguoiDung) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		String query = "insert into TaiKhoan (tenDangNhap, matKhau, tinhTrang, maChucVu)"
					+" values('"+nguoiDung.getTaiKhoan().getTenDangNhap()+"', "
					+"'"+nguoiDung.getTaiKhoan().getMatKhau()+"', "
					+"'1', '1')";
		currentSession.createNativeQuery(query).executeUpdate();
		nguoiDung.getTaiKhoan().setMaTaiKhoan(getLastId());
		nguoiDungDAO.addNguoiDung(nguoiDung);
		return null;
	}
	
	@Transactional
	public int getLastId() {
		Session currentSession = sessionFactory.getCurrentSession();
		String query = "select top 1 maTaiKhoan from TaiKhoan order by maTaiKhoan desc;";
		int id = (int) currentSession.createNativeQuery(query).getSingleResult();
		System.out.println("id "+id);
		return id;
	}

}
