package N1.DAO;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import N1.entity.SanPham;


public interface SanPhamDAO{
    public List<SanPham> getDSSanPham();
    public List<SanPham> getDSSanPham(int page);
    public int getNumberOfPage();
}
