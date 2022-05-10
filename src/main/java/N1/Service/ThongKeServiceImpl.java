package N1.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import N1.Dto.ThongKeDTO;
import N1.utils.Datetime;

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

	@Override
	@Transactional
	public LineChartObject doanhThuVaLoiNhuan(Date from, Date to) {
		
		List<Date> dates = Datetime.getDaysBetweenDates(from, to);
		List<Long> loiNhuan = new ArrayList<Long>();
		List<Long> doanhThu = new ArrayList<Long>();
		dates.forEach(date -> {
			loiNhuan.add(thongKeDTO.tongLoiNhuan(date, date));
			doanhThu.add(thongKeDTO.tongDoanhThu(date, date));
		});
		LineChartObject rs = new LineChartObject(dates, loiNhuan, doanhThu);
		return rs;
	}
	

	@Override
	@Transactional
	public LabelCount soDanhMucBanRa(Date from, Date to) {
		return thongKeDTO.soDanhMucBanRa(from, to);
	}
	

	@Override
	@Transactional
	public LineChartObject soDonHang(Date from, Date to) {
		List<Date> dates = Datetime.getDaysBetweenDates(from, to);
		List<Long> soDonHang = new ArrayList<Long>();
		dates.forEach(date -> {
			soDonHang.add((long) thongKeDTO.tongSoDonHang(date, date));
		});
		LineChartObject rs = new LineChartObject(dates, soDonHang);
		return rs;
	}

	@Override
	@Transactional
	public LabelCount soSanPhamBanRa(Date from, Date to) {
		return thongKeDTO.soSanPhamBanRa(from, to);
	}
	
	public class LineChartObject{
		private List<Date> dates;
		private List<Long> line1;
		private List<Long> line2;
		
		public LineChartObject(List<Date> dates, List<Long> line1) {
			super();
			this.dates = dates;
			this.line1 = line1;
		}
		
		public LineChartObject(List<Date> dates, List<Long> line1, List<Long> line2) {
			super();
			this.dates = dates;
			this.line1 = line1;
			this.line2 = line2;
		}

		public List<Date> getDates() { return dates; }

		public void setDates(List<Date> dates) { this.dates = dates; }
		
		public List<Long> getLine1() {
			return line1;
		}

		public void setLine1(List<Long> line1) {
			this.line1 = line1;
		}

		public List<Long> getLine2() {
			return line2;
		}

		public void setLine2(List<Long> line2) {
			this.line2 = line2;
		}

		public String datesToString() {
			String rs = "[";
			
			for(int i=0; i<dates.size(); i++) {
				rs += "'"+Datetime.dateToString(dates.get(i))+"', ";
			}
			rs += "]";
			return rs;
		}

		@Override
		public String toString() {
			return "LineChartObject [dates=" + dates + ", line1=" + line1 + ", line2=" + line2 + "]";
		}
		
	}
	
	public class LabelCount{
		private List<String> label;
		private List<Integer> count;
		public LabelCount(List<String> label, List<Integer> count) {
			super();
			this.label = label;
			this.count = count;
		}
		public List<String> getLabel() {
			return label;
		}
		public void setLabel(List<String> label) {
			this.label = label;
		}
		public List<Integer> getCount() {
			return count;
		}
		public void setCount(List<Integer> count) {
			this.count = count;
		}
		public String labelToString() {
			String rs = "[";
			
			for(int i=0; i<label.size(); i++) {
				rs += "'"+label.get(i)+"', ";
			}
			rs += "]";
			return rs;
		}
		@Override
		public String toString() {
			return "LabelCount [label=" + label + ", count=" + count + "]";
		}
		
	}


}
