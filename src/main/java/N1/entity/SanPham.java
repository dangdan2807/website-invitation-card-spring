package N1.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "SanPham")
public class SanPham implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "maSp", nullable = false)
    private int maSp;

    @Column(name = "tenSp", nullable = false, columnDefinition = "VARCHAR(255)")
    private String tenSp;

    @Column(name = "loaiSp", nullable = false, columnDefinition = "VARCHAR(100)")
    private String loaiSp;

    @Column(name = "hinhAnh", columnDefinition = "TEXT")
    private String hinhAnh;

    @Column(name = "giaSP", nullable = false, columnDefinition = "MONEY DEFAULT(0) CHECK(giaSP >= 0)")
    private double giaSP;

    @OneToMany(mappedBy = "sanPham")
	private List<ChiTietHoaDon> dsCTHoaDon;

    public SanPham() {
    }

}
