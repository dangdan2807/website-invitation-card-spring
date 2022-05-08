package N1.DAO;

import java.util.List;

import N1.entity.DanhGia;

public interface DanhGiaDAO {
	public List<DanhGia> getDanhGiasByIdSanPhamAndPageNumber(int idSanPham, int pageNumber);
	
	public List<DanhGia> getDsDanhGias();

	public int getNumberOfDanhGiaBySanPhamId(int sanPhamId);
	
	public boolean addDanhGia(DanhGia danhGia);
}
