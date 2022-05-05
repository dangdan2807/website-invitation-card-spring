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
    public List<NguoiDung> findAll() {
        return NguoiDungDAO.findAll();
    }

	@Override
    @Transactional
	public List<NguoiDung> findAll(int page) {
		// TODO Auto-generated method stub
		return NguoiDungDAO.findAll(page);
	}

	@Override
    @Transactional
	public int getNumberOfPage() {
		// TODO Auto-generated method stub
		return NguoiDungDAO.getNumberOfPage();
	}

	@Override
    @Transactional
	public void save(NguoiDung nguoiDung) {
		NguoiDungDAO.updateNguoiDung(nguoiDung);
	}

	@Override
    @Transactional
	public NguoiDung findNguoiDungById(int id) {
		// TODO Auto-generated method stub
		return NguoiDungDAO.findNguoiDungById(id);
	}

}
