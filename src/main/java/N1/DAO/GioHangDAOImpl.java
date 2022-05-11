package N1.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import N1.entity.*;

@Repository
public class GioHangDAOImpl implements GioHangDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void deleteGioHangByIdNguoiDung(int maND) {
		Session currentSession= sessionFactory.getCurrentSession();
		String query="select * from GioHang where maND="+maND;
		List<GioHang> gioHang=currentSession.createNativeQuery(query,GioHang.class).getResultList();
		gioHang.forEach(e->{
			System.out.println("Xóa thành công");
			currentSession.delete(e);
		});
		
	}
	@Override
	public boolean saveGioHang(GioHang gioHang) {
		Session currentSession= sessionFactory.getCurrentSession();
		String query = " SELECT * FROM GioHang "
				+ "where maND = " + gioHang.getNguoiDung().getMaND() + " AND maSp = " + gioHang.getSanPham().getMaSp();
		Query<GioHang> result = currentSession.createNativeQuery(query, GioHang.class);
		result.setMaxResults(1);
		
		List<GioHang> gioHangs = result.getResultList();
		GioHang tempGioHang = null;
		if (gioHangs.size() > 0) {
			tempGioHang = gioHangs.get(0);
			if(tempGioHang != null) {
				int soLuong = tempGioHang.getSoLuong() + gioHang.getSoLuong();
				tempGioHang.setSoLuong(soLuong);
				currentSession.saveOrUpdate(tempGioHang);
			}
		} else {
			currentSession.saveOrUpdate(gioHang);
		}
		return true;
	}
	
	@Override
	public int getNumOfSanPhamInGioHangByEmail(String email) {
		Session currentSession= sessionFactory.getCurrentSession();
		String query = "SELECT count(*) FROM GioHang gh "
				+ "where gh.maND = ( "
				+ "select nd.maND from TaiKhoan tk, NguoiDung nd "
				+ "where tk.maTaiKhoan = nd.maTaiKhoan "
				+ "and tk.tenDangNhap = '" + email + "')";
		int result = (int) currentSession.createNativeQuery(query).getSingleResult();
		return result;
	}

}
