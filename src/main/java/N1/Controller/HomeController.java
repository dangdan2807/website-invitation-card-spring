package N1.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import N1.Service.*;
import N1.entity.*;

@Controller
@RequestMapping("")
public class HomeController {
	@Autowired
	private SanPhamService sanPhamService;
	@Autowired
	private LoaiSanPhamService loaiSanPhamService;
	@Autowired
	private DanhGiaService danhGiaService;
	
	@RequestMapping({ "/", "/trang-chu", "/home" })
	public String showHomePage(Model model) {
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);

		List<SanPham> dsSanPham = sanPhamService.getFeaturedSanPhams(8);
		model.addAttribute("dsSanPhamNoiBat", dsSanPham);

		List<SanPham> dsSanPhamMoi = sanPhamService.getLatestSanPhams(6);
		model.addAttribute("dsSanPhamMoi", dsSanPhamMoi);

		List<SanPham> dsSanPhamTot = sanPhamService.getRatedTopSanPhams(6);
		model.addAttribute("dsSanPhamTot", dsSanPhamTot);

		List<SanPham> dsDanhGiaSp = sanPhamService.getReviewSanPhams(6);
		model.addAttribute("dsDanhGiaSp", dsDanhGiaSp);

		SanPham sanPhamMoi = sanPhamService.getLatestSanPham();
		model.addAttribute("sanPhamMoi", sanPhamMoi);
		
		model.addAttribute("tenSanPham", "");

		return "user/index";
	}

	@RequestMapping({ "/demo" })
	public String showDemoPage(Model model) {
		List<TaiKhoan> taiKhoanList = new ArrayList<>();
		List<NguoiDung> nguoiDungList = new ArrayList<>();
		List<HoaDon> hoaDonList = new ArrayList<>();
		List<ChiTietHoaDon> ctHoaDonList = new ArrayList<>();
		List<SanPham> sanPhamList = sanPhamService.getRatedTopSanPhams(6);
		List<ChiTietLoaiSP> ctLoaiSPList = new ArrayList<>();
		List<LoaiSanPham> loaiSanPhamList = new ArrayList<>();
		model.addAttribute("chucVuList", null);
		model.addAttribute("danhGiaList", danhGiaService.getDanhGiasByIdSanPham(97));
		model.addAttribute("taiKhoanList", taiKhoanList);
		model.addAttribute("nguoiDungList", nguoiDungList);
		model.addAttribute("hoaDonList", hoaDonList);
		model.addAttribute("ctHoaDonList", ctHoaDonList);
		model.addAttribute("sanPhamList", sanPhamList);
		model.addAttribute("ctLoaiSPList", ctLoaiSPList);
		model.addAttribute("loaiSanPhamList", loaiSanPhamList);
		return "user/demo";
	}

	@GetMapping({"/lien-he", "/contact"})
	public String showContractPage(Model model) {
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		
		return "user/contact";
	}

	@GetMapping({"/dang-nhap", "/login"})
	public String showLoginPage(Model model) {
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		
		return "user/login";
	}
	
	@RequestMapping({"/gio-hang", "/cart"})
	public String showShoppingCartPage(Model model) {
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		
		List<SanPham> dsSanPham = new ArrayList<SanPham>();
		model.addAttribute("dsSanPham", dsSanPham);
		
		return "user/shopping-cart";
	}

	@RequestMapping({"/thanh-toan", "/checkout"})
	public String showCheckoutPage(Model model) {
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		
		return "user/checkout";
	}

	@GetMapping("/access-denied")
	public String showAccessDenied() {
		return "user/access-denied";
	}
}

