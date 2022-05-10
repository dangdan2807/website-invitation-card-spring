package N1.DTO;

import java.util.List;

public class DSCTHoaDonForm {
	private List<Integer> maHD;
	private List<Integer> soLuong;
	
	public DSCTHoaDonForm() {
		
	}

	public DSCTHoaDonForm(List<Integer> maHD, List<Integer> soLuong) {
		super();
		this.maHD = maHD;
		this.soLuong = soLuong;
	}

	public List<Integer> getMaHD() {
		return maHD;
	}

	public void setMaHD(List<Integer> maHD) {
		this.maHD = maHD;
	}

	public List<Integer> getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(List<Integer> soLuong) {
		this.soLuong = soLuong;
	}

	@Override
	public String toString() {
		return "DSCTHoaDonForm [maHD=" + maHD + ", soLuong=" + soLuong + "]";
	}
		
}
