package com.sc.main.page;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sc.main.service.ReviewService;
import com.sc.main.vo.ReviewVO;

@Controller
@RequestMapping("/page/review")
public class ReviewController {
	ModelAndView mav;
	
	@Inject
	ReviewService service;
	
	//¸ð´ÞÆË¾÷(ºñµ¿±â)
	@PostMapping("/modalReview")
	@ResponseBody
	public ReviewVO modalReview(@RequestBody String reviewno) {
		//System.out.println(reviewno);
		return service.reviewDetail(Integer.parseInt(reviewno));
	}

	//¸®ºä ÀÛ¼ºÆû
	@GetMapping("/write")
	public String reviewWrite() {
		return "page/review/review_write";
	}

	//¸®ºä ÀÛ¼º(DB)
	@PostMapping("/writeOk")
	public ModelAndView reviewWriteOk(ReviewVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		mav = new ModelAndView();
		
		vo.setUserid((String)session.getAttribute("loginId"));

		int result = service.reviewInsert(vo);
		
		if(result==1) {
			mav.setViewName("redirect:/page/review");
		}else {
			mav.setViewName("page/review/review_write");
		}
		
		return mav;
	}

	//¸®ºä ¼öÁ¤Æû
	@PostMapping("/edit")
	public ModelAndView reviewEdit(String reviewno) {
		mav = new ModelAndView();
		
		mav.addObject("vo", service.reviewDetail(Integer.parseInt(reviewno)));	
		mav.setViewName("page/review/review_edit");
		
		return mav;
	}
	
	//¸®ºä ¼öÁ¤(DB)
	@PostMapping("/editOk")
	public ModelAndView reviewEdit(ReviewVO vo) {
		int result = service.reviewUpdate(vo);
		System.out.println(vo.toString());
		
		mav = new ModelAndView();
		if(result>0) {
			mav.setViewName("redirect:/page/review");
		}else {
			mav.setViewName("page/review/review_result");
		}
		
		return mav;
	}

	//¸®ºä »èÁ¦
	@PostMapping("/delete")
	public ModelAndView reviewDelete(String reviewno) {
		int result = service.reviewDelete(Integer.parseInt(reviewno));
		
		mav = new ModelAndView();
		
		if(result>0) {
			mav.setViewName("redirect:/page/review");
		}else {
			mav.setViewName("page/review/review_result");
		}
		
		return mav;
	}

	//¸®ºä °Ë»ö
	
}
