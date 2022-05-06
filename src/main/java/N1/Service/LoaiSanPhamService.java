package N1.Service;

import java.util.List;

import N1.entity.LoaiSanPham;

public interface LoaiSanPhamService {
    public List<LoaiSanPham> findAll();
    public List<LoaiSanPham> findAll(int page);
    public LoaiSanPham findById(int id);
    public int getNumberOfPage();
    public void save(LoaiSanPham lsp);
    public void delete(int maLSP);
}
