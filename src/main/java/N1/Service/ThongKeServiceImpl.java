package N1.Service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import N1.DTO.ThongKeDTO;

@Service
public class ThongKeServiceImpl implements ThongKeService{
	
	@Autowired
	private ThongKeDTO thongKeDTO;

	@Override
	@Transactional
	public long tongDoanhThu(Date from, Date to) {
		return thongKeDTO.tongDoanhThu(from, to);
	}

	@Override
	@Transactional
	public long tongLoiNhuan(Date from, Date to) {
		return thongKeDTO.tongLoiNhuan(from, to);
	}

	@Override
	@Transactional
	public int tongSoDonHang(Date from, Date to) {
		return thongKeDTO.tongSoDonHang(from, to);
	}

	@Override
	@Transactional
	public int tongSoThiepBan(Date from, Date to) {
		return thongKeDTO.tongSoThiepBan(from, to);
	}

}
