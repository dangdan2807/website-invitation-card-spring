package N1.Controller;

import java.util.List;
import java.util.logging.Logger;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
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


import N1.entity.TaiKhoan;

@Controller
@RequestMapping("/dang-ky")
public class RegistrationController {

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

		// form validation
		if (theBindingResult.hasErrors()) {

			theModel.addAttribute("crmUser", new TaiKhoan());
			theModel.addAttribute("registrationError", "User name/password can not be empty.");

			logger.warning("User name/password can not be empty.");

			return "user/registration";
		}

		// check the database if user already exists
		boolean userExists = doesUserExist(tenDangNhap);

		if (userExists) {
			theModel.addAttribute("crmUser", new TaiKhoan());
			theModel.addAttribute("registrationError", "User name already exists.");

			logger.warning("User name already exists.");

			return "user/registration";
		}

		//
		// whew ... we passed all of the validation checks!
		// let's get down to business!!!
		//

		// encrypt the password
		String encodedPassword = passwordEncoder.encode(theCrmUser.getMatKhau());

		// prepend the encoding algorithm id
		encodedPassword = "{bcrypt}" + encodedPassword;

		// give user default role of "employee"
		List<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList("ROLE_CUSTOMER");

		// create user object (from Spring Security framework)
		User tempUser = new User(tenDangNhap, encodedPassword, authorities);

		// save user in the database
		userDetailsManager.createUser(tempUser);

		logger.info("Successfully created user: " + tenDangNhap);

		return "user/registration-confirmation";
	}

	private boolean doesUserExist(String tenDangNhap) {

		logger.info("Checking if user exists: " + tenDangNhap);

		// check the database if the user already exists
		boolean exists = userDetailsManager.userExists(tenDangNhap);

		logger.info("User: " + tenDangNhap + ", exists: " + exists);

		return exists;
	}

}
