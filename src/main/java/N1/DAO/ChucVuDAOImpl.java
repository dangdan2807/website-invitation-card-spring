package N1.DAO;

import java.util.List;

import org.hibernate.query.Query;
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
    public List<ChucVu> getDanhSachChucVu() {
        Session currentSession = sessionFactory.getCurrentSession();

        Query<ChucVu> theQuery = currentSession.createQuery("from ChucVu", ChucVu.class);
        // execute query and get result list
        List<ChucVu> persons = theQuery.getResultList();
        return persons;
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
