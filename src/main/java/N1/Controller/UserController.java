package N1.Controller;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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

	@RequestMapping({ "/gio-hang/{maND}", "/cart/{maND}" })
	public String showShoppingCartPage(Model model, @PathVariable int maND) {
		List<GioHang> gioHang = gioHangService.findGioHangByUserId(maND);
		double tongTien = 0;
		for (GioHang gioHang2 : gioHang) {
			tongTien += gioHang2.getSanPham().getGiaSP() * gioHang2.getSoLuong() * 
					(100 - gioHang2.getSanPham().getGiamGia())/100;
		}
		
		model.addAttribute("tongTien",tongTien);
		
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		model.addAttribute("isCategoryPage", 0);
		
		List<GioHang> dsGioHang = gioHangService.findGioHangByUserId(maND);
		model.addAttribute("dsSanPhamGioHang",dsGioHang);
		
		return "user/shopping-cart";
	}

	@RequestMapping({ "/thanh-toan/{maND}", "/checkout/{maND}" })
	public String showCheckoutPage(Model model, @PathVariable int maND) {
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		model.addAttribute("isCategoryPage", 0);
		
		NguoiDung nguoiDung = nguoiDungService.findNguoiDungById(maND);
		model.addAttribute("nguoiDung", nguoiDung);

		List<SanPhamMua> dsSanPhamMua = sanPhamService.getSanPhamMua(maND);
		model.addAttribute("dsSanPhamMua", dsSanPhamMua);

		double tongTienHang = 0;
		for (SanPhamMua sanPhamMua : dsSanPhamMua) {
			tongTienHang += sanPhamMua.getThanhTien();
		}
		
		double giamGia = tongTienHang * 0.05;
		double tongThanhToan = tongTienHang - tongTienHang * 0.05;
		model.addAttribute("tongTienHang", tongTienHang);
		model.addAttribute("giamGia", giamGia);
		model.addAttribute("tongThanhToan", tongThanhToan);

		return "user/checkout";
	}

	@RequestMapping(value = "/orders/success", method = RequestMethod.POST)
	public String createHoaDon(@RequestParam("maND") int userId, PayLoadCreateOrder payLoadCreateOrder, Model model) {
		String diaChi = payLoadCreateOrder.getDiaChi();
		byte[] bytes = diaChi.getBytes(StandardCharsets.ISO_8859_1);
		diaChi = new String(bytes, StandardCharsets.UTF_8);
		// 1 Lay user tu context security
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
		gioHangService.deleteGioHangByIdNguoiDung(userId);
		// 5 Tao trang chi tiet hoa don( truyen du lieu hoa don vua tao duoc qua trang
		// do)
		model.addAttribute("hoadonThanhToan", hoadonSave);
		model.addAttribute("chiTietHoaDons", chiTietHoaDons);
		model.addAttribute("tongTienHang", tongTienHang);
		model.addAttribute("giamGia", tongTienHang * 0.05);
		model.addAttribute("isCategoryPage", 0);
		return "user/detail-order";
	}

	@RequestMapping(value = "/show-order")
	public String showHoaDonChiTiet(@RequestParam("maHD") int maHD, Model model) {
		// Tìm hóa đơn theo mã hóa đơn
		HoaDon hoaDon = hoaDonService.findHoaDonById(maHD);
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
		return "user/detail-order";
	}

	@RequestMapping(value = "/order/history")
	public String showHoaDonByNguoiDung(@RequestParam("maND") int userId, Model model) {
		List<HoaDon> hoaDons = hoaDonService.findHoaDonByUserId(userId);
		hoaDons.forEach(e -> {
			List<ChiTietHoaDon> cthds = new ArrayList<ChiTietHoaDon>();
			cthds = ctHoaDonService.getDSCTHoaDonByMaHD(e.getMaHD());
			e.setDsCTHoaDon(cthds);
		});

		model.addAttribute("hoadons", hoaDons);
		model.addAttribute("isCategoryPage", 0);
		return "user/history";
	}
	
}
