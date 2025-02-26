package com.sc.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/page/facility")
public class FacilityController {
	
	@GetMapping("/facil-sauna-picture")
	public ModelAndView sauna(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","facility");
		mav.setViewName("page/facility/facil-sauna-picture");
		return mav;
	}
	@GetMapping("/facil-pool-picture")
	public ModelAndView pool(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","facility");
		mav.setViewName("page/facility/facil-pool-picture");
		return mav;
	}
	@GetMapping("/facil-gym-picture")
	public ModelAndView gym(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","facility");
		mav.setViewName("page/facility/facil-gym-picture");
		return mav;
	}
	@GetMapping("/facil-restaurant-picture")
	public ModelAndView restaurant(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","facility");
		mav.setViewName("page/facility/facil-restaurant-picture");
		return mav;
	}
	@GetMapping("/facil-bar-picture")
	public ModelAndView bar(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","facility");
		mav.setViewName("page/facility/facil-bar-picture");
		return mav;
	}
	@GetMapping("/facil-laundry-picture")
	public ModelAndView laundry(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","facility");
		mav.setViewName("page/facility/facil-laundry-picture");
		return mav;
	}
}


