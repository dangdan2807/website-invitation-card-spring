package N1.DTO;

public class ThongTinCapNhat {
	private String hinhAnh;
	private String sdt;
	private String tenND;
	private String matKhau;
	
	
	public ThongTinCapNhat() {
		
	}
	
	public ThongTinCapNhat(String hinhAnh, String sdt, String tenND, String matKhau) {
	
		this.hinhAnh = hinhAnh;
		this.sdt = sdt;
		this.tenND = tenND;
		this.matKhau = matKhau;
	}



	public ThongTinCapNhat(String sdt, String tenND, String matKhau) {
		
		this.sdt = sdt;
		this.tenND = tenND;
		this.matKhau = matKhau;
	}

	public ThongTinCapNhat(String sdt, String tenND) {
		
		this.sdt = sdt;
		this.tenND = tenND;
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

}
