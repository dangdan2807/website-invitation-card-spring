package N1.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("shop")
public class ShopController {
    @RequestMapping("/shop-grid")
    public String showShopGridPage() {
        return "user/shop-grid";
    }
    
    @RequestMapping("/shopping-cart")
    public String showShoppingCartPage() {
        return "user/shopping-cart";
    }
    
    @RequestMapping("/checkout")
	public String showCheckoutPage() {
		return "user/checkout";
	}
}
