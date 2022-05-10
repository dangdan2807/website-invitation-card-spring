package N1.Controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import N1.DAO.HoaDonDAO;
import N1.Dto.SanPhamMua;
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
	
	@Autowired
	private HoaDonService hoaDonService;
	
	@Autowired
	private NguoiDungService nguoiDungService;
	
	@Autowired
	private TaiKhoanService taiKhoanService;
	
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
		model.addAttribute("isCategoryPage", 0);

		// Mặc định userId=1
		List<SanPhamMua> dsSanPhamMua = sanPhamService.getSanPhamMua(1);
		int soLuong = dsSanPhamMua.size();

		double tongTienHang = 0;
		for (SanPhamMua sanPhamMua : dsSanPhamMua) {
			tongTienHang += sanPhamMua.getThanhTien();
		}
		model.addAttribute("soLuong", soLuong);
		model.addAttribute("tongTienHang", tongTienHang);

		return "user/index";
	}

	@RequestMapping({ "/demo" })
	public String showDemoPage(Model model) {
		List<TaiKhoan> taiKhoanList = new ArrayList<>();
//		NguoiDung nguoiDung = nguoiDungService.findNguoiDungById(1);
		List<NguoiDung> nguoiDungList = new ArrayList<NguoiDung>();
//		nguoiDungList.add(nguoiDung);
//				nguoiDungService.findNguoiDungById(1);
		List<HoaDon> hoaDonList = hoaDonService.findHoaDonByUserId(10);
//		List<HoaDon> hoaDonList = new ArrayList<HoaDon>();
		List<ChiTietHoaDon> ctHoaDonList = new ArrayList<>();
		List<SanPham> sanPhamList = sanPhamService.getRatedTopSanPhams(6);
		List<ChiTietLoaiSP> ctLoaiSPList = new ArrayList<>();
		List<LoaiSanPham> loaiSanPhamList = new ArrayList<>();
		
		model.addAttribute("chucVuList", null);
		model.addAttribute("danhGiaList", null);
		model.addAttribute("taiKhoanList", taiKhoanList);
		model.addAttribute("nguoiDungList", nguoiDungList);
		model.addAttribute("hoaDonList", hoaDonList);
		model.addAttribute("ctHoaDonList", ctHoaDonList);
		model.addAttribute("sanPhamList", sanPhamList);
		model.addAttribute("ctLoaiSPList", ctLoaiSPList);
		model.addAttribute("loaiSanPhamList", loaiSanPhamList);
		return "user/demo";
	}

	@GetMapping({ "/lien-he", "/contact" })
	public String showContractPage(Model model) {
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		model.addAttribute("isCategoryPage", 0);

		return "user/contact";
	}
//
//	@GetMapping({ "/dang-nhap-2", "/login" })
//	public String showLoginPage(Model model) {
//		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
//		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
//		model.addAttribute("isCategoryPage", 0);
//		return "user/login";
//	}

	@GetMapping("/access-denied")
	public String showAccessDenied() {
		return "user/access-denied";
	}
}
