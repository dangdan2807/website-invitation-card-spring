package N1.entity;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "NguoiDung")
public class NguoiDung implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "maND", nullable = false, columnDefinition = "INT")
	private int maND;

	@NotNull
	@NotBlank(message = "Tên người dùng không được để trống")
	@Column(name = "tenND", nullable = false, columnDefinition = "NVARCHAR(125)")
	private String tenND;

	@NotBlank(message = "Địa chỉ không được để trống")
	@Column(name = "diaChi", columnDefinition = "TEXT DEFAULT('')")
	private String diaChi;

	@NotBlank(message = "Số điện thoại không được để trống")
	@Pattern(regexp = "(84|0[3|5|7|8|9])+([0-9]{8})", message = "Số điện thoại không hợp lệ")
	@Column(name = "sdt", columnDefinition = "VARCHAR(10) DEFAULT('')")
	private String sdt;

	@Column(name = "hinhAnh", columnDefinition = "text DEFAULT (N'')")
	private String hinhAnh;

	@OneToOne
	@JoinColumn(name = "maTaiKhoan", nullable = false, unique = true, columnDefinition = "INT")
	private TaiKhoan taiKhoan;

	@OneToMany(mappedBy = "nguoiDung", fetch = FetchType.LAZY)
	private Set<HoaDon> hoaDon;

	@OneToMany(mappedBy = "nguoiDung", fetch = FetchType.LAZY)
	private List<DanhGia> danhGia;

	@OneToMany(mappedBy = "nguoiDung", fetch = FetchType.LAZY)
	private Set<GioHang> gioHang;

	public NguoiDung() {
	}

	public NguoiDung(int maND) {
		this.maND = maND;
	}

	public NguoiDung(int maND, String tenND, String diaChi, String sdt, TaiKhoan taiKhoan, Set<HoaDon> hoaDon) {
		this.maND = maND;
		this.tenND = tenND;
		this.diaChi = diaChi;
		this.sdt = sdt;
		this.taiKhoan = taiKhoan;
		this.hoaDon = hoaDon;
	}

	public NguoiDung(int maND, String tenND, String diaChi, String sdt, TaiKhoan taiKhoan) {
		this.maND = maND;
		this.tenND = tenND;
		this.diaChi = diaChi;
		this.sdt = sdt;
		this.taiKhoan = taiKhoan;
	}

	public NguoiDung(String tenND, String diaChi, String sdt, TaiKhoan taiKhoan) {
		this.tenND = tenND;
		this.diaChi = diaChi;
		this.sdt = sdt;
		this.taiKhoan = taiKhoan;
	}

	public int getMaND() {
		return maND;
	}

	public void setMaND(int maND) {
		this.maND = maND;
	}

	public String getTenND() {
		return tenND;
	}

	public void setTenND(String tenND) {
		this.tenND = tenND;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public TaiKhoan getTaiKhoan() {
		return taiKhoan;
	}

	public void setTaiKhoan(TaiKhoan taiKhoan) {
		this.taiKhoan = taiKhoan;
	}

	public String getHinhAnh() {
		return hinhAnh;
	}

	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}

	@Override
	public String toString() {
		return "NguoiDung [maND=" + maND + ", tenND=" + tenND + ", diaChi=" + diaChi + ", sdt=" + sdt + ", hinhAnh="
				+ hinhAnh + "]";
	}

}
