package N1.entity;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class ChiTietHoaDonPK implements Serializable {
    private int hoaDon;
    private int sanPham;

    public ChiTietHoaDonPK() {
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + hoaDon;
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
        ChiTietHoaDonPK other = (ChiTietHoaDonPK) obj;
        if (hoaDon != other.hoaDon)
            return false;
        if (sanPham != other.sanPham)
            return false;
        return true;
    }

}
