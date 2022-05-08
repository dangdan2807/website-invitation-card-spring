package N1.Controller;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import N1.Dto.PayLoadCreateOrder;
import N1.Dto.SanPhamMua;
import N1.Service.*;
import N1.entity.*;

@Controller
@RequestMapping("")
public class HomeController {
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

	@GetMapping({ "/lien-he", "/contact" })
	public String showContractPage(Model model) {
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		
		return "user/contact";
	}

	@GetMapping({ "/dang-nhap", "/login" })
	public String showLoginPage(Model model) {
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);

		return "user/login";
	}

	@RequestMapping({ "/gio-hang", "/cart" })
	public String showShoppingCartPage(Model model) {
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		List<SanPham> dsSanPham = new ArrayList<SanPham>();
		model.addAttribute("dsSanPham", dsSanPham);

		return "user/shopping-cart";
	}

	@RequestMapping({ "/thanh-toan/{maND}", "/checkout/{maND}" })
	public String showCheckoutPage(Model model, @PathVariable int maND) {
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		NguoiDung nguoiDung = nguoiDungService.findNguoiDungById(maND);
		model.addAttribute("nguoiDung", nguoiDung);
		List<SanPhamMua> dsSanPhamMua = sanPhamService.getSanPhamMua(maND);
		model.addAttribute("dsSanPhamMua", dsSanPhamMua);
		double tongTienHang = 0;
		for (SanPhamMua sanPhamMua : dsSanPhamMua) {
			tongTienHang += sanPhamMua.getThanhTien();
		}
		double giamGia = tongTienHang * 0.05;
		double tongThanhToan = tongTienHang - giamGia;
		model.addAttribute("tongTienHang", tongTienHang);
		model.addAttribute("giamGia", giamGia);
		model.addAttribute("tongThanhToan", tongThanhToan);

		return "user/checkout";
	}

	@RequestMapping(value = "/orders/success", method = RequestMethod.POST)
	public String createHoaDon(PayLoadCreateOrder payLoadCreateOrder, Model model) {
		String diaChi=payLoadCreateOrder.getDiaChi();
				byte[] bytes = diaChi.getBytes(StandardCharsets.ISO_8859_1);
				diaChi = new String(bytes, StandardCharsets.UTF_8);
		// 1 Lay user tu context security
		Integer userId = 19;
		// 1.1 lay chi tiet user
		NguoiDung nguoiDung = nguoiDungService.findNguoiDungById(userId);
		// 2 Lay thong tin gio hang tu user
		List<ChiTietHoaDon> chiTietHoaDons = new ArrayList<ChiTietHoaDon>();
		List<SanPhamMua> dsSanPhamMua = sanPhamService.getSanPhamMua(userId);
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
		HoaDon hoaDon = new HoaDon(ngayLHD, tongThanhToan, tongSoLuong, trangThaiDonHang, ngayGiaoHang,
				diaChi, nguoiDung);
		HoaDon hoadonSave = hoaDonService.addHoaDon(hoaDon);

		dsSanPhamMua.forEach(e -> {
			SanPham sanPham = sanPhamService.getSanPhamByIdSanPham(e.getMaSp());
			ChiTietHoaDon cthd = new ChiTietHoaDon(hoadonSave, sanPham, e.getSoLuong(), e.getGiaSp());
			ctHoaDonService.addChiTietHoaDon(cthd);
			chiTietHoaDons.add(cthd);

		});
		// 4 Xoa gio hang cua khach hang
		gioHangService.deleteGioHangByIdNguoiDung(userId);
		// 5 Tao trang chi tiet hoa don( truyen du lieu hoa don vua tao duoc qua trang
		// do)
		model.addAttribute("hoadonThanhToan", hoadonSave);
		model.addAttribute("chiTietHoaDons", chiTietHoaDons);
		model.addAttribute("tongTienHang", tongTienHang);
		model.addAttribute("giamGia", tongTienHang * 0.05);
		return "user/detail-order";
	}

	@GetMapping("/access-denied")
	public String showAccessDenied() {
		return "user/access-denied";
	}
}

