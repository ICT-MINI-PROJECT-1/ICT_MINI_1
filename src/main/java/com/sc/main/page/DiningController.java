package com.sc.main.page;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/page/dining")
public class DiningController {
	
	@PostMapping("/list")
	//@ResponseBody
	//@RequestMapping("/page/dining")
	public ModelAndView diningList(String foodType) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("page/dining/dining_list");
		mav.addObject("foodType",foodType);
		return mav;
	}
}




