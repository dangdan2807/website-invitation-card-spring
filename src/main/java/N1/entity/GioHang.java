package N1.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@IdClass(GioHangPK.class)
@Table(name = "GioHang")
public class GioHang implements Serializable {
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "maND", columnDefinition = "INT")
	private NguoiDung nguoiDung;

	@Id
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "maSp", columnDefinition = "INT")
	private SanPham sanPham;

	@Column(name = "soLuong", columnDefinition = "INT DEFAULT(1) CHECK(soLuong >= 1)")
	private int soLuong;

	public GioHang() {
	}

	public GioHang(NguoiDung nguoiDung, SanPham sanPham, int soLuong) {
		this.nguoiDung = nguoiDung;
		this.sanPham = sanPham;
		this.soLuong = soLuong;
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

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

}
