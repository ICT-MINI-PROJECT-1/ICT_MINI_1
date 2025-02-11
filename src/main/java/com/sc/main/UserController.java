package com.sc.main;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@PostMapping("/loginChk")
	@ResponseBody
	public String loginChk(@RequestBody UserVO vo) {
		if(service.loginIdChk(vo) != 1)return "0";
		else {
			if(service.loginPwChk(vo)!= 1) return "1";
			else return "2";
		}
	}
	@PostMapping("/loginOk")
	public ModelAndView loginOk(String userid, HttpSession session) {
		UserVO cu = service.userSelect(userid);
		ModelAndView mav = new ModelAndView();
		session.setAttribute("loginId", cu.getUserid());
		session.setAttribute("loginName", cu.getUsername());
		session.setAttribute("loginStatus", "Y");
		mav.setViewName("redirect:/");
		return mav;
	}
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
