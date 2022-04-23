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
@Table(name = "DanhGia")
public class DanhGia implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int maDanhGia;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "maND", columnDefinition = "INT")
	private NguoiDung nguoiDung;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "maSP", columnDefinition = "INT")
	private SanPham sanPham;

	@Column(name = "noiDung", nullable = false, columnDefinition = "TEXT DEFAULT(N'')")
	private String noiDung;

	@Temporal(value = TemporalType.TIMESTAMP)
	@Column(name = "thoiGian", nullable = false, columnDefinition = "DATETIME DEFAULT(GETDATE())")
	private Date thoiGian;

	@Column(name = "xepHang", nullable = false, columnDefinition = "INT DEFAULT(0) CHECK(xepHang >= 0 OR xepHang <= 5)")
	private int xepHang;

	public DanhGia() {
	}

	public DanhGia(NguoiDung nguoiDung, SanPham sanPham, String noiDung, Date thoiGian, int xepHang) {
		super();
		this.nguoiDung = nguoiDung;
		this.sanPham = sanPham;
		this.noiDung = noiDung;
		this.thoiGian = thoiGian;
		this.xepHang = xepHang;
	}

	public int getMaDanhGia() {
		return maDanhGia;
	}

	public void setMaDanhGia(int maDanhGia) {
		this.maDanhGia = maDanhGia;
	}

	public NguoiDung getNguoiDung() {
		return nguoiDung;
	}

	public void setNguoiDung(NguoiDung nguoiDung) {
		this.nguoiDung = nguoiDung;
	}

	public SanPham getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}

	public String getNoiDung() {
		return noiDung;
	}

	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}

	public Date getThoiGian() {
		return thoiGian;
	}

	public void setThoiGian(Date thoiGian) {
		this.thoiGian = thoiGian;
	}

	public int getXepHang() {
		return xepHang;
	}

	public void setXepHang(int xepHang) {
		this.xepHang = xepHang;
	}

}