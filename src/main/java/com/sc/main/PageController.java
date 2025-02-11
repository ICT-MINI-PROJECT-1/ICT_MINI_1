package com.sc.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/page")
public class PageController {
	@GetMapping("/about")
	public ModelAndView about(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","about");
		mav.setViewName("page/about");
		return mav;
	}
	
	@GetMapping("/reservation")
	public ModelAndView reservation(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","reservation");
		mav.setViewName("page/reservation/reserv_main");
		return mav;
	}
	
	@GetMapping("/dining")
	public ModelAndView dining(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","dining");
		mav.setViewName("page/dining/dining_main");
		return mav;
	}
	
	@GetMapping("/facility")
	public ModelAndView facility(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","facility");
		mav.setViewName("page/facility/facil_main");
		return mav;
	}
	
	@GetMapping("/review")
	public ModelAndView review(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","review");
		mav.setViewName("page/review/review_main");
		return mav;
	}
}
