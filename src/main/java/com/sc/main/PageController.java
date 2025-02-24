package com.sc.main;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sc.main.service.ReviewService;
import com.sc.main.vo.PagingVO;
import com.sc.main.vo.ReviewImgVO;
import com.sc.main.vo.ReviewVO;

@Controller
@RequestMapping("/page")
public class PageController {
	
	ModelAndView mav;

	@Inject
	ReviewService review_service;

	
	@GetMapping("/about")
	public ModelAndView about(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","about");
		mav.setViewName("page/about");
		return mav;
	}
	@GetMapping("/room")
	public ModelAndView room(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("page","room");
		mav.setViewName("page/room/room_main");
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
	public ModelAndView review(PagingVO pVO){
		pVO.setTotalRecord(review_service.reviewTotalRecord(pVO));
		
		List<ReviewVO> list = review_service.reviewSelect(pVO);
		ArrayList<ArrayList<ReviewImgVO>> img_list = new ArrayList<ArrayList<ReviewImgVO>>();
		for(int i=0;i<list.size();i++) {
			img_list.add(review_service.reviewImageSelect(list.get(i).getReviewno()));
		}
		mav = new ModelAndView();
		mav.addObject("pVO", pVO);
		mav.addObject("list", list);
		mav.addObject("imgList", img_list);
		mav.setViewName("page/review/review_main");
		return mav;
	}
}	
