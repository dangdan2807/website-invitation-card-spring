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
	private NguoiDungDAO nguoiDungDAO;

	@Override
	@Transactional
	public List<NguoiDung> findAll() {
		return nguoiDungDAO.findAll();
	}

	@Override
	@Transactional
	public List<NguoiDung> findAll(int page) {
		return nguoiDungDAO.findAll(page);
	}

	@Override
	@Transactional
	public int getNumberOfPage() {
		return nguoiDungDAO.getNumberOfPage();
	}

	@Override
	@Transactional
	public void save(NguoiDung nguoiDung) {
		nguoiDungDAO.updateNguoiDung(nguoiDung);
	}

	@Override
	@Transactional
	public NguoiDung findNguoiDungById(int id) {
		return nguoiDungDAO.findNguoiDungById(id);
	}

	@Override
	@Transactional
	public NguoiDung findNguoiDungByEmail(String email) {
		return nguoiDungDAO.findNguoiDungByEmail(email);
	}
}
