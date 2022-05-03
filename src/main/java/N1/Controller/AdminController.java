package N1.Controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@GetMapping("/user")
	public String user(@RequestParam(name = "page", required = false) Integer page, Model model, HttpServletRequest request) {
		String path = request.getServletPath();
		
		if(page == null)
			page = 1;
		
		List<NguoiDung> users = nguoiDungService.findAll(page);
		model.addAttribute("numberOfPage", nguoiDungService.getNumberOfPage());
		model.addAttribute("currentPage", page);
		model.addAttribute("path", path);
		model.addAttribute("users", users);
		return "admin/user";
	}
	
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
	
	@GetMapping(value = "/product")
	public String product(@RequestParam(name = "page", required = false) Integer page, Model model, HttpServletRequest request) {
		String path = request.getServletPath();
		
		if(page == null)
			page = 1;
		
		
		List<SanPham> dsSanPham = sanPhamService.getDSSanPham(page);
		model.addAttribute("dsSanPham", dsSanPham);
		model.addAttribute("numberOfPage", sanPhamService.getNumberOfPage());
		model.addAttribute("currentPage", page);
		model.addAttribute("path", path);
		

		return "admin/product";
	}
	
	@GetMapping("/category")
	public String category(@RequestParam(name = "page", required = false) Integer page, Model model, HttpServletRequest request) {
		String path = request.getServletPath();
		
		if(page == null)
			page = 1;
		
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamService.findAll(page);
		model.addAttribute("numberOfPage", loaiSanPhamService.getNumberOfPage());
		model.addAttribute("currentPage", page);
		model.addAttribute("path", path);
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		return "admin/category";
	}
}
