package N1.Controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import N1.entity.*;
import N1.Service.*;

@Controller
@RequestMapping({ "/san-pham", "/product" })
public class ProductController {
	private final int pageSize = 15;
	private final int pageCommentSize = 5;

	@Autowired
	private LoaiSanPhamService loaiSanPhamService;
	@Autowired
	private SanPhamService sanPhamService;
	@Autowired
	private DanhGiaService danhGiaService;
	@Autowired
	private GioHangService gioHangService;
	@Autowired
	private NguoiDungService nguoiDungService;

	@RequestMapping(value = { "", "/tim-kiem" }, method = RequestMethod.GET)
	public String showProductPage(Model model,
			@RequestParam(name = "ten-san-pham", required = false, defaultValue = "") String tenSanPham,
			@RequestParam(name = "sort", required = false, defaultValue = "asc") String sort,
			@RequestParam(name = "page", required = false, defaultValue = "1") Integer currentPage,
			@RequestParam(name = "minPrice", required = false, defaultValue = "0") String minPriceStr,
			@RequestParam(name = "maxPrice", required = false, defaultValue = "100000") String maxPriceStr) {
		model.addAttribute("isCategoryPage", 0);
		model.addAttribute("selectedCategoryId", 0);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("sort", sort);
		model.addAttribute("pagingSize", new int[] { 5, 4, 3, 2, 1, 0, -1, -2, -3, -4, -5 });

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

		List<SanPham> dsSanPhamMoi = sanPhamService.getLatestSanPhams(6);
		model.addAttribute("dsSanPhamMoi", dsSanPhamMoi);

		List<SanPham> dsSpGiamGia = sanPhamService.getDiscountSanPhams(6);
		model.addAttribute("dsSpGiamGia", dsSpGiamGia);

		return "user/shop-grid";
	}

	@RequestMapping(value = "/id={theId}", method = RequestMethod.GET)
	public String getProductById(Model model,
			@PathVariable(name = "theId", required = false) Integer id,
			@RequestParam(name = "comment-page", required = false, defaultValue = "1") Integer currentPageComment,
			@RequestParam(name = "msg", required = false, defaultValue = "") String msg,
			@RequestParam(name = "status", required = false, defaultValue = "-1") Integer status) {
		model.addAttribute("isCategoryPage", 0);
		model.addAttribute("pagingSize", new int[] { 5, 4, 3, 2, 1, 0, -1, -2, -3, -4, -5 });
		model.addAttribute("msg", msg);
		model.addAttribute("status", status);
		model.addAttribute("danhGia", new DanhGia());
		model.addAttribute("gioHang", new GioHang());

		if (id <= 0 || id == null) {
			id = 1;
		}
		if (currentPageComment <= 0 || currentPageComment == null) {
			currentPageComment = 1;
		}
		model.addAttribute("currentPageComment", currentPageComment);

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

		int numberOfDanhGia = danhGiaService.getNumberOfDanhGiaBySanPhamId(id);
		int pageOfNumber = 1;
		if ((numberOfDanhGia % pageCommentSize) != 0) {
			pageOfNumber = (numberOfDanhGia / pageCommentSize) + 1;
		} else {
			pageOfNumber = (numberOfDanhGia / pageCommentSize);
		}
		model.addAttribute("numberOfDanhGia", numberOfDanhGia);
		model.addAttribute("pageOfNumber", pageOfNumber);

		SanPham sanPham = sanPhamService.getSanPhamByIdSanPham(id);
		List<DanhGia> danhGias = danhGiaService.getDanhGiasBySanPhamIdAndPageNumber(id, currentPageComment);
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

		return "user/product-detail";
	}

	@RequestMapping(value = "/id={theId}/them-vao-gio-hang", method = RequestMethod.POST)
	public String addProductToCart(Model model,
			@PathVariable(name = "theId", required = false) Integer sanPhamId,
			@ModelAttribute("gioHang") GioHang gioHang,
			RedirectAttributes redirectAttributes) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentPrincipalName = authentication.getName();

		NguoiDung nguoiDung = nguoiDungService.findNguoiDungByEmail(currentPrincipalName);
		gioHang.setNguoiDung(nguoiDung);
		gioHang.setSanPham(new SanPham(sanPhamId));

		boolean resultSave = gioHangService.saveGioHang(gioHang);
		if (resultSave) {
			redirectAttributes.addAttribute("msg", "Thêm sản phẩm vào giỏ hàng thành công");
			redirectAttributes.addAttribute("status", 1);
		} else {
			redirectAttributes.addAttribute("msg", "Thêm sản phẩm vào giỏ hàng thất bại");
			redirectAttributes.addAttribute("status", 0);
		}

		return "redirect:/san-pham/id=" + sanPhamId;
	}

	@RequestMapping(value = "/id={theId}/them-danh-gia", method = RequestMethod.POST)
	public String addReviewProductByProductId(Model model,
			@PathVariable(name = "theId", required = false) Integer sanPhamId,
			@ModelAttribute("danhGia") DanhGia danhGia,
			RedirectAttributes redirectAttributes) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentPrincipalName = authentication.getName();

		NguoiDung nguoiDung = nguoiDungService.findNguoiDungByEmail(currentPrincipalName);
		danhGia.setNguoiDung(nguoiDung);
		danhGia.setSanPham(new SanPham(sanPhamId));

		model.addAttribute("danhGia", new DanhGia());
		boolean resultSave = danhGiaService.addDanhGia(danhGia);
		if (resultSave) {
			redirectAttributes.addAttribute("msg", "Đánh giá sản phẩm thành công");
			redirectAttributes.addAttribute("status", 1);
		} else {
			redirectAttributes.addAttribute("msg", "Đánh giá sản phẩm thất bại");
			redirectAttributes.addAttribute("status", 0);
		}

		return "redirect:/san-pham/id=" + sanPhamId;
	}
}
