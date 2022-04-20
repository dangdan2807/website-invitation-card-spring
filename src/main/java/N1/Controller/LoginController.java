package N1.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import N1.Service.ChucVuService;
import N1.entity.ChucVu;

@Controller
@RequestMapping("")
public class LoginController {
	@Autowired
	private ChucVuService chucVuService;
	
	@RequestMapping("/")
	public String showHomePage(Model model) {
		List<ChucVu> list = chucVuService.getDSChucVu();
		model.addAttribute("chucVu", list);
		return "home";
	}

	@GetMapping("/showLoginPage")
	public String showLoginPage() {
		return "login";
	}
	
    @GetMapping("/access-denied")
    public String showAccessDenied() {
        return "access-denied";
    }
}