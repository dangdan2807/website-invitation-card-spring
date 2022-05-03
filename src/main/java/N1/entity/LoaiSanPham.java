package N1.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
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

    @Column(name = "hinhAnh", columnDefinition = "text DEFAULT (N'')")
    private String hinhAnh;
    
    @OneToMany(mappedBy = "loaiSanPham", cascade = CascadeType.REMOVE)
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
    
    

	public String getHinhAnh() {
		return hinhAnh;
	}

	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}

	@Override
	public String toString() {
		return "LoaiSanPham [maLSP=" + maLSP + ", tenLSP=" + tenLSP + ", hinhAnh=" + hinhAnh + "]";
	}
    
    

}
