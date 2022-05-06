package N1.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import N1.Service.LoaiSanPhamService;
import N1.Service.SanPhamService;
import N1.entity.LoaiSanPham;
import N1.entity.SanPham;

@Controller
@RequestMapping({"/danh-muc", "/categories"})
public class CategoryController {
	@Autowired
	private LoaiSanPhamService loaiSanPhamService;
	@Autowired
	private SanPhamService sanPhamService;
	
    @RequestMapping("")
	public String showCategoryPage(Model model, 
			@RequestParam(name = "id", required = false, defaultValue = "1") int id,
			@RequestParam(name = "sort", required = false, defaultValue = "asc") String sort,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage) {
		if (currentPage == 0 || currentPage <= 0) {
			currentPage = 1;
		}
		
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);

		List<SanPham> dsSanPham = sanPhamService.getDSSanPham(currentPage);
		model.addAttribute("dsSanPham", dsSanPham);

		int numberOfSanPham = sanPhamService.getNumberOfSanPhams();
		int pageOfNumber = 1;
		if ((numberOfSanPham / 15) != 15) {
			pageOfNumber = (numberOfSanPham / 15) + 1;
		}

		model.addAttribute("slSanPham", numberOfSanPham);
		model.addAttribute("pageOfNumber", pageOfNumber);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", new int[] {5, 4, 3, 2, 1, 0, -1, -2, -3, -4, -5});

		List<SanPham> dsSanPhamMoi = sanPhamService.getLatestSanPhams(6);
		model.addAttribute("dsSanPhamMoi", dsSanPhamMoi);

		List<SanPham> dsSpGiamGia = sanPhamService.getDiscountSanPhams(6);
		model.addAttribute("dsSpGiamGia", dsSpGiamGia);

		return "user/shop-grid";
	}
}