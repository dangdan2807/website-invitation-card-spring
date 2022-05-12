package N1.DTO;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;

public class ThongTinCapNhat {
	private String hinhAnh;
	
	@NotBlank(message = "Số điện thoại không được để trống")
    @Pattern(regexp = "(84|0[3|5|7|8|9])+([0-9]{8})", message = "Số điện thoại không hợp lệ")
    private String sdt;
	
	@NotNull
    @NotBlank(message = "Tên người dùng không được để trống")
    private String tenND;
	
	private String matKhau;
	
	@NotBlank(message = "Địa chỉ không được để trống")
    private String diaChi;
	
	public ThongTinCapNhat() {
		
	}

	public ThongTinCapNhat(String hinhAnh, String sdt, String tenND, String matKhau, String diaChi) {
		super();
		this.hinhAnh = hinhAnh;
		this.sdt = sdt;
		this.tenND = tenND;
		this.matKhau = matKhau;
		this.diaChi = diaChi;
	}

	public String getHinhAnh() {
		return hinhAnh;
	}

	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public String getTenND() {
		return tenND;
	}

	public void setTenND(String tenND) {
		this.tenND = tenND;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	
	
	
}
