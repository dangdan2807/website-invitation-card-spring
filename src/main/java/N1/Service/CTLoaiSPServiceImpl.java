package N1.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import N1.DAO.CTLoaiSPDAO;
import N1.entity.ChiTietLoaiSP;

@Service
public class CTLoaiSPServiceImpl implements CTLoaiSPService {
    @Autowired
    private CTLoaiSPDAO ctLoaiSPDAO;

    @Override
    @Transactional
    public List<ChiTietLoaiSP> getDSCTLoaiSP() {
        return ctLoaiSPDAO.getDSChiTietLoaiSP();
    }
    
}
