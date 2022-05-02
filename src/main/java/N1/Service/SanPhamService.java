package N1.Service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import N1.entity.SanPham;

public interface SanPhamService {
    public List<SanPham> getDSSanPham();
    public List<SanPham> getDSSanPham(int page);
    public int getNumberOfPage();
}
