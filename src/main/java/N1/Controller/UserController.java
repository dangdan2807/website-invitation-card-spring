package N1.Controller;

import java.nio.charset.StandardCharsets;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import N1.DTO.*;
import N1.Service.*;
import N1.entity.*;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private SanPhamService sanPhamService;

	@Autowired
	private NguoiDungService nguoiDungService;

	@Autowired
	private LoaiSanPhamService loaiSanPhamService;

	@Autowired
	private HoaDonService hoaDonService;

	@Autowired
	private GioHangService gioHangService;

	@Autowired
	private CTHoaDonService ctHoaDonService;
	@Autowired
	private TaiKhoanService taiKhoanService;
	@RequestMapping({ "/gio-hang", "/cart" })
	public String showShoppingCartPage(Model model) {
		String returnUrl = "";
		returnUrl = "redirect:/dang-nhap";
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		NguoiDung nguoiDung = new NguoiDung(); 
		int soLuongSpGh = 0;
		if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
			model.addAttribute("isCategoryPage", 0);
			String email = authentication.getName();
			nguoiDung = nguoiDungService.findNguoiDungByEmail(email);
			soLuongSpGh = gioHangService.getNumOfSanPhamInGioHangByEmail(email);
			model.addAttribute("nguoiDung", nguoiDung);
			model.addAttribute("soLuongSpGh", soLuongSpGh);
			
			int maND = nguoiDung.getMaND();
			List<GioHang> gioHang = gioHangService.findGioHangByUserId(maND);
			double tongTien = 0;
			for (GioHang gioHang2 : gioHang) {
				tongTien += gioHang2.getSanPham().getGiaSP() * gioHang2.getSoLuong() *
						(100 - gioHang2.getSanPham().getGiamGia()) / 100;
			}
			model.addAttribute("tongTien", tongTien);
			
			List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
			model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
			
			List<GioHang> dsGioHang = gioHangService.findGioHangByUserId(maND);
			model.addAttribute("dsSanPhamGioHang", dsGioHang);
			returnUrl = "user/shopping-cart";
		}

		return returnUrl;
	}

	@RequestMapping({ "/thanh-toan", "/checkout" })
	public String showCheckoutPage(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = "";
		if (principal instanceof UserDetails) {
			username = ((UserDetails) principal).getUsername();
		} else {
			username = principal.toString();
		}
		NguoiDung nguoiDung = nguoiDungService.findNguoiDungByEmail(username);
		int soLuongSpGh = gioHangService.getNumOfSanPhamInGioHangByEmail(username);
		model.addAttribute("soLuongSpGh", soLuongSpGh);
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		// NguoiDung nguoiDung = nguoiDungService.findNguoiDungById(maND);
		model.addAttribute("nguoiDung", nguoiDung);

		List<SanPhamMua> dsSanPhamMua = sanPhamService.getSanPhamMua(nguoiDung.getMaND());
		int soLuong = dsSanPhamMua.size();
		model.addAttribute("dsSanPhamMua", dsSanPhamMua);

		model.addAttribute("soLuong", soLuong);

		double tongTienHang = 0;
		for (SanPhamMua sanPhamMua : dsSanPhamMua) {
			tongTienHang += sanPhamMua.getThanhTien();
		}

		double giamGia = tongTienHang * 0.05;
		double tongThanhToan = tongTienHang - giamGia;
		model.addAttribute("tongTienHang", tongTienHang);
		model.addAttribute("giamGia", giamGia);
		model.addAttribute("tongThanhToan", tongThanhToan);
		model.addAttribute("isCategoryPage", 0);

		return "user/checkout";
	}

	@RequestMapping(value = "/orders/success", method = RequestMethod.POST)
	public String createHoaDon(PayLoadCreateOrder payLoadCreateOrder, Model model, Principal principal) {
		model.addAttribute("isCategoryPage", 0);

		String username = "";
		if (principal != null) {
			username = principal.getName();
		}
		int soLuongSpGh = gioHangService.getNumOfSanPhamInGioHangByEmail(username);
		model.addAttribute("soLuongSpGh", soLuongSpGh);

		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		String diaChi = payLoadCreateOrder.getDiaChi();
		// 1 Lay user tu context security
		// 1.1 lay chi tiet user
		NguoiDung nguoiDung = nguoiDungService.findNguoiDungByEmail(username);
		// 2 Lay thong tin gio hang tu user
		List<ChiTietHoaDon> chiTietHoaDons = new ArrayList<ChiTietHoaDon>();
		List<SanPhamMua> dsSanPhamMua = sanPhamService.getSanPhamMua(nguoiDung.getMaND());
		// có danh sách sản phẩm mua -> mã sp, số lượng , thành tiền
		double tongTienHang = 0;
		int tongSoLuong = 0;
		for (SanPhamMua sanPhamMua : dsSanPhamMua) {
			tongTienHang += sanPhamMua.getThanhTien();
			tongSoLuong += sanPhamMua.getSoLuong();
		}
		double tongThanhToan = tongTienHang - tongTienHang * 0.05;
		// 3 Tien hanh tao hoa don, tao chi tiet hoa don-> Luu thanh cong
		Date ngayLHD = new Date();
		Date ngayGiaoHang = new Date(ngayLHD.getTime() + (3 * 1000 * 60 * 60 * 24));
		String trangThaiDonHang = "Chưa thanh toán";
		HoaDon hoaDon = new HoaDon(ngayLHD, tongThanhToan, tongSoLuong, trangThaiDonHang, ngayGiaoHang, diaChi,
				nguoiDung);
		HoaDon hoadonSave = hoaDonService.addHoaDon(hoaDon);
		dsSanPhamMua.forEach(e -> {
			SanPham sanPham = sanPhamService.getSanPhamByIdSanPham(e.getMaSp());
			ChiTietHoaDon cthd = new ChiTietHoaDon(hoadonSave, sanPham, e.getSoLuong(), e.getGiaSp());
			ctHoaDonService.addChiTietHoaDon(cthd);
			chiTietHoaDons.add(cthd);
		});
		// 4 Xoa gio hang cua khach hang
		gioHangService.deleteGioHangByIdNguoiDung(nguoiDung.getMaND());
		// 5 Tao trang chi tiet hoa don( truyen du lieu hoa don vua tao duoc qua trang
		// do)
		model.addAttribute("hoadonThanhToan", hoadonSave);
		model.addAttribute("chiTietHoaDons", chiTietHoaDons);
		model.addAttribute("tongTienHang", tongTienHang);
		model.addAttribute("giamGia", tongTienHang * 0.05);
		return "user/detail-order";
	}

	@RequestMapping(value = { "/show-order" })
	public String showHoaDonChiTiet(@RequestParam("maHD") int maHD, Model model, Principal principal) {
		NguoiDung nguoiDungLogin = new NguoiDung();
		int soLuongSpGh = 0;
		if (principal != null) {
			String email = principal.getName();
			nguoiDungLogin = nguoiDungService.findNguoiDungByEmail(email);
			soLuongSpGh = gioHangService.getNumOfSanPhamInGioHangByEmail(email);
		}
		model.addAttribute("nguoiDung", nguoiDungLogin);
		model.addAttribute("soLuongSpGh", soLuongSpGh);

		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		// Tìm hóa đơn theo mã hóa đơn
		System.out.println("maHD" + maHD);
		HoaDon hoaDon = hoaDonService.findHoaDonById(maHD);
		System.out.println(hoaDon.toString());
		List<ChiTietHoaDon> cthds = new ArrayList<ChiTietHoaDon>();
		cthds = ctHoaDonService.getDSCTHoaDonByMaHD(hoaDon.getMaHD());
		double tongTienHang = 0;
		for (ChiTietHoaDon chiTietHoaDon : cthds) {
			tongTienHang = tongTienHang + chiTietHoaDon.getThanhTien();
		}
		model.addAttribute("hoadonThanhToan", hoaDon);
		model.addAttribute("chiTietHoaDons", cthds);
		model.addAttribute("tongTienHang", tongTienHang);
		model.addAttribute("giamGia", tongTienHang * 0.05);

		model.addAttribute("isCategoryPage", 0);
		return "user/show-my-order";
	}

	@RequestMapping(value = { "/order/history", "/lich-su-mua-hang" })
	public String showHoaDonByNguoiDung(Model model, Principal principal) {
		String returnUrl = "";
		returnUrl = "redirect:/dang-nhap";
		
		NguoiDung nguoiDung = new NguoiDung();
		int soLuongSpGh = 0;
		Authentication authentication =SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
			String email = authentication.getName();
			nguoiDung = nguoiDungService.findNguoiDungByEmail(email);
			soLuongSpGh = gioHangService.getNumOfSanPhamInGioHangByEmail(email);

			model.addAttribute("nguoiDung", nguoiDung);
			model.addAttribute("soLuongSpGh", soLuongSpGh);
	
			List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
			model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
	
			List<HoaDon> hoaDons = hoaDonService.findHoaDonByUserId(nguoiDung.getMaND());
			hoaDons.forEach(e -> {
				List<ChiTietHoaDon> cthds = new ArrayList<ChiTietHoaDon>();
				cthds = ctHoaDonService.getDSCTHoaDonByMaHD(e.getMaHD());
				e.setDsCTHoaDon(cthds);
			});
			model.addAttribute("hoadons", hoaDons);
			model.addAttribute("isCategoryPage", 0);
			returnUrl = "user/history";
			
		}
		return returnUrl;
	
	}

	@RequestMapping("/profile")
	public String showMyProfile(Model model, Principal principal) {
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		
		NguoiDung nguoiDung = new NguoiDung();
		int soLuongSpGh = 0;
		String email = "";
		if (principal != null) {
			email = principal.getName();
			nguoiDung = nguoiDungService.findNguoiDungByEmail(email);
			soLuongSpGh = gioHangService.getNumOfSanPhamInGioHangByEmail(email);
		}
		boolean kq=false;
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		model.addAttribute("kq", kq);
		model.addAttribute("nguoiDung", nguoiDung);
		model.addAttribute("soLuongSpGh", soLuongSpGh);
		model.addAttribute("email", email);
		model.addAttribute("isCategoryPage", 0);
		return "user/form-update-profile";
	}

	@RequestMapping("/profile/edit")
	public String updateProfile(ThongTinCapNhat thongTinCapNhat, Model model,Principal principal) {
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		
		NguoiDung nguoiDung = new NguoiDung();
		int soLuongSpGh = 0;
		String email = "";
		if (principal != null) {
			email = principal.getName();
			nguoiDung = nguoiDungService.findNguoiDungByEmail(email);
			soLuongSpGh = gioHangService.getNumOfSanPhamInGioHangByEmail(email);
		}
		String sdt=thongTinCapNhat.getSdt();
		String tenND=thongTinCapNhat.getTenND();
		
		// Cập nhật mật khẩu mà mật khẩu cần phải băm
		String matKhau=thongTinCapNhat.getMatKhau();
		System.out.println(matKhau);
		TaiKhoan taiKhoan=nguoiDung.getTaiKhoan();
		if(!matKhau.equals("")) {
			PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
				String encodedPassword = passwordEncoder.encode(matKhau);
				encodedPassword = "{bcrypt}" + encodedPassword;
				taiKhoan.setMatKhau(encodedPassword);
				taiKhoanService.updateTaiKhoan(taiKhoan);
		}
		nguoiDung.setSdt(sdt);
		nguoiDung.setTenND(tenND);
		nguoiDung.setTaiKhoan(taiKhoan);
		boolean kq=nguoiDungService.updateNguoiDung(nguoiDung);
		
		model.addAttribute("email", email);
		model.addAttribute("nguoiDung", nguoiDung);
		model.addAttribute("soLuongSpGh", soLuongSpGh);
		model.addAttribute("kq", kq);
		model.addAttribute("isCategoryPage", 0);
		return "user/form-update-profile";
	}
	
}
