package N1.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

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

    @Transactional
    @Override
    public ChucVu getChucVuById(int chucVuId) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.find(ChucVu.class, chucVuId);
    }

    @Override
    public ChucVu addChucVu(ChucVu chucVu) {
        Session currentSession = sessionFactory.getCurrentSession();
          currentSession.saveOrUpdate(chucVu);
          return chucVu;
    }

    @Override
    public boolean updateChucVu(int chucVuId,ChucVu chucVu) {
        Session currentSession = sessionFactory.getCurrentSession();
		ChucVu chucVuUpdate= getChucVuById(chucVuId);
        if(chucVuUpdate==null){
            return false;
        }
		chucVuUpdate.setTenChucVu(chucVu.getTenChucVu());
		currentSession.saveOrUpdate(chucVuUpdate);
		return true;
    }

    @Override
    public boolean deleteChucVu(int chucVuId) {
        Session currentSession = sessionFactory.getCurrentSession();
        ChucVu chucVu=getChucVuById(chucVuId);
        if(chucVu==null){
            return false;
        }
        currentSession.delete(chucVu);
        return true;
    }

}
