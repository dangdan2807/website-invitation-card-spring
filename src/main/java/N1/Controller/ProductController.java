package N1.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import N1.entity.*;
import N1.Service.*;

@Controller
@RequestMapping({ "/san-pham", "/product" })
public class ProductController {
	@Autowired
	private LoaiSanPhamService loaiSanPhamService;
	@Autowired
	private SanPhamService sanPhamService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String showProductPage(Model model,
			@RequestParam(name = "sort", required = false, defaultValue = "asc") String sort,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "minPrice", required = false, defaultValue = "0") double mixPrice,
			@RequestParam(name = "maxPrice", required = false, defaultValue = "100000") double maxPrice) {
		if (currentPage == 0 || currentPage <= 0) {
			currentPage = 1;
		}
		
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.getDSLoaiSanPham();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);

		List<SanPham> dsSanPham = sanPhamService.getDSSanPham(currentPage, sort);
		model.addAttribute("dsSanPham", dsSanPham);

		int numberOfSanPham = sanPhamService.getNumberOfSanPhams();
		int pageOfNumber = 1;
		if ((numberOfSanPham / 15) != 15) {
			pageOfNumber = (numberOfSanPham / 15) + 1;
		}

		model.addAttribute("slSanPham", numberOfSanPham);
		model.addAttribute("pageOfNumber", pageOfNumber);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("sort", sort);
		model.addAttribute("minPrice", mixPrice);
		model.addAttribute("maxPrice", maxPrice);

		List<SanPham> dsSanPhamMoi = sanPhamService.getLatestSanPhams(6);
		model.addAttribute("dsSanPhamMoi", dsSanPhamMoi);

		List<SanPham> dsSpGiamGia = sanPhamService.getDiscountSanPhams(6);
		model.addAttribute("dsSpGiamGia", dsSpGiamGia);

		return "user/shop-grid";
	}

	@RequestMapping("/page={currentPage}")
	public String showProductNumberOfPage(Model model, @PathVariable(required = false) int currentPage) {
		if (currentPage == 0 || currentPage <= 0) {
			currentPage = 1;
		}

		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.getDSLoaiSanPham();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);

		List<SanPham> dsSanPham = sanPhamService.getDSSanPham(currentPage, "asc");
		model.addAttribute("dsSanPham", dsSanPham);

		int numberOfSanPham = sanPhamService.getNumberOfSanPhams();
		int pageOfNumber = 1;
		if ((numberOfSanPham / 15) != 15) {
			pageOfNumber = (numberOfSanPham / 15) + 1;
		}

		model.addAttribute("slSanPham", numberOfSanPham);
		model.addAttribute("pageOfNumber", pageOfNumber);
		model.addAttribute("currentPage", currentPage);

		List<SanPham> dsSanPhamMoi = sanPhamService.getLatestSanPhams(6);
		model.addAttribute("dsSanPhamMoi", dsSanPhamMoi);

		List<SanPham> dsSpGiamGia = sanPhamService.getDiscountSanPhams(6);
		model.addAttribute("dsSpGiamGia", dsSpGiamGia);

		return "user/shop-grid";
	}

	@RequestMapping("/id={theId}")
	public String getProductById(@PathVariable int theId, Model model) {
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.getDSLoaiSanPham();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);

		List<ChiTietLoaiSP> dsChiTietLoaiSP = new ArrayList<ChiTietLoaiSP>();
		dsChiTietLoaiSP.add(new ChiTietLoaiSP(dsLoaiSanPham.get(0)));
		dsChiTietLoaiSP.add(new ChiTietLoaiSP(dsLoaiSanPham.get(1)));
		dsChiTietLoaiSP.add(new ChiTietLoaiSP(dsLoaiSanPham.get(2)));
		dsChiTietLoaiSP.add(new ChiTietLoaiSP(dsLoaiSanPham.get(3)));
		dsChiTietLoaiSP.add(new ChiTietLoaiSP(dsLoaiSanPham.get(4)));

//		lấy 4 sản phẩm
		List<SanPham> dsSanPhamLQ = new ArrayList<SanPham>();
		dsSanPhamLQ.add(new SanPham(1, "Sản phẩm 1", "/resources/user/img/featured/feature-2.jpg", "mo ta san pham",
				100000, 20, 50000, dsChiTietLoaiSP.subList(1, 3)));
		dsSanPhamLQ.add(new SanPham(2, "Sản phẩm 2", "/resources/user/img/featured/feature-1.jpg", "mo ta san pham",
				100000, 20, 50000, dsChiTietLoaiSP.subList(0, 2)));
		dsSanPhamLQ.add(new SanPham(3, "Sản phẩm 3", "/resources/user/img/featured/feature-3.jpg", "mo ta san pham",
				100000, 20, 50000, dsChiTietLoaiSP.subList(2, 4)));
		dsSanPhamLQ.add(new SanPham(4, "Sản phẩm 4", "/resources/user/img/featured/feature-4.jpg", "mo ta san pham",
				100000, 20, 50000, dsChiTietLoaiSP.subList(3, 5)));
		model.addAttribute("dsSanPhamLQ", dsSanPhamLQ);

		SanPham sanPham = new SanPham(1, "Sản phẩm 1", "/resources/user/img/featured/feature-2.jpg", "mo ta san pham",
				100000, 20, 50000, dsChiTietLoaiSP.subList(1, 2));
		model.addAttribute("sanPham", sanPham);

		LoaiSanPham loaiSanPham = sanPham.getDsLoaiSP().get(0).getLoaiSanPham();
		model.addAttribute("loaiSanPham", loaiSanPham);

		return "user/shop-details";
	}
}
