package N1.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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

    @ManyToOne(fetch = FetchType.LAZY)
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

    public HoaDon(Date ngayLHD, NguoiDung nguoiDung) {
        this.ngayLHD = ngayLHD;
        this.nguoiDung = nguoiDung;
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

    public NguoiDung getNguoiDung() {
        return nguoiDung;
    }

    public void setNguoiDung(NguoiDung nguoiDung) {
        this.nguoiDung = nguoiDung;
    }

}
