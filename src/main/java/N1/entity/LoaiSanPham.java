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
@Table(name = "LoaiSanPham")
public class LoaiSanPham implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "maLSP")
    private int maLSP;

    @Column(name = "tenLSP", nullable = false, columnDefinition = "nvarchar(100)")
    private String tenLSP;
    
    @OneToMany(mappedBy = "loaiSanPham")
    private List<ChiTietLoaiSP> dsCTLoaiSP;

    public LoaiSanPham() {
    }

    public LoaiSanPham(int maLSP, String tenLSP) {
        this.maLSP = maLSP;
        this.tenLSP = tenLSP;
    }

    public LoaiSanPham(String tenLSP) {
        this.tenLSP = tenLSP;
    }

    public int getMaLSP() {
        return maLSP;
    }

    public void setMaLSP(int maLSP) {
        this.maLSP = maLSP;
    }

    public String getTenLSP() {
        return tenLSP;
    }

    public void setTenLSP(String tenLSP) {
        this.tenLSP = tenLSP;
    }

}
