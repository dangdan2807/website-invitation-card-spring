package N1.Controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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
	private HoaDonService hoaDonService;
	@Autowired
	private NguoiDungService nguoiDungService;
	@Autowired
	private GioHangService gioHangService;
	
	@RequestMapping({ "/", "/trang-chu", "/home" })
	public String showHomePage(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		NguoiDung nguoiDung = new NguoiDung(); 
		int soLuongSpGh = 0;
		if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
			String email = authentication.getName();
			nguoiDung = nguoiDungService.findNguoiDungByEmail(email);
			soLuongSpGh = gioHangService.getNumOfSanPhamInGioHangByEmail(email);
		}
		model.addAttribute("nguoiDung", nguoiDung);
		model.addAttribute("soLuongSpGh", soLuongSpGh);
		
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

		return "user/index";
	}

	@GetMapping({ "/lien-he", "/contact" })
	public String showContractPage(Model model) {
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		model.addAttribute("isCategoryPage", 0);
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		NguoiDung nguoiDung = new NguoiDung(); 
		int soLuongSpGh = 0;
		if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
			String email = authentication.getName();
			nguoiDung = nguoiDungService.findNguoiDungByEmail(email);
			soLuongSpGh = gioHangService.getNumOfSanPhamInGioHangByEmail(email);
		}
		model.addAttribute("nguoiDung", nguoiDung);
		model.addAttribute("soLuongSpGh", soLuongSpGh);

		return "user/contact";
	}

	@GetMapping("/access-denied")
	public String showAccessDenied() {
		return "user/access-denied";
	}
	
}
