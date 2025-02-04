package com.sc.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/page")
public class PageController {
	@GetMapping("/about")
	public String about(){
		return "page/about";
	}
	
	@GetMapping("/reservation")
	public String reservation(){
		return "page/reservation";
	}
	
	@GetMapping("/dining")
	public String dining(){
		return "page/dining";
	}
	
	@GetMapping("/faculty")
	public String faculty(){
		return "page/faculty";
	}
	
	@GetMapping("/review")
	public String review(){
		return "page/review";
	}
}
