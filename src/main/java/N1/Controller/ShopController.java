package N1.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import N1.Service.*;
import N1.entity.*;

@Controller
@RequestMapping("shop")
public class ShopController {
	@RequestMapping("/shop-grid")
	public String showShopGridPage(Model model) {
		List<LoaiSanPham> dsLoaiSanPham = new ArrayList<LoaiSanPham>();
		dsLoaiSanPham.add(new LoaiSanPham("Thiệp cưới"));
		dsLoaiSanPham.add(new LoaiSanPham("Thiệp sinh nhật"));
		dsLoaiSanPham.add(new LoaiSanPham("Thiệp mừng 20-11"));
		dsLoaiSanPham.add(new LoaiSanPham("Thiệp năm mới"));
		dsLoaiSanPham.add(new LoaiSanPham("Thiệp giáng sinh"));
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);

		List<ChiTietLoaiSP> dsChiTietLoaiSP = new ArrayList<ChiTietLoaiSP>();
		dsChiTietLoaiSP.add(new ChiTietLoaiSP(dsLoaiSanPham.get(0)));
		dsChiTietLoaiSP.add(new ChiTietLoaiSP(dsLoaiSanPham.get(1)));
		dsChiTietLoaiSP.add(new ChiTietLoaiSP(dsLoaiSanPham.get(2)));
		dsChiTietLoaiSP.add(new ChiTietLoaiSP(dsLoaiSanPham.get(3)));
		dsChiTietLoaiSP.add(new ChiTietLoaiSP(dsLoaiSanPham.get(4)));

		List<SanPham> dsSanPham = new ArrayList<SanPham>();
		dsSanPham.add(new SanPham("Sản phẩm 1", "/resources/user/img/featured/feature-2.jpg",
				"mo ta san pham", 100000, 20, 50000,
				dsChiTietLoaiSP.subList(1, 3)));
		dsSanPham.add(new SanPham("Sản phẩm 2", "/resources/user/img/featured/feature-1.jpg",
				"mo ta san pham", 100000, 20, 50000,
				dsChiTietLoaiSP.subList(0, 2)));
		dsSanPham.add(new SanPham("Sản phẩm 3", "/resources/user/img/featured/feature-3.jpg",
				"mo ta san pham", 100000, 20, 50000,
				dsChiTietLoaiSP.subList(2, 4)));
		dsSanPham.add(new SanPham("Sản phẩm 4", "/resources/user/img/featured/feature-4.jpg",
				"mo ta san pham", 100000, 20, 50000,
				dsChiTietLoaiSP.subList(3, 5)));
		dsSanPham.add(new SanPham("Sản phẩm 5", "https://d25tv1xepz39hi.cloudfront.net/2016-01-31/files/1045.jpg",
				"mo ta san pham", 100000, 20, 50000, dsChiTietLoaiSP.subList(1, 3)));
		dsSanPham
				.add(new SanPham("Sản phẩm 6", "https://icdn.dantri.com.vn/thumb_w/640/2020/08/04/19-1596556901619.jpg",
						"mo ta san pham", 100000, 20, 50000, dsChiTietLoaiSP.subList(1, 2)));
		dsSanPham
				.add(new SanPham("Sản phẩm 7", "https://icdn.dantri.com.vn/thumb_w/640/2020/08/04/24-1596556901623.jpg",
						"mo ta san pham", 100000, 20, 50000, dsChiTietLoaiSP.subList(2, 3)));
		dsSanPham
				.add(new SanPham("Sản phẩm 8", "https://icdn.dantri.com.vn/thumb_w/640/2020/08/04/27-1596556901642.jpg",
						"mo ta san pham", 100000, 20, 50000, dsChiTietLoaiSP.subList(3, 4)));
		dsSanPham
				.add(new SanPham("Sản phẩm 9", "https://icdn.dantri.com.vn/thumb_w/640/2020/08/04/28-1596556901636.jpg",
						"mo ta san pham", 100000, 20, 50000, dsChiTietLoaiSP.subList(4, 5)));
		dsSanPham.add(new SanPham("Sản phẩm 10", "/resources/user/img/featured/feature-5.jpg",
				"mo ta san pham", 100000, 20, 50000,
				dsChiTietLoaiSP.subList(0, 1)));
		dsSanPham.add(new SanPham("Sản phẩm 11", "/resources/user/img/featured/feature-6.jpg",
				"mo ta san pham", 100000, 20, 50000,
				dsChiTietLoaiSP.subList(1, 2)));
		dsSanPham.add(new SanPham("Sản phẩm 12", "/resources/user/img/featured/feature-7.jpg",
				"mo ta san pham", 100000, 20, 50000,
				dsChiTietLoaiSP.subList(4, 5)));
		model.addAttribute("dsSanPham", dsSanPham);

		List<SanPham> dsSanPhamMoi = dsSanPham.subList(0, 6);
		model.addAttribute("dsSanPhamMoi", dsSanPhamMoi);

		List<SanPham> dsSpGiamGia = dsSanPham.subList(3, 10);
		model.addAttribute("dsSpGiamGia", dsSpGiamGia);

		return "user/shop-grid";
	}

	@RequestMapping("/shopping-cart")
	public String showShoppingCartPage() {
		return "user/shopping-cart";
	}

	@RequestMapping("/checkout")
	public String showCheckoutPage() {
		return "user/checkout";
	}
}
