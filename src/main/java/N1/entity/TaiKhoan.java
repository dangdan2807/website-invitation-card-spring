package N1.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import java.io.Serializable;

import javax.persistence.CascadeType;

@Entity
@Table(name = "TaiKhoan")
public class TaiKhoan implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "maTaiKhoan", nullable = false, columnDefinition = "INT")
    private int maTaiKhoan;

    @Column(name = "tenDangNhap", nullable = false, columnDefinition = "VARCHAR(255)")
    private String tenDangNhap;

    @Column(name = "matKhau", nullable = false, columnDefinition = "VARCHAR(100)")
    private String matKhau;

    @Column(name = "tinhTrang", nullable = false, columnDefinition = "INT DEFAULT (1)")
    private int tinhTrang;

    @OneToOne
    @JoinColumn(name = "maChucVu", nullable = false, columnDefinition = "INT")
    private ChucVu chucVu;

    @OneToOne(mappedBy = "taiKhoan", cascade = CascadeType.ALL)
    private NguoiDung nguoiDung;

    public TaiKhoan() {
    }

    public TaiKhoan(int maTaiKhoan, String tenDangNhap, String matKhau, int tinhTrang, ChucVu chucVu) {
        this.maTaiKhoan = maTaiKhoan;
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
        this.tinhTrang = tinhTrang;
        this.chucVu = chucVu;
    }

    public TaiKhoan(String tenDangNhap, String matKhau, int tinhTrang, ChucVu chucVu) {
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
        this.tinhTrang = tinhTrang;
        this.chucVu = chucVu;
    }

    public TaiKhoan(String tenDangNhap, String matKhau) {
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
        this.tinhTrang = 1;
    }

    public TaiKhoan(String tenDangNhap, int tinhTrang, ChucVu chucVu) {
        this.tenDangNhap = tenDangNhap;
        this.tinhTrang = tinhTrang;
        this.chucVu = chucVu;
    }

    public int getMaTaiKhoan() {
        return maTaiKhoan;
    }

    public void setMaTaiKhoan(int maTaiKhoan) {
        this.maTaiKhoan = maTaiKhoan;
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public int getTinhTrang() {
        return tinhTrang;
    }

    public void setTinhTrang(int tinhTrang) {
        this.tinhTrang = tinhTrang;
    }

    public ChucVu getChucVu() {
        return chucVu;
    }

    public void setChucVu(ChucVu chucVu) {
        this.chucVu = chucVu;
    }

}
