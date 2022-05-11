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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import N1.Service.*;
import N1.entity.*;

@Controller
@RequestMapping({ "/danh-muc", "/categories" })
public class CategoryController {
	private final int pageSize = 15;

	@Autowired
	private LoaiSanPhamService loaiSanPhamService;
	@Autowired
	private SanPhamService sanPhamService;
	@Autowired
	private GioHangService gioHangService;
	@Autowired
	private NguoiDungService nguoiDungService;

	@RequestMapping(value = { "/id={id}", "/id={id}/tim-kiem" }, method = RequestMethod.GET)
	public String showCategoryPage(Model model,
			@PathVariable(name = "id", required = false) Integer id,
			@RequestParam(name = "ten-san-pham", required = false, defaultValue = "") String tenSanPham,
			@RequestParam(name = "sort", required = false, defaultValue = "asc") String sort,
			@RequestParam(name = "page", required = false, defaultValue = "1") Integer currentPage,
			@RequestParam(name = "minPrice", required = false, defaultValue = "0") String minPriceStr,
			@RequestParam(name = "maxPrice", required = false, defaultValue = "100000") String maxPriceStr) {
				
		model.addAttribute("isCategoryPage", 1);
		model.addAttribute("selectedCategoryId", id);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("sort", sort);
		model.addAttribute("pagingSize", new int[] { 5, 4, 3, 2, 1, 0, -1, -2, -3, -4, -5 });

		double minPrice = Double.parseDouble(minPriceStr.replaceAll("[\\s.đ]", ""));
		double maxPrice = Double.parseDouble(maxPriceStr.replaceAll("[\\s.đ]", ""));
		
		if(id == null || id < 0) {
			id = 0;
		}

		if (currentPage <= 0 || currentPage == null) {
			currentPage = 1;
		}
		if (minPrice <= 0.0) {
			minPrice = 0.0;
		}
		if (maxPrice <= 0) {
			maxPrice = 0.0;
		}
		model.addAttribute("minPrice", minPrice);
		model.addAttribute("maxPrice", maxPrice);
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		NguoiDung nguoiDung = null; 
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

		List<SanPham> dsSanPham = new ArrayList<SanPham>();
		int numberOfSanPham = 0;
		if (id == 0) {
			dsSanPham = sanPhamService.getDSSanPham(currentPage, sort, tenSanPham, minPrice, maxPrice);
			numberOfSanPham = sanPhamService.getNumberOfSanPhamsByTenSpAndPrice(tenSanPham, minPrice, maxPrice);
		} else {
			dsSanPham = sanPhamService.getSanPhamsByCategoryId(currentPage, sort, tenSanPham, minPrice, maxPrice, id);
			numberOfSanPham = sanPhamService.getNumberOfSanPhamsByCategoryId(tenSanPham, minPrice, maxPrice, id);
		}
		model.addAttribute("dsSanPham", dsSanPham);

		
		int pageOfNumber = 1;
		if ((numberOfSanPham % pageSize) != 0) {
			pageOfNumber = (numberOfSanPham / pageSize) + 1;
		} else {
			pageOfNumber = (numberOfSanPham / pageSize);
		}
		model.addAttribute("slSanPham", numberOfSanPham);
		model.addAttribute("pageOfNumber", pageOfNumber);

		List<SanPham> dsSanPhamMoi = sanPhamService.getLatestSanPhams(6);
		model.addAttribute("dsSanPhamMoi", dsSanPhamMoi);

		List<SanPham> dsSpGiamGia = sanPhamService.getDiscountSanPhams(6);
		model.addAttribute("dsSpGiamGia", dsSpGiamGia);

		return "user/shop-grid";
	}
}