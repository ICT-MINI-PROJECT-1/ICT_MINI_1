package com.sc.main;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sc.main.service.UserService;
import com.sc.main.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {
	@Inject
	UserService service;
	
	@GetMapping("/signup")
	public String moveSignUp() {
		return "user/signup";
	}
	@GetMapping("/login")
	public String moveLogin() {
		return "user/login";
	}
	@PostMapping("/signUpChk")
	public ModelAndView signUpChk(UserVO vo) {
		int result;
		try {
			result = service.userInsert(vo);
		} catch(Exception e) {
			e.printStackTrace();
			result=0;
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
}
