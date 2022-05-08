package N1.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import N1.entity.*;
import N1.Service.*;

@Controller
@RequestMapping({"/san-pham", "/product"})
public class ProductController {
	@Autowired
	private LoaiSanPhamService loaiSanPhamService;
	@Autowired
	private SanPhamService sanPhamService;
	
	@RequestMapping("")
	public String showProductPage(Model model) {
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.getDSLoaiSanPham();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		

		List<SanPham> dsSanPham = sanPhamService.getDSSanPham(1);
		model.addAttribute("dsSanPham", dsSanPham);
		
		int numberOfSanPham = sanPhamService.getNumberOfSanPhams();
		
		model.addAttribute("slSanPham", numberOfSanPham);
		
		model.addAttribute("pageOfNumber", Math.round(numberOfSanPham / 15));

		List<SanPham> dsSanPhamMoi = sanPhamService.getLatestSanPhams(6);
		model.addAttribute("dsSanPhamMoi", dsSanPhamMoi);

		List<SanPham> dsSpGiamGia = sanPhamService.getDiscountSanPhams(6);
		model.addAttribute("dsSpGiamGia", dsSpGiamGia);

		return "user/shop-grid";
	}
	
	@RequestMapping("/page={currentPage}")
	public String showProductNumberOfPage(Model model, @PathVariable int currentPage) {
		if(currentPage == 0 || currentPage <= 0) {
			currentPage = 1;
		}
		
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.getDSLoaiSanPham();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		

		List<SanPham> dsSanPham = sanPhamService.getDSSanPham(currentPage);
		model.addAttribute("dsSanPham", dsSanPham);
		
		model.addAttribute("slSanPham", dsSanPham.size());
		model.addAttribute("pageOfNumber", currentPage);

		List<SanPham> dsSanPhamMoi = sanPhamService.getLatestSanPhams(6);
		model.addAttribute("dsSanPhamMoi", dsSanPhamMoi);

		List<SanPham> dsSpGiamGia = sanPhamService.getDiscountSanPhams(6);
		model.addAttribute("dsSpGiamGia", dsSpGiamGia);

		return "user/shop-grid";
	}
	
	
	
	@RequestMapping("/id={theId}")
	public String getProductById(@PathVariable int theId, Model model) {
		List<LoaiSanPham> dsLoaiSanPham = new ArrayList<LoaiSanPham>();
		dsLoaiSanPham.add(new LoaiSanPham(1, "Thiệp cưới", "/resources/user/img/categories/cat-1.jpg"));
		dsLoaiSanPham.add(new LoaiSanPham(2, "Thiệp sinh nhật", "/resources/user/img/categories/cat-2.jpg"));
		dsLoaiSanPham.add(new LoaiSanPham(3, "Thiệp mừng 20-11", "/resources/user/img/categories/cat-3.jpg"));
		dsLoaiSanPham.add(new LoaiSanPham(4, "Thiệp năm mới", "/resources/user/img/categories/cat-4.jpg"));
		dsLoaiSanPham.add(new LoaiSanPham(5, "Thiệp giáng sinh", "/resources/user/img/categories/cat-5.jpg"));
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
