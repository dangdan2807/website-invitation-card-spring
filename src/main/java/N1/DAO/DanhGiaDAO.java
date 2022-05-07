package N1.DAO;

import java.util.List;

import N1.entity.DanhGia;

public interface DanhGiaDAO {
	public List<DanhGia> getDanhGiasByIdSanPham(int idSanPham);
	
	public List<DanhGia> getDsDanhGias();
}
