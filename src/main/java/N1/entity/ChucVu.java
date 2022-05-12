package N1.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ChucVu")
public class ChucVu implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int maChucVu;

	@Column(name = "tenChucVu", nullable = false, columnDefinition = "NVARCHAR(100) DEFAULT(N'')")
	private String tenChucVu;

	@OneToOne(mappedBy = "chucVu", cascade = CascadeType.ALL)
	private TaiKhoan taiKhoan;

	public ChucVu() {
	}

	public ChucVu(String tenChucVu) {
		this.tenChucVu = tenChucVu;
	}

	public ChucVu(int maChucVu, String tenChucVu) {
		this.maChucVu = maChucVu;
		this.tenChucVu = tenChucVu;
	}

	public int getMaChucVu() {
		return maChucVu;
	}

	public void setMaChucVu(int maChucVu) {
		this.maChucVu = maChucVu;
	}

	public String getTenChucVu() {
		return tenChucVu;
	}

	public void setTenChucVu(String tenChucVu) {
		this.tenChucVu = tenChucVu;
	}

	@Override
	public String toString() {
		return "ChucVu [maChucVu=" + maChucVu + ", tenChucVu=" + tenChucVu + "]";
	}
	
	
}
