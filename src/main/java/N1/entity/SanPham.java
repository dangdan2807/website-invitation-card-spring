package N1.entity;

import java.io.Serializable;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "SanPham")
public class SanPham implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "maSp", nullable = false)
    private int maSp;

    @NotBlank(message = "Tên thiệp không được để trống")
    @Column(name = "tenSp", nullable = false, columnDefinition = "NVARCHAR(255)")
    private String tenSp;

    @Column(name = "hinhAnh", columnDefinition = "TEXT")
    private String hinhAnh;

    @NotBlank(message = "Mô tả không được để trống")
    @Column(name = "moTa", nullable = false, columnDefinition = "NTEXT DEFAULT(N'')")
    private String moTa;

    @NotNull(message = "Giá bán không được để trống")
    @Min(value = 0, message = "Giá bán không thể là số âm")
    @Column(name = "giaSP", nullable = false, columnDefinition = "MONEY DEFAULT(0) CHECK(giaSP >= 0)")
    private Double giaSP;

    @NotNull(message = "Giảm giá không được để trống")
    @Min(value = 0, message = "Giảm giá phải trong khoảng 0-100")
    @Max(value = 100, message = "Giảm giá phải trong khoảng 0-100")
    @Column(name = "giamGia", nullable = false, columnDefinition = "float DEFAULT(0) CHECK(giamGia >= 0)")
    private Double giamGia;

    @NotNull(message = "Giá nhập không được để trống")
    @Min(value = 0, message = "Giá nhập không thể là số âm")
    @Column(name = "giaMua", nullable = false, columnDefinition = "MONEY DEFAULT(0) CHECK(giaMua >= 0)")
    private Double giaMua;

    @OneToMany(mappedBy = "sanPham")
    private List<ChiTietHoaDon> dsCTHoaDon;

    @OneToMany(mappedBy = "sanPham", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
    private List<ChiTietLoaiSP> dsLoaiSP;

    @OneToMany(mappedBy = "sanPham", cascade = CascadeType.REMOVE)
    private List<DanhGia> dsDanhGia;

    @OneToMany(mappedBy = "sanPham")
    private Set<GioHang> dsGioHang;

    public SanPham(int maSp, String tenSp, String hinhAnh, String moTa, double giaSP, double giamGia, double giaMua,
            List<ChiTietLoaiSP> dsLoaiSP) {
        this.maSp = maSp;
        this.tenSp = tenSp;
        this.hinhAnh = hinhAnh;
        this.moTa = moTa;
        this.giaSP = giaSP;
        this.giamGia = giamGia;
        this.giaMua = giaMua;
        this.dsLoaiSP = dsLoaiSP;
    }

    public SanPham(int maSp, String tenSp, String hinhAnh, String moTa, double giaSP, double giamGia, double giaMua) {
        this.maSp = maSp;
        this.tenSp = tenSp;
        this.hinhAnh = hinhAnh;
        this.moTa = moTa;
        this.giaSP = giaSP;
        this.giamGia = giamGia;
        this.giaMua = giaMua;
    }

    public SanPham(String tenSp, String hinhAnh, String moTa, double giaSP, double giamGia, double giaMua,
            List<ChiTietLoaiSP> dsLoaiSP) {
        this.tenSp = tenSp;
        this.hinhAnh = hinhAnh;
        this.moTa = moTa;
        this.giaSP = giaSP;
        this.giamGia = giamGia;
        this.giaMua = giaMua;
        this.dsLoaiSP = dsLoaiSP;
    }

    public SanPham(String tenSp, String hinhAnh, String moTa, double giaSP, double giamGia, double giaMua) {
        this.tenSp = tenSp;
        this.hinhAnh = hinhAnh;
        this.moTa = moTa;
        this.giaSP = giaSP;
        this.giamGia = giamGia;
        this.giaMua = giaMua;
    }
    
    public SanPham(int maSp, String tenSp, String hinhAnh, double giaSP) {
        this.maSp = maSp;
        this.tenSp = tenSp;
        this.hinhAnh = hinhAnh;
        this.giaSP = giaSP;
    }
    
    public SanPham(int maSp) {
		super();
		this.maSp = maSp;
	}
    
	public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public Double getGiamGia() {
        return giamGia;
    }

    public void setGiamGia(Double giamGia) {
        this.giamGia = giamGia;
    }

    public Double getGiaMua() {
        return giaMua;
    }

    public void setGiaMua(Double giaMua) {
        this.giaMua = giaMua;
    }

    public SanPham() {
    }

    public int getMaSp() {
        return maSp;
    }

    public void setMaSp(int maSp) {
        this.maSp = maSp;
    }

    public String getTenSp() {
        return tenSp;
    }

    public void setTenSp(String tenSp) {
        this.tenSp = tenSp;
    }

    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    public Double getGiaSP() {
        return giaSP;
    }

    public void setGiaSP(Double giaSP) {
        this.giaSP = giaSP;
    }

    public List<ChiTietHoaDon> getDsCTHoaDon() {
        return dsCTHoaDon;
    }

    public void setDsCTHoaDon(List<ChiTietHoaDon> dsCTHoaDon) {
        this.dsCTHoaDon = dsCTHoaDon;
    }

    public List<ChiTietLoaiSP> getDsLoaiSP() {
        return dsLoaiSP;
    }

    public void setDsLoaiSP(List<ChiTietLoaiSP> dsLoaiSP) {
        this.dsLoaiSP = dsLoaiSP;
    }

	public List<DanhGia> getDsDanhGia() {
		return dsDanhGia;
	}

	public void setDsDanhGia(List<DanhGia> dsDanhGia) {
		this.dsDanhGia = dsDanhGia;
	}
	
	public double getGiaSauGiamGia() {
		return giaSP * (100 - giamGia) / 100;
	}
	
	
	
	public String toStringLoaiSp() {
		AtomicReference<String> rs = new AtomicReference<String>("");
		dsLoaiSP.forEach(loaiSp -> {
			if(!rs.get().equals(""))
				rs.set(rs.get()+",");
			rs.set(rs.get()+loaiSp.getLoaiSanPham().getMaLSP());
		});
		return rs.get();
	}

	@Override
	public String toString() {
		return "SanPham [maSp=" + maSp + ", tenSp=" + tenSp + ", hinhAnh=" + hinhAnh + ", moTa=" + moTa + ", giaSP="
				+ giaSP + ", giamGia=" + giamGia + ", giaMua=" + giaMua + "]";
	}
    
	
}
