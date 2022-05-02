package N1.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "HoaDon")
public class HoaDon implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "maHD", nullable = false)
    private int maHD;

    @Temporal(value = TemporalType.TIMESTAMP)
    @Column(name = "ngayLHD", nullable = false, columnDefinition = "DATETIME DEFAULT(GETDATE())")
    private Date ngayLHD;

    @Column(name = "tongTien", nullable = false, columnDefinition = "MONEY DEFAULT(0) CHECK(tongTien >= 0)")
    private double tongTien;

    @Column(name = "tongSoLuong", nullable = false, columnDefinition = "INT DEFAULT(0) CHECK(tongSoLuong >= 0)")
    private double tongSoLuong;

    @Column(name = "trangThaiDonHang", nullable = false, columnDefinition = "NVARCHAR(100) DEFAULT(N'Chưa thanh toán')")
    private String trangThaiDonHang;

    @Temporal(value = TemporalType.TIMESTAMP)
    @Column(name = "ngayGiaoHang", columnDefinition = "DATETIME")
    private Date ngayGiaoHang;

    @Column(name = "diaChiGiaoHang", columnDefinition = "TEXT DEFAULT('')")
    private String diaChiGiaoHang;

    @OneToMany(mappedBy = "hoaDon")
    private List<ChiTietHoaDon> dsCTHoaDon;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "maKH", nullable = false)
    private NguoiDung nguoiDung;

    public HoaDon() {
    }

    public HoaDon(int maHD, Date ngayLHD, double tongTien, double tongSoLuong, NguoiDung nguoiDung) {
        this.maHD = maHD;
        this.ngayLHD = ngayLHD;
        this.tongTien = tongTien;
        this.tongSoLuong = tongSoLuong;
        this.nguoiDung = nguoiDung;
    }

    public HoaDon(Date ngayLHD, double tongTien, double tongSoLuong, Date ngayGiaoHang, String diaChiGiaoHang) {
        this.ngayLHD = ngayLHD;
        this.tongTien = tongTien;
        this.tongSoLuong = tongSoLuong;
        this.ngayGiaoHang = ngayGiaoHang;
        this.diaChiGiaoHang = diaChiGiaoHang;
    }

    public int getMaHD() {
        return maHD;
    }

    public void setMaHD(int maHD) {
        this.maHD = maHD;
    }

    public Date getNgayLHD() {
        return ngayLHD;
    }

    public void setNgayLHD(Date ngayLHD) {
        this.ngayLHD = ngayLHD;
    }

    public double getTongTien() {
        return tongTien;
    }

    public void setTongTien(double tongTien) {
        this.tongTien = tongTien;
    }

    public double getTongSoLuong() {
        return tongSoLuong;
    }

    public void setTongSoLuong(double tongSoLuong) {
        this.tongSoLuong = tongSoLuong;
    }

    public String getTrangThaiDonHang() {
        return trangThaiDonHang;
    }

    public void setTrangThaiDonHang(String trangThaiDonHang) {
        this.trangThaiDonHang = trangThaiDonHang;
    }

    public List<ChiTietHoaDon> getDsCTHoaDon() {
        return dsCTHoaDon;
    }

    public void setDsCTHoaDon(List<ChiTietHoaDon> dsCTHoaDon) {
        this.dsCTHoaDon = dsCTHoaDon;
    }

    public Date getNgayGiaoHang() {
        return ngayGiaoHang;
    }

    public void setNgayGiaoHang(Date ngayGiaoHang) {
        this.ngayGiaoHang = ngayGiaoHang;
    }

    public String getDiaChiGiaoHang() {
        return diaChiGiaoHang;
    }

    public void setDiaChiGiaoHang(String diaChiGiaoHang) {
        this.diaChiGiaoHang = diaChiGiaoHang;
    }

}
