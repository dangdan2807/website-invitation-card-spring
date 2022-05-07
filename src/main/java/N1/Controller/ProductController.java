package N1.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import N1.entity.*;
import N1.Service.*;

@Controller
@RequestMapping({ "/san-pham", "/product" })
public class ProductController {
	private final int pageSize = 15;

	@Autowired
	private LoaiSanPhamService loaiSanPhamService;
	@Autowired
	private SanPhamService sanPhamService;
	@Autowired
	private DanhGiaService danhGiaService;

	@RequestMapping(value = { "", "/tim-kiem" }, method = RequestMethod.GET)
	public String showProductPage(Model model,
			@RequestParam(name = "ten-san-pham", required = false, defaultValue = "") String tenSanPham,
			@RequestParam(name = "sort", required = false, defaultValue = "asc") String sort,
			@RequestParam(name = "page", required = false, defaultValue = "1") Integer currentPage,
			@RequestParam(name = "minPrice", required = false, defaultValue = "0") String minPriceStr,
			@RequestParam(name = "maxPrice", required = false, defaultValue = "100000") String maxPriceStr) {
		
		double minPrice = Double.parseDouble(minPriceStr.replaceAll("[/s.đ]", ""));
		double maxPrice = Double.parseDouble(maxPriceStr.replaceAll("[/s.đ]", ""));
		
		if (currentPage <= 0 || currentPage == null) {
			currentPage = 1;
		}
		if (minPrice <= 0.0) {
			minPrice = 0.0;
		}
		if (maxPrice <= 0) {
			maxPrice = 0.0;
		}

		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);

		List<SanPham> dsSanPham = sanPhamService.getDSSanPham(currentPage, sort, tenSanPham, minPrice, maxPrice);
		model.addAttribute("dsSanPham", dsSanPham);

		int numberOfSanPham = sanPhamService.getNumberOfSanPhamsByTenSpAndPrice(tenSanPham, minPrice, maxPrice);
		int pageOfNumber = 1;
		if ((numberOfSanPham % pageSize) != 0) {
			pageOfNumber = (numberOfSanPham / pageSize) + 1;
		} else {
			pageOfNumber = (numberOfSanPham / pageSize);
		}

		model.addAttribute("slSanPham", numberOfSanPham);
		model.addAttribute("pageOfNumber", pageOfNumber);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("sort", sort);
		model.addAttribute("minPrice", minPrice);
		model.addAttribute("maxPrice", maxPrice);
		model.addAttribute("pagingSize", new int[] { 5, 4, 3, 2, 1, 0, -1, -2, -3, -4, -5 });

		List<SanPham> dsSanPhamMoi = sanPhamService.getLatestSanPhams(6);
		model.addAttribute("dsSanPhamMoi", dsSanPhamMoi);

		List<SanPham> dsSpGiamGia = sanPhamService.getDiscountSanPhams(6);
		model.addAttribute("dsSpGiamGia", dsSpGiamGia);

		return "user/shop-grid";
	}

	@GetMapping("/id={theId}")
	public String getProductById(Model model, @PathVariable(name = "theId", required = false) Integer id) {
		if (id <= 0 || id == null)
			id = 1;

		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);

		SanPham sanPham = sanPhamService.getSanPhamByIdSanPham(id);
		List<DanhGia> danhGias = danhGiaService.getDanhGiasByIdSanPham(id);
		sanPham.setDsDanhGia(danhGias);
		model.addAttribute("sanPham", sanPham);

		double star = 0.0;
		for (DanhGia danhGia : danhGias) {
			star += danhGia.getXepHang();
		}
		if (danhGias.size() > 0)
			star /= danhGias.size();
		else {
			star = 5;
		}
		model.addAttribute("starSize", new int[] { 1, 2, 3, 4, 5 });
		model.addAttribute("star", star);

		LoaiSanPham loaiSanPham = sanPham.getDsLoaiSP().get(0).getLoaiSanPham();
		model.addAttribute("loaiSanPham", loaiSanPham);

		List<SanPham> dsSanPhamLQ = sanPhamService.getRandomSanPhamsByCategoryId(loaiSanPham.getMaLSP(), 4,
				sanPham.getMaSp());
		model.addAttribute("dsSanPhamLQ", dsSanPhamLQ);

		return "user/shop-details";
	}

	@PostMapping("/id={theId}")
	public HttpStatus addReviewProduct(Model model, @RequestBody DanhGia danhGia) {
		System.out.println(danhGia.getNoiDung());
		return HttpStatus.OK;
	}
}
