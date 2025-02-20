package com.sc.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/page/facility")
public class FacilityController {
	
	@GetMapping("/facil-sauna-picture")
	public ModelAndView room(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","facility");
		mav.setViewName("page/facility/facil-sauna-picture");
		return mav;
	}
}
