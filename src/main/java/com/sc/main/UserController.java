package com.sc.main;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sc.main.service.ReservService;
import com.sc.main.service.UserService;
import com.sc.main.vo.ReservationVO;
import com.sc.main.vo.RoomVO;
import com.sc.main.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {
	@Inject
	UserService service;
	
	@Inject
	ReservService reserv_service;
	
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
		vo.setCreditcardno();
		vo.setEmail();
		vo.setTel();
		service.userInsert(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/login");
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
	@PostMapping("/idChk")
	@ResponseBody
	public int idChk(@RequestBody UserVO vo) {
		return service.loginIdChk(vo);
	}
	@GetMapping("/mypage")
	public ModelAndView mypage(HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		ModelAndView mav = new ModelAndView();
		UserVO vo = service.userSelect(user_id);
		List<RoomVO> rVO = service.selectWishList(user_id);
		vo.setEmailSplit();
		vo.setTelSplit();
		vo.setCreditSplit();
		
		ReservationVO reserv = reserv_service.selectReservation(user_id);
		List<ReservationVO> reserv_list = reserv_service.selectLastReservation(user_id);
		//System.out.println(rvo.toString());
		System.out.println(reserv_list.toString());
		
		mav.addObject("vo",vo);
		mav.addObject("rvo",rVO);
		mav.addObject("reserv",reserv);
		mav.addObject("reserv_list",reserv_list);
		mav.setViewName("user/mypage");
		return mav;
	}
	@PostMapping("/signUpEditChk")
	public ModelAndView signUpEditChk(UserVO vo, RedirectAttributes redirect) {
		vo.setCreditcardno();
		vo.setEmail();
		vo.setTel();
		service.userUpdate(vo);
		redirect.addAttribute("msg","se");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/notice");
		return mav;
	}
}
