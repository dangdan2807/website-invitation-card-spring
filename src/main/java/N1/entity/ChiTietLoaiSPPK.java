package N1.entity;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class ChiTietLoaiSPPK implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -1560945458984145130L;
	private int loaiSanPham;
    private int sanPham;

    public ChiTietLoaiSPPK() {
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + loaiSanPham;
        result = prime * result + sanPham;
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        ChiTietLoaiSPPK other = (ChiTietLoaiSPPK) obj;
        if (loaiSanPham != other.loaiSanPham)
            return false;
        if (sanPham != other.sanPham)
            return false;
        return true;
    }

}
