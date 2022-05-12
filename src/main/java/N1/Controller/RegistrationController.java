package N1.Controller;

import java.util.logging.Logger;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import N1.Service.*;
import N1.entity.*;

@Controller
@RequestMapping("/dang-ky")
public class RegistrationController {
	@Autowired
	private TaiKhoanService taiKhoanService;
	@Autowired
	private UserDetailsManager userDetailsManager;

	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	private Logger logger = Logger.getLogger(getClass().getName());

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

	@GetMapping("")
	public String showRegistrationForm(Model theModel) {
		theModel.addAttribute("crmUser", new TaiKhoan());
		return "user/registration";

	}

	@PostMapping("/processRegistrationForm")
	public String processRegistrationForm(
			@Valid @ModelAttribute("crmUser") TaiKhoan theCrmUser,
			BindingResult theBindingResult,
			Model theModel) {

		String tenDangNhap = theCrmUser.getTenDangNhap();
		logger.info("Processing registration form for: " + tenDangNhap);

		if (theBindingResult.hasErrors()) {
			theModel.addAttribute("crmUser", new TaiKhoan());
			theModel.addAttribute("registrationError", "User name/password can not be empty.");
			logger.warning("User name/password can not be empty.");

			return "user/registration";
		}

		boolean userExitst = taiKhoanService.doesUserExist(tenDangNhap);
		System.out.println(userExitst);
		if (userExitst) {
			theModel.addAttribute("crmUser", new TaiKhoan());
			theModel.addAttribute("registrationError", "Email đã được đăng ký.");
			logger.warning("Email đã được đăng ký.");

			return "user/registration";
		}

		String encodedPassword = passwordEncoder.encode(theCrmUser.getMatKhau());

		encodedPassword = "{bcrypt}" + encodedPassword;
		System.out.println(encodedPassword);
		
		NguoiDung user = new NguoiDung();
		theCrmUser.setMatKhau(encodedPassword);
		user.setTaiKhoan(theCrmUser);
		user.setTenND(tenDangNhap);
		
		taiKhoanService.createUser(user);

		return "redirect:/dang-nhap";
	}

	private boolean doesUserExist(String tenDangNhap) {

		logger.info("Checking if user exists: " + tenDangNhap);

		// check the database if the user already exists
		boolean exists = userDetailsManager.userExists(tenDangNhap);

		logger.info("User: " + tenDangNhap + ", exists: " + exists);

		return exists;
	}

}
