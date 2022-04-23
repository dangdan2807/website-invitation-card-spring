package N1.entity;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

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

    @Column(name = "tenSp", nullable = false, columnDefinition = "NVARCHAR(255)")
    private String tenSp;

    @Column(name = "hinhAnh", columnDefinition = "TEXT")
    private String hinhAnh;

    @Column(name = "giaSP", nullable = false, columnDefinition = "MONEY DEFAULT(0) CHECK(giaSP >= 0)")
    private double giaSP;

    @OneToMany(mappedBy = "sanPham")
    private List<ChiTietHoaDon> dsCTHoaDon;

    @OneToMany(mappedBy = "sanPham")
    private List<ChiTietLoaiSP> dsLoaiSP;
    
    @OneToMany(mappedBy = "sanPham")
    private List<DanhGia> dsDanhGia;

    @OneToMany(mappedBy = "sanPham")
    private Set<GioHang> dsGioHang;

    public SanPham(int maSp, String tenSp, String hinhAnh, double giaSP, List<ChiTietLoaiSP> dsLoaiSP) {
        this.maSp = maSp;
        this.tenSp = tenSp;
        this.hinhAnh = hinhAnh;
        this.giaSP = giaSP;
        this.dsLoaiSP = dsLoaiSP;
    }

    public SanPham(int maSp, String tenSp, String hinhAnh, double giaSP) {
        this.maSp = maSp;
        this.tenSp = tenSp;
        this.hinhAnh = hinhAnh;
        this.giaSP = giaSP;
    }

    public SanPham(String tenSp, String hinhAnh, double giaSP, List<ChiTietLoaiSP> dsLoaiSP) {
        this.tenSp = tenSp;
        this.hinhAnh = hinhAnh;
        this.giaSP = giaSP;
        this.dsLoaiSP = dsLoaiSP;
    }

    public SanPham(String tenSp, String hinhAnh, double giaSP) {
        this.tenSp = tenSp;
        this.hinhAnh = hinhAnh;
        this.giaSP = giaSP;
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

    public double getGiaSP() {
        return giaSP;
    }

    public void setGiaSP(double giaSP) {
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

}
