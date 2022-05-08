package N1.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import N1.entity.GioHang;

@Repository
public class GioHangDAOImpl implements GioHangDAO{

	@Autowired
	private SessionFactory sessionFactory;
	@Override
	@Transactional
	public void deleteGioHangByIdNguoiDung(int maND) {
		Session currentSession= sessionFactory.getCurrentSession();
		String query="select * from GioHang where maND="+maND;
		List<GioHang> gioHang=currentSession.createNativeQuery(query,GioHang.class).getResultList();
		gioHang.forEach(e->{
			System.out.println("Xóa thành công");
			currentSession.delete(e);
		});
		
	}

}
