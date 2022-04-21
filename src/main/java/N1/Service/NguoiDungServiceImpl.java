package N1.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import N1.DAO.NguoiDungDAO;
import N1.entity.NguoiDung;

@Service
public class NguoiDungServiceImpl implements NguoiDungService {
    @Autowired
    private NguoiDungDAO NguoiDungDAO;

    @Override
    @Transactional
    public List<NguoiDung> getDSNguoiDung() {
        return NguoiDungDAO.getDSNguoiDung();
    }

}
