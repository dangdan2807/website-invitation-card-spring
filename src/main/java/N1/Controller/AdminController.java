package N1.Controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import N1.DTO.DSCTHoaDonForm;
import N1.Service.*;
import N1.Service.ThongKeService;
import N1.Service.ThongKeServiceImpl.LineChartObject;
import N1.Service.ThongKeServiceImpl.LabelCount;
import N1.entity.*;
import N1.utils.Datetime;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private ThongKeService thongKeService;
	
	@Autowired
	private SanPhamService sanPhamService;

	@Autowired
	private NguoiDungService nguoiDungService;

	@Autowired
	private LoaiSanPhamService loaiSanPhamService;

	@Autowired
	private HoaDonService hoaDonService;	
	
	@Autowired
	private CTHoaDonService ctHoaDonService;	
	
	/**************************** Dashboard *******************************/
	@GetMapping("")
	public String dashboard(@RequestParam(name = "dateType", required = false) String dateType,
			@RequestParam(name = "from", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date from, 
			@RequestParam(name = "to", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date to, Model model, HttpServletRequest request) {
		String path = request.getServletPath();
		
		if(dateType == null)
			dateType = "today";
		
		if(dateType.equals("today")) {
			from = Datetime.getToday();
			to = Datetime.getToday();
		}
		
		if(dateType.equals("yesterday")) {
			from = Datetime.yesterday();
			to = Datetime.yesterday();
		}
		
		if(dateType.equals("one_week_ago")) {
			from = Datetime.oneWeekAgo();
			to = Datetime.getToday();
		}
		
		if(dateType.equals("one_month_ago")) {
			from = Datetime.oneMonthAgo();
			to = Datetime.getToday();
		}
		
		if(dateType.equals("one_year_ago")) {
			from = Datetime.oneYearAgo();
			to = Datetime.getToday();
		}
		
		if(from == null)
			from = Datetime.getToday();
			
		if(to == null)
			to = Datetime.getToday();
		
		long tongDoanhThu = thongKeService.tongDoanhThu(from, to);
		long tongLoiNhuan = thongKeService.tongLoiNhuan(from, to);
		long tongSoDonHang = thongKeService.tongSoDonHang(from, to);
		long tongSoThiepBan = thongKeService.tongSoThiepBan(from, to);
		LineChartObject doanhThuLoiNhuan = thongKeService.doanhThuVaLoiNhuan(from, to);
		LabelCount soDanhMucBanRa = thongKeService.soDanhMucBanRa(from, to);
		LineChartObject soDonHang = thongKeService.soDonHang(from, to);
		LabelCount soSanPhamBanRa = thongKeService.soSanPhamBanRa(from, to);
		model.addAttribute("path", path);
		model.addAttribute("dateType", dateType);
		model.addAttribute("from", from);
		model.addAttribute("to", to);
		model.addAttribute("tongDoanhThu", tongDoanhThu);
		model.addAttribute("tongLoiNhuan", tongLoiNhuan);
		model.addAttribute("tongSoDonHang", tongSoDonHang);
		model.addAttribute("tongSoThiepBan", tongSoThiepBan);
		// doanh thu va loi nhuan
		model.addAttribute("doanhThuLoiNhuan", doanhThuLoiNhuan);
		
		// So danh muc ban ra
		model.addAttribute("soDanhMucBanRa", soDanhMucBanRa);
		
		// thống kê đơn hàng
		model.addAttribute("soDonHang", soDonHang);
		
		// So danh muc ban ra
		model.addAttribute("soSanPhamBanRa", soSanPhamBanRa);
		
		return "admin/index";
	}
	
	/**************************** User *******************************/
	@GetMapping("/user")
	public String user(@RequestParam(name = "page", required = false) Integer page, Model model, HttpServletRequest request) {
		String path = request.getServletPath();
		
		if(page == null)
			page = 1;
		
		model.addAttribute("msg", request.getParameter("msg"));
		model.addAttribute("status", request.getParameter("status"));
		
		List<NguoiDung> users = nguoiDungService.findAll(page);
		model.addAttribute("title", "Quản lý người dùng");
		model.addAttribute("numberOfPage", nguoiDungService.getNumberOfPage());
		model.addAttribute("currentPage", page);
		model.addAttribute("path", path);
		model.addAttribute("users", users);
		model.addAttribute("nguoiDung", new NguoiDung());
		return "admin/user";
	}
	
	@PostMapping("/user")
	public String updateNguoiDung(@ModelAttribute("nguoiDung") NguoiDung nguoiDung, Model model, 
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		System.out.println(nguoiDung);
		
		NguoiDung nguoiDung2 = nguoiDungService.findNguoiDungById(nguoiDung.getMaND());
		nguoiDung2.setTenND(nguoiDung.getTenND());
		nguoiDung2.setSdt(nguoiDung.getSdt());
		nguoiDung2.setDiaChi(nguoiDung.getDiaChi());
		nguoiDung2.setHinhAnh(nguoiDung.getHinhAnh());
		System.out.println(nguoiDung2.getTaiKhoan());
		nguoiDungService.save(nguoiDung2);
		
		redirectAttributes.addAttribute("msg", "Cập nhật người dùng thành công");
		redirectAttributes.addAttribute("status", 1);
			
		return "redirect:/admin/user";
	}
	
	/**************************** Order *******************************/
	@GetMapping("/order")
	public String order(@RequestParam(name = "maHD", required = false) Integer maHD, 
			@RequestParam(name = "page", required = false) Integer page, 
			Model model, HttpServletRequest request) {
		String path = request.getServletPath();
		
		if(page == null)
			page = 1;
		
		model.addAttribute("msg", request.getParameter("msg"));
		model.addAttribute("status", request.getParameter("status"));
		
		HoaDon order = new HoaDon();
		List<ChiTietHoaDon> dsCTHoaDon = new ArrayList<ChiTietHoaDon>();
		if(maHD != null) {
			order = hoaDonService.findHoaDonById(maHD);
			dsCTHoaDon = ctHoaDonService.getChiTietHoaDonByMaHD(maHD);
			order.setDsCTHoaDon(dsCTHoaDon);
		}
		System.out.println(dsCTHoaDon);
		List<SanPham> dsSanPham = sanPhamService.getDSSanPham(page);
		List<NguoiDung> users = nguoiDungService.findAll();
		List<HoaDon> orders = hoaDonService.findAll(page);
		
		
		
		model.addAttribute("maHD", maHD);
		model.addAttribute("dsCTHoaDon", dsCTHoaDon);
		model.addAttribute("title", "Quản lý hóa đơn");
		model.addAttribute("numberOfPage", hoaDonService.getNumberOfPage());
		model.addAttribute("currentPage", page);
		model.addAttribute("path", path);
		model.addAttribute("orders", orders);
		model.addAttribute("users", users);
		model.addAttribute("dsSanPham", dsSanPham);
		model.addAttribute("order", order);
		return "admin/order";
	}
	
	@PostMapping("/order")
	public String addOrUpdateOrder(@ModelAttribute("hoaDon") HoaDon hoaDon, 
			@RequestParam("dscthdmaSp") List<Integer> dscthdmaSp,
			@RequestParam("dscthdsoLuong") List<Integer> dscthdsoLuong, 
			Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		System.out.println(hoaDon);
		System.out.println(dscthdmaSp);
		System.out.println(dscthdsoLuong);
		
		
		List<ChiTietHoaDon> dscthd = new ArrayList<ChiTietHoaDon>();
		for(int i=0; i<dscthdmaSp.size(); i++) {
			SanPham sanPham = sanPhamService.getSanPhamByIdSanPham(dscthdmaSp.get(i));
			System.out.println(sanPham.getGiaSauGiamGia());
			dscthd.add(new ChiTietHoaDon(hoaDon, sanPham, dscthdsoLuong.get(i), sanPham.getGiaSauGiamGia()));
		}
		hoaDon.setDsCTHoaDon(dscthd);
		if(hoaDon.getMaHD() == 0)
			hoaDon.setNgayLHD(Datetime.getToday());
		hoaDonService.saveHoaDon(hoaDon);
		if(hoaDon.getMaHD() == 0) {
			redirectAttributes.addAttribute("msg", "Thêm hóa đơn thành công!");
			redirectAttributes.addAttribute("status", 1);
		}else {
			redirectAttributes.addAttribute("msg", "Cập nhật hóa đơn thành công");
			redirectAttributes.addAttribute("status", 1);
		}
		
		return "redirect:/admin/order";
	}
	
	@GetMapping("/delete-order")
	public String deleteOrder(@RequestParam(name = "maHD") Integer maHD, Model model, HttpServletRequest request, 
			RedirectAttributes redirectAttributes) {
		redirectAttributes.addAttribute("msg", "Xóa hóa đơn thành công!");
		redirectAttributes.addAttribute("status", 1);
		hoaDonService.delete(maHD);
		return "redirect:/admin/order";
	}
	
	/**************************** Product *******************************/
	@GetMapping(value = "/product")
	public String product(@RequestParam(name = "page", required = false) Integer page, Model model, HttpServletRequest request) {
		String path = request.getServletPath();
		
		if(page == null)
			page = 1;
		
		model.addAttribute("msg", request.getParameter("msg"));
		model.addAttribute("status", request.getParameter("status"));
		
		List<SanPham> dsSanPham = sanPhamService.getDSSanPham(page);
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("title", "Quản lý thiệp");
		model.addAttribute("dsSanPham", dsSanPham);
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		model.addAttribute("numberOfPage", sanPhamService.getNumberOfPage());
		model.addAttribute("currentPage", page);
		model.addAttribute("path", path);
		model.addAttribute("sanPham", new SanPham());

		return "admin/product";
	}
	
	@PostMapping("/product")
	public String addOrUpdateProduct(@ModelAttribute("sanPham") SanPham sanPham, 
			Model model, HttpServletRequest request, RedirectAttributes redirectAttributes, 
			@RequestParam(value = "dsLoaiSanPham") List<Integer> dsLoaiSanPham) {
		System.out.println("hi");
		System.out.println(sanPham);
		System.out.println(dsLoaiSanPham);
		
		if(sanPham.getMaSp() == 0) {
			redirectAttributes.addAttribute("msg", "Thêm sản phẩm thành công!");
			redirectAttributes.addAttribute("status", 1);
		}else {
			redirectAttributes.addAttribute("msg", "Cập nhật sản phẩm thành công");
			redirectAttributes.addAttribute("status", 1);
		}
		
		List<ChiTietLoaiSP> ctlsp = new ArrayList<ChiTietLoaiSP>();
		dsLoaiSanPham.forEach(lsp -> {
			ctlsp.add(new ChiTietLoaiSP(new LoaiSanPham(lsp, null)));
		});
		sanPham.setDsLoaiSP(ctlsp);
		try {
			sanPhamService.save(sanPham);
		}catch (Exception e) {
			redirectAttributes.addAttribute("msg", "Có lỗi xảy ra");
			redirectAttributes.addAttribute("status", 0);
		}
		
			
		return "redirect:/admin/product";
	}
	
	@GetMapping("/delete-product")
	public String deleteProduct(@RequestParam(name = "maSp") Integer maSp, Model model, HttpServletRequest request, 
			RedirectAttributes redirectAttributes) {
		redirectAttributes.addAttribute("msg", "Xóa sản phẩm thành công!");
		redirectAttributes.addAttribute("status", 1);
		sanPhamService.delete(maSp);
		return "redirect:/admin/product";
	}
	
	/**************************** Category *******************************/
	
	@GetMapping("/category")
	public String category(@RequestParam(name = "page", required = false) Integer page, Model model, HttpServletRequest request) {
		String path = request.getServletPath();
		
		if(page == null)
			page = 1;
		
		model.addAttribute("msg", request.getParameter("msg"));
		model.addAttribute("status", request.getParameter("status"));
		
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll(page);
		model.addAttribute("title", "Quản lý danh mục thiệp");
		model.addAttribute("numberOfPage", loaiSanPhamService.getNumberOfPage());
		model.addAttribute("currentPage", page);
		model.addAttribute("path", path);
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		model.addAttribute("loaiSanPham", new LoaiSanPham());
		return "admin/category";
	}
	
	@PostMapping("/category")
	public String addOrUpdateCategory(@ModelAttribute("loaiSanPham") LoaiSanPham loaiSanPham, Model model, 
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		System.out.println(loaiSanPham);
		loaiSanPhamService.save(loaiSanPham);
		if(loaiSanPham.getMaLSP() == 0) {
			redirectAttributes.addAttribute("msg", "Thêm danh mục sản phẩm thành công!");
			redirectAttributes.addAttribute("status", 1);
		}else {
			redirectAttributes.addAttribute("msg", "Cập nhật danh mục sản phẩm thành công");
			redirectAttributes.addAttribute("status", 1);
		}
			
		return "redirect:/admin/category";
	}
	
	@GetMapping("/delete-category")
	public String deleteCategory(@RequestParam(name = "maLSP") Integer maLSP, Model model, HttpServletRequest request, 
			RedirectAttributes redirectAttributes) {
		redirectAttributes.addAttribute("msg", "Xóa danh mục sản phẩm thành công!");
		redirectAttributes.addAttribute("status", 1);
		loaiSanPhamService.delete(maLSP);
		return "redirect:/admin/category";
	}
}
