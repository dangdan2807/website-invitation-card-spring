package N1.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@IdClass(ChiTietLoaiSPPK.class)
public class ChiTietLoaiSP implements Serializable {
    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "maLSP", columnDefinition = "INT")
    private LoaiSanPham loaiSanPham;

    @Id
    @JoinColumn(name = "maSp", columnDefinition = "INT")
    @ManyToOne
    private SanPham sanPham;

    public ChiTietLoaiSP() {
    }

    public ChiTietLoaiSP(LoaiSanPham loaiSanPham) {
        this.loaiSanPham = loaiSanPham;
    }

    public LoaiSanPham getLoaiSanPham() {
        return loaiSanPham;
    }

    public void setLoaiSanPham(LoaiSanPham loaiSanPham) {
        this.loaiSanPham = loaiSanPham;
    }

    public SanPham getSanPham() {
        return sanPham;
    }

    public void setSanPham(SanPham sanPham) {
        this.sanPham = sanPham;
    }

}
