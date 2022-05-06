package N1.Service;

import java.util.List;

import N1.entity.DanhGia;

public interface DanhGiaService {
	public List<DanhGia> getDanhGiasByIdSanPham(int idSanPham);
	
	public List<DanhGia> getDsDanhGias();
}
