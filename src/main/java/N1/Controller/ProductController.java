package N1.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import N1.entity.ChiTietLoaiSP;
import N1.entity.LoaiSanPham;
import N1.entity.SanPham;

@Controller
@RequestMapping("/product")
public class ProductController {
	@RequestMapping("/id={theId}")
	public String getProductById(@PathVariable int theId, Model model) {
		List<LoaiSanPham> dsLoaiSanPham = new ArrayList<LoaiSanPham>();
		dsLoaiSanPham.add(new LoaiSanPham(1, "Thiệp cưới"));
		dsLoaiSanPham.add(new LoaiSanPham(2, "Thiệp sinh nhật"));
		dsLoaiSanPham.add(new LoaiSanPham(3, "Thiệp mừng 20-11"));
		dsLoaiSanPham.add(new LoaiSanPham(4, "Thiệp năm mới"));
		dsLoaiSanPham.add(new LoaiSanPham(5, "Thiệp giáng sinh"));
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);

		List<ChiTietLoaiSP> dsChiTietLoaiSP = new ArrayList<ChiTietLoaiSP>();
		dsChiTietLoaiSP.add(new ChiTietLoaiSP(dsLoaiSanPham.get(0)));
		dsChiTietLoaiSP.add(new ChiTietLoaiSP(dsLoaiSanPham.get(1)));
		dsChiTietLoaiSP.add(new ChiTietLoaiSP(dsLoaiSanPham.get(2)));
		dsChiTietLoaiSP.add(new ChiTietLoaiSP(dsLoaiSanPham.get(3)));
		dsChiTietLoaiSP.add(new ChiTietLoaiSP(dsLoaiSanPham.get(4)));
		
//		lấy 4 sản phẩm
		List<SanPham> dsSanPhamLQ = new ArrayList<SanPham>();
		dsSanPhamLQ.add(new SanPham( 1, "Sản phẩm 1", "/resources/user/img/featured/feature-2.jpg",
				"mo ta san pham", 100000, 20, 50000,
				dsChiTietLoaiSP.subList(1, 3)));
		dsSanPhamLQ.add(new SanPham( 2, "Sản phẩm 2", "/resources/user/img/featured/feature-1.jpg",
				"mo ta san pham", 100000, 20, 50000,
				dsChiTietLoaiSP.subList(0, 2)));
		dsSanPhamLQ.add(new SanPham( 3, "Sản phẩm 3", "/resources/user/img/featured/feature-3.jpg",
				"mo ta san pham", 100000, 20, 50000,
				dsChiTietLoaiSP.subList(2, 4)));
		dsSanPhamLQ.add(new SanPham( 4, "Sản phẩm 4", "/resources/user/img/featured/feature-4.jpg",
				"mo ta san pham", 100000, 20, 50000,
				dsChiTietLoaiSP.subList(3, 5)));
		model.addAttribute("dsSanPhamLQ", dsSanPhamLQ);

		SanPham sanPham = new SanPham(1, "Sản phẩm 1", "/resources/user/img/featured/feature-2.jpg",
				"mo ta san pham", 100000, 20, 50000,
				dsChiTietLoaiSP.subList(1, 2));
		model.addAttribute("sanPham", sanPham);
		
		LoaiSanPham loaiSanPham = sanPham.getDsLoaiSP().get(0).getLoaiSanPham();
		model.addAttribute("loaiSanPham", loaiSanPham);
		
		return "user/shop-details";
	}
}
