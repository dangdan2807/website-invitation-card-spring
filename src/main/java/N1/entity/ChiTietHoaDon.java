package N1.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@IdClass(ChiTietHoaDonPK.class)
public class ChiTietHoaDon implements Serializable {
    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "maHD", columnDefinition = "INT")
    private HoaDon hoaDon;

    @Id
    @JoinColumn(name = "maSp", columnDefinition = "INT")
    @ManyToOne
    private SanPham sanPham;

    @Column(name = "soLuong", columnDefinition = "INT DEFAULT(1) CHECK(soLuong >= 1)")
    private int soLuong;

    @Column(name = "thanhTien", columnDefinition = "MONEY DEFAULT(0) CHECK(thanhTien >= 0)")
    private double thanhTien;

    public ChiTietHoaDon() {
    }

    public ChiTietHoaDon(SanPham sanPham, int soLuong, double thanhTien) {
        this.sanPham = sanPham;
        this.soLuong = soLuong;
        this.thanhTien = thanhTien;
    }

    public HoaDon getHoaDon() {
        return hoaDon;
    }

    public void setHoaDon(HoaDon hoaDon) {
        this.hoaDon = hoaDon;
    }

    public SanPham getSanPham() {
        return sanPham;
    }

    public void setSanPham(SanPham sanPham) {
        this.sanPham = sanPham;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public double getThanhTien() {
        return thanhTien;
    }

    public void tinhThanhTien() {
        this.thanhTien = this.sanPham.getGiaSP() * this.soLuong;
    }

}
