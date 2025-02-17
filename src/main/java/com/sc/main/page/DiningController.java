package com.sc.main.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/page/dining")
public class DiningController {
	
	ModelAndView mav;
	
	public ModelAndView diningList() {
		mav.addObject("/dining_list");
		return mav;
	}
	
	

	
}



