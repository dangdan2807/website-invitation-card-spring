package N1.Controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import N1.DAO.SanPhamDAO;
import N1.Service.HoaDonService;
import N1.Service.LoaiSanPhamService;
import N1.Service.NguoiDungService;
import N1.Service.SanPhamService;
import N1.Service.SanPhamServiceImpl;
import N1.entity.ChiTietLoaiSP;
import N1.entity.HoaDon;
import N1.entity.LoaiSanPham;
import N1.entity.NguoiDung;
import N1.entity.SanPham;
import N1.entity.TaiKhoan;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private SanPhamService sanPhamService;

	@Autowired
	private NguoiDungService nguoiDungService;

	@Autowired
	private LoaiSanPhamService loaiSanPhamService;

	@Autowired
	private HoaDonService hoaDonService;	
	
	@GetMapping("")
	public String home() {
		return "admin/index";
	}
	
	/**************************** User *******************************/
	@GetMapping("/user")
	public String user(@RequestParam(name = "page", required = false) Integer page, Model model, HttpServletRequest request) {
		String path = request.getServletPath();
		
		if(page == null)
			page = 1;
		
		model.addAttribute("msg", request.getParameter("msg"));
		model.addAttribute("status", request.getParameter("status"));
		
		List<NguoiDung> users = nguoiDungService.findAll(page);
		model.addAttribute("numberOfPage", nguoiDungService.getNumberOfPage());
		model.addAttribute("currentPage", page);
		model.addAttribute("path", path);
		model.addAttribute("users", users);
		model.addAttribute("nguoiDung", new NguoiDung());
		return "admin/user";
	}
	
	@PostMapping("/user")
	public String updateNguoiDung(@ModelAttribute("nguoiDung") NguoiDung nguoiDung, Model model, 
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		System.out.println(nguoiDung);
		
		NguoiDung nguoiDung2 = nguoiDungService.findNguoiDungById(nguoiDung.getMaND());
		nguoiDung2.setTenND(nguoiDung.getTenND());
		nguoiDung2.setSdt(nguoiDung.getTenND());
		nguoiDung2.setDiaChi(nguoiDung.getDiaChi());
		nguoiDung2.setHinhAnh(nguoiDung.getTenND());
		
//		nguoiDungService.save(nguoiDung2);
		
		redirectAttributes.addAttribute("msg", "Cập nhật người dùng thành công");
		redirectAttributes.addAttribute("status", 1);
			
		return "redirect:/admin/user";
	}
	
	/**************************** Order *******************************/
	@GetMapping("/order")
	public String order(@RequestParam(name = "page", required = false) Integer page, Model model, HttpServletRequest request) {
		String path = request.getServletPath();
		
		if(page == null)
			page = 1;
		
		List<HoaDon> orders = hoaDonService.findAll(page);
		model.addAttribute("numberOfPage", hoaDonService.getNumberOfPage());
		model.addAttribute("currentPage", page);
		model.addAttribute("path", path);
		model.addAttribute("orders", orders);
		return "admin/order";
	}
	
	/**************************** Product *******************************/
	@GetMapping(value = "/product")
	public String product(@RequestParam(name = "page", required = false) Integer page, Model model, HttpServletRequest request) {
		String path = request.getServletPath();
		
		if(page == null)
			page = 1;
		
		model.addAttribute("msg", request.getParameter("msg"));
		model.addAttribute("status", request.getParameter("status"));
		
		List<SanPham> dsSanPham = sanPhamService.getDSSanPham(page);
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll();
		model.addAttribute("dsSanPham", dsSanPham);
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		model.addAttribute("numberOfPage", sanPhamService.getNumberOfPage());
		model.addAttribute("currentPage", page);
		model.addAttribute("path", path);
		model.addAttribute("sanPham", new SanPham());

		return "admin/product";
	}
	
	@PostMapping("/product")
	public String addOrUpdateProduct(@ModelAttribute("sanPham") SanPham sanPham, 
			Model model, HttpServletRequest request, RedirectAttributes redirectAttributes, 
			@RequestParam(value = "dsLoaiSanPham") List<Integer> dsLoaiSanPham) {
		System.out.println("hi");
		System.out.println(sanPham);
		System.out.println(dsLoaiSanPham);
		
		if(sanPham.getMaSp() == 0) {
			redirectAttributes.addAttribute("msg", "Thêm sản phẩm thành công!");
			redirectAttributes.addAttribute("status", 1);
		}else {
			redirectAttributes.addAttribute("msg", "Cập nhật sản phẩm thành công");
			redirectAttributes.addAttribute("status", 1);
		}
		
		List<ChiTietLoaiSP> ctlsp = new ArrayList<ChiTietLoaiSP>();
		dsLoaiSanPham.forEach(lsp -> {
			ctlsp.add(new ChiTietLoaiSP(new LoaiSanPham(lsp, null)));
		});
		sanPham.setDsLoaiSP(ctlsp);
		try {
			sanPhamService.save(sanPham);
		}catch (Exception e) {
			redirectAttributes.addAttribute("msg", "Có lỗi xảy ra");
			redirectAttributes.addAttribute("status", 0);
		}
		
			
		return "redirect:/admin/product";
	}
	
	@GetMapping("/delete-product")
	public String deleteProduct(@RequestParam(name = "maSp") Integer maSp, Model model, HttpServletRequest request, 
			RedirectAttributes redirectAttributes) {
		redirectAttributes.addAttribute("msg", "Xóa sản phẩm thành công!");
		redirectAttributes.addAttribute("status", 1);
		sanPhamService.delete(maSp);
		return "redirect:/admin/product";
	}
	
	/**************************** Category *******************************/
	
	@GetMapping("/category")
	public String category(@RequestParam(name = "page", required = false) Integer page, Model model, HttpServletRequest request) {
		String path = request.getServletPath();
		
		if(page == null)
			page = 1;
		
		model.addAttribute("msg", request.getParameter("msg"));
		model.addAttribute("status", request.getParameter("status"));
		
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll(page);
		model.addAttribute("numberOfPage", loaiSanPhamService.getNumberOfPage());
		model.addAttribute("currentPage", page);
		model.addAttribute("path", path);
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		model.addAttribute("loaiSanPham", new LoaiSanPham());
		return "admin/category";
	}
	
	@PostMapping("/category")
	public String addOrUpdateCategory(@ModelAttribute("loaiSanPham") LoaiSanPham loaiSanPham, Model model, 
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		System.out.println(loaiSanPham);
		loaiSanPhamService.save(loaiSanPham);
		if(loaiSanPham.getMaLSP() == 0) {
			redirectAttributes.addAttribute("msg", "Thêm danh mục sản phẩm thành công!");
			redirectAttributes.addAttribute("status", 1);
		}else {
			redirectAttributes.addAttribute("msg", "Cập nhật danh mục sản phẩm thành công");
			redirectAttributes.addAttribute("status", 1);
		}
			
		return "redirect:/admin/category";
	}
	
	@GetMapping("/delete-category")
	public String deleteCategory(@RequestParam(name = "maLSP") Integer maLSP, Model model, HttpServletRequest request, 
			RedirectAttributes redirectAttributes) {
		redirectAttributes.addAttribute("msg", "Xóa danh mục sản phẩm thành công!");
		redirectAttributes.addAttribute("status", 1);
		loaiSanPhamService.delete(maLSP);
		return "redirect:/admin/category";
	}
}
