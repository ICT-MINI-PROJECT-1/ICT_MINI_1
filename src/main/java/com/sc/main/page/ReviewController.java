package com.sc.main.page;

import java.util.List;

import javax.inject.Inject;

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
		System.out.println(reviewno);
		return service.reviewDetail(Integer.parseInt(reviewno));
	}

	//¸®ºä ÀÛ¼º
	@GetMapping("/write")
	public String reviewWrite() {
		return "page/review/review_write";
	}

	//¸®ºä ÀÛ¼º(DB)

	//¸®ºä ¼öÁ¤

	//¸®ºä »èÁ¦

	//¸®ºä °Ë»ö
	
}
