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
	
	
	@GetMapping("")
	public String home() {
		return "admin/index";
	}
	
	@GetMapping("/user")
	public String user(Model model) {
		List<NguoiDung> users = new ArrayList<NguoiDung>();
		users.add(new NguoiDung("Trần Văn A", "TP.HCM", "0987654321", new TaiKhoan("tranvana@gmail.com", "123456")));
		users.add(new NguoiDung("Trần Văn B", "TP.HCM", "0987654321", new TaiKhoan("tranvanb@gmail.com", "123456")));
		users.add(new NguoiDung("Trần Văn C", "Hà Nội", "0987654321", new TaiKhoan("tranvanc@gmail.com", "123456")));
		users.add(new NguoiDung("Trần Văn D", "Ninh Bình", "0987654321", new TaiKhoan("tranvand@gmail.com", "123456")));
		model.addAttribute("users", users);
		return "admin/user";
	}
	
	@GetMapping("/order")
	public String order(Model model) {
		List<HoaDon> orders = new ArrayList<HoaDon>();
		NguoiDung user1 = new NguoiDung("Trần Văn A", "TP.HCM", "0987654321", new TaiKhoan("tranvana@gmail.com", "123456"));
		NguoiDung user2 = new NguoiDung("Trần Văn B", "TP.HCM", "0987654321", new TaiKhoan("tranvanb@gmail.com", "123456"));
		orders.add(new HoaDon(1, new Date("19/11/2021"), 100000.0, 120, user1));
		orders.add(new HoaDon(2, new Date("19/12/2021"), 120000.0, 100, user2));
		orders.add(new HoaDon(3, new Date("01/11/2021"), 100000.0, 150, user1));
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
	public String category(Model model) {
		List<LoaiSanPham> dsLoaiSanPham = new ArrayList<LoaiSanPham>();
		dsLoaiSanPham.add(new LoaiSanPham("Thiệp cưới"));
		dsLoaiSanPham.add(new LoaiSanPham("Thiệp sinh nhật"));
		dsLoaiSanPham.add(new LoaiSanPham("Thiệp mừng 20-11"));
		dsLoaiSanPham.add(new LoaiSanPham("Thiệp năm mới"));
		dsLoaiSanPham.add(new LoaiSanPham("Thiệp giáng sinh"));
		model.addAttribute("dsLoaiSanPham", dsLoaiSanPham);
		return "admin/category";
	}
}
