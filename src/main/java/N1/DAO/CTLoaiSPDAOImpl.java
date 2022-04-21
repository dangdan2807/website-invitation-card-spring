package N1.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import N1.entity.ChiTietLoaiSP;
import N1.entity.LoaiSanPham;

@Repository
public class CTLoaiSPDAOImpl implements CTLoaiSPDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<ChiTietLoaiSP> getDSChiTietLoaiSP() {
        Session currentSession = sessionFactory.getCurrentSession();
        String queryStr = "SELECT lsp.maLSP, lsp.tenLSP "
                + "FROM ChiTietLoaiSP ctl, LoaiSanPham lsp "
                + "WHERE ctl.maLSP = lsp.maLSP ";

        List<Object[]> results = currentSession.createNativeQuery(queryStr).getResultList();
        List<ChiTietLoaiSP> dataList = new ArrayList<>();

        results.stream().forEach(item -> {
            int maLSP = Integer.parseInt(item[0].toString());
            String tenLSP = item[1].toString();
            LoaiSanPham loaiSanPham = new LoaiSanPham(maLSP, tenLSP);
            dataList.add(new ChiTietLoaiSP(loaiSanPham));
        });
        
        return dataList;
    }
    
}
