package N1.entity;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class GioHangPK implements Serializable {
    private int nguoiDung;
    private int sanPham;

    public GioHangPK() {
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + nguoiDung;
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
        GioHangPK other = (GioHangPK) obj;
        if (nguoiDung != other.nguoiDung)
            return false;
        if (sanPham != other.sanPham)
            return false;
        return true;
    }

}
