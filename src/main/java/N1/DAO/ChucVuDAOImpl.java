package N1.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import N1.entity.ChucVu;

@Repository
public class ChucVuDAOImpl implements ChucVuDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @SuppressWarnings("unchecked")
    public List<ChucVu> getDSChucVu() {
        Session currentSession = sessionFactory.getCurrentSession();
        String queryStr = "SELECT maChucVu, tenChucVu FROM ChucVu";
        List<Object[]> results = currentSession.createNativeQuery(queryStr).getResultList();

        List<ChucVu> dataList = new ArrayList<>();
        results.stream().forEach(item -> {
            int maChucVu = Integer.parseInt(item[0].toString());
            String tenChucVu = item[1].toString();
            dataList.add(new ChucVu(maChucVu, tenChucVu));
        });

        return dataList;
    }

    @Override
    public ChucVu getChucVuById(int chucVuId) {
        return null;
    }

    @Override
    public boolean addChucVu(ChucVu chucVu) {
        return false;
    }

    @Override
    public boolean updateChucVu(ChucVu chucVu) {
        return false;
    }

    @Override
    public boolean deleteChucVu(int chucVuId) {
        return false;
    }

}
