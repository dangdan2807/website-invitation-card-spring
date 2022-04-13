package N1.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class TempController {
	@RequestMapping("/about-us")
	public String showAboutUsPage() {
		return "about-us";
	}
	
	@RequestMapping("/account")
	public String showAccountPage() {
		return "account";
	}
	
	@RequestMapping("/checkout")
	public String showCheckoutPage() {
		return "checkout";
	}
	
	@RequestMapping("/contact")
	public String showContactPage() {
		return "contact";
	}
	
	@RequestMapping("/product-detail")
	public String showProductDetailPage() {
		return "product-detail";
	}
	
	@RequestMapping("/product-list")
	public String showProductListPage() {
		return "product-list";
	}
	
	@RequestMapping("/shopping-cart")
	public String showShoppingCartPage() {
		return "shopping-cart";
	}
	
	@RequestMapping("/wish-list")
	public String showWishListPage() {
		return "wish-list";
	}
}
