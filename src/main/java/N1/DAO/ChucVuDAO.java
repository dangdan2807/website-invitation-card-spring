package N1.DAO;

import java.util.List;

import N1.entity.ChucVu;

public interface ChucVuDAO {
    public List<ChucVu> getDSChucVu();
    public ChucVu getChucVuById(int chucVuId);
    public ChucVu addChucVu(ChucVu chucVu);
    public boolean updateChucVu(int chucVuId,ChucVu chucVu);
    public boolean deleteChucVu(int chucVuId);
}
