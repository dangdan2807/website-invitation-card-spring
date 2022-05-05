package N1.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import N1.entity.LoaiSanPham;

@Repository
public class LoaiSanPhamDAOImpl implements LoaiSanPhamDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<LoaiSanPham> getDSLoaiSanPham() {
        Session currentSession = sessionFactory.getCurrentSession();
        String queryStr = "SELECT lsp.maLSP, lsp.tenLSP "
                + "FROM LoaiSanPham lsp";
        List<Object[]> results = currentSession.createNativeQuery(queryStr).getResultList();

        List<LoaiSanPham> dataList = new ArrayList<>();
        results.stream().forEach(item -> {
            int maLSP = Integer.parseInt(item[0].toString());
            String tenLSP = item[1].toString();
            LoaiSanPham loaiSanPham = new LoaiSanPham(maLSP, tenLSP);
            dataList.add(loaiSanPham);
        });
        return dataList;
    }

    @Override
    public boolean addLoaiSanPham(LoaiSanPham loaiSanPham) {
       Session currentSession=sessionFactory.getCurrentSession();
       currentSession.saveOrUpdate(loaiSanPham);
        return true;
    }
}
