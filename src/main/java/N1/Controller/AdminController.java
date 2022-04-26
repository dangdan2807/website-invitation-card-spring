package N1.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@GetMapping("")
	public String home() {
		return "admin/index";
	}
	
	@GetMapping("/user")
	public String user() {
		return "admin/user";
	}
	
	@GetMapping("/order")
	public String order() {
		return "admin/order";
	}
	
	@GetMapping("/product")
	public String product() {
		return "admin/product";
	}
	
	@GetMapping("/category")
	public String category() {
		return "admin/category";
	}
}
