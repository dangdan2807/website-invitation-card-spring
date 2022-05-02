package N1.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
@RequestMapping("/category")
public class CategoryController {
    @RequestMapping("/{categorySlug}")
	public String showCategoryPage(@PathVariable String categorySlug) {
		return "chua co";
	}
}