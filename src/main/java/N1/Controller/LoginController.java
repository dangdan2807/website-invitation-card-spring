package N1.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class LoginController {

	@RequestMapping({"/", "/trang-chu", "/home"})
	public String showHomePage() {
		return "index";
	}

	@GetMapping("/contact")
	public String showContractPage() {
		return "contact";
	}

	@GetMapping("/login")
	public String showLoginPage() {
		return "login";
	}
	
    @GetMapping("/access-denied")
    public String showAccessDenied() {
        return "access-denied";
    }
}