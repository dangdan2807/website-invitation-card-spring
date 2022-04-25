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
public class LoginController {
	@Autowired
	private ChucVuService chucVuService;
	@Autowired
	private TaiKhoanService taiKhoanService;
	@Autowired
	private NguoiDungService nguoiDungService;
	@Autowired
	private HoaDonService hoaDonService;
	@Autowired
	private CTHoaDonService ctHoaDonService;
	@Autowired
	private SanPhamService sanPhamService;
	@Autowired
	private CTLoaiSPService ctLoaiSPService;
	@Autowired
	private LoaiSanPhamService loaiSanPham;

	@RequestMapping({ "/", "/trang-chu", "/home" })
	public String showHomePage(Model model) {
		List<LoaiSanPham> dsLoaiSanPham = new ArrayList<LoaiSanPham>();
		dsLoaiSanPham.add(new LoaiSanPham("Thiệp cưới"));
		dsLoaiSanPham.add(new LoaiSanPham("Thiệp sinh nhật"));
		dsLoaiSanPham.add(new LoaiSanPham("Thiệp mừng 20/11"));
		dsLoaiSanPham.add(new LoaiSanPham("Thiệp năm mới"));
		dsLoaiSanPham.add(new LoaiSanPham("Thiệp giáng sinh"));
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		return "user/index";
	}

	@RequestMapping({ "/demo" })
	public String showDemoPage(Model model) {
		List<ChucVu> chucVuList = chucVuService.getDSChucVu();
		List<TaiKhoan> taiKhoanList = taiKhoanService.getDSTaiKhoan();
		List<NguoiDung> nguoiDungList = nguoiDungService.getDSNguoiDung();
		List<HoaDon> hoaDonList = hoaDonService.getDSHoaDon();
		List<ChiTietHoaDon> ctHoaDonList = ctHoaDonService.getDSCTHoaDon();
		List<SanPham> sanPhamList = sanPhamService.getDSSanPham();
		List<ChiTietLoaiSP> ctLoaiSPList = ctLoaiSPService.getDSCTLoaiSP();
		List<LoaiSanPham> loaiSanPhamList = loaiSanPham.getDSLoaiSanPham();
		// model.addAttribute("chucVuList", chucVuList);
		// model.addAttribute("taiKhoanList", taiKhoanList);
		// model.addAttribute("nguoiDungList", nguoiDungList);
		model.addAttribute("hoaDonList", hoaDonList);
		// model.addAttribute("ctHoaDonList", ctHoaDonList);
		// model.addAttribute("sanPhamList", sanPhamList);
		// model.addAttribute("ctLoaiSPList", ctLoaiSPList);
		// model.addAttribute("loaiSanPhamList", loaiSanPhamList);
		return "user/demo";
	}

	@GetMapping("/contact")
	public String showContractPage() {
		return "user/contact";
	}

	@GetMapping("/login")
	public String showLoginPage() {
		return "user/login";
	}

	@GetMapping("/access-denied")
	public String showAccessDenied() {
		return "user/access-denied";
	}
}