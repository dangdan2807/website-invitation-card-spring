package N1.DTO;

public class SanPhamMua {

	private int maSp;
	private String tenSp;
	private double giaSp;
	private int soLuong;
	private double thanhTien;
	public SanPhamMua() {
		
	}
	public SanPhamMua(int maSp, String tenSp, double giaSp, int soLuong) {
		
		this.maSp = maSp;
		this.tenSp = tenSp;
		this.giaSp = giaSp;
		this.soLuong = soLuong;
		this.thanhTien=soLuong*giaSp;
	}
	public double getThanhTien() {
		return thanhTien;
	}
	public void setThanhTien(double thanhTien) {
		this.thanhTien = thanhTien;
	}
	public int getMaSp() {
		return maSp;
	}
	public void setMaSp(int maSp) {
		this.maSp = maSp;
	}
	public String getTenSp() {
		return tenSp;
	}
	public void setTenSp(String tenSp) {
		this.tenSp = tenSp;
	}
	public double getGiaSp() {
		return giaSp;
	}
	public void setGiaSp(double giaSp) {
		this.giaSp = giaSp;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	
	
}
