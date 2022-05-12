package N1.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {


	@GetMapping({"/dang-nhap", "/login"})
	public String showLoginPage(Model model) {
		
		return "user/login";
	}


}

