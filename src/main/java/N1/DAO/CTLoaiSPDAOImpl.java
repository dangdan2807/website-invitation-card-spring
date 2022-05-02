package N1.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import N1.entity.ChiTietLoaiSP;
import N1.entity.LoaiSanPham;

@Repository
public class CTLoaiSPDAOImpl implements CTLoaiSPDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @SuppressWarnings("unchecked")
    public List<ChiTietLoaiSP> getDSChiTietLoaiSP() {
        Session currentSession = sessionFactory.getCurrentSession();
        String queryStr = "select ctl.maSp, sp.maLSP, sp.tenLSP "
                + "from ChiTietLoaiSP ctl, LoaiSanPham sp "
                + "where ctl.maLSP = sp.maLSP ";

        List<Object[]> results = currentSession.createNativeQuery(queryStr).getResultList();
        List<ChiTietLoaiSP> dataList = new ArrayList<>();

        results.stream().forEach(item -> {
            int maLSP = Integer.parseInt(item[1].toString());
            String tenLSP = item[2].toString();
            LoaiSanPham loaiSanPham = new LoaiSanPham(maLSP, tenLSP);
            dataList.add(new ChiTietLoaiSP(loaiSanPham));
        });
        
        return dataList;
    }
    
}
