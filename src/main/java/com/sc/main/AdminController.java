package com.sc.main;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.main.service.AdminService;
import com.sc.main.service.ReservService;
import com.sc.main.service.ReviewService;
import com.sc.main.service.UserService;
import com.sc.main.vo.PagingVO;
import com.sc.main.vo.ReservPagingVO;
import com.sc.main.vo.ReservationVO;
import com.sc.main.vo.ReviewPagingVO;
import com.sc.main.vo.ReviewVO;
import com.sc.main.vo.UserPagingVO;
import com.sc.main.vo.UserVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Inject
	AdminService service;
	
	@Inject
	UserService user_service;
	
	@Inject
	ReservService reserv_service;
	
	@Inject
	ReviewService review_service;
	
	@PostMapping("/user")
	@ResponseBody
	public UserPagingVO user(@RequestBody PagingVO pVO) {
		pVO.setOnePageRecord(10);
		pVO.setNowPage(pVO.getNowPage());
		pVO.setTotalRecord(service.userTotalRecord(pVO));
		List<UserVO> list = service.renderUserList(pVO);
		UserPagingVO upv = new UserPagingVO();
		upv.setPvo(pVO);
		upv.setUv(list);
		return upv;
	}
	
	@PostMapping("/reserv")
	@ResponseBody
	public ReservPagingVO reserv(@RequestBody PagingVO pVO) {
		pVO.setOnePageRecord(10);
		pVO.setNowPage(pVO.getNowPage());
		pVO.setTotalRecord(service.reservTotalRecord(pVO));
		List<ReservationVO> list = service.renderReservList(pVO);
		ReservPagingVO rpv = new ReservPagingVO();
		rpv.setPvo(pVO);
		rpv.setRv(list);
		return rpv;
	}
	
	@PostMapping("/review")
	@ResponseBody
	public ReviewPagingVO showReview(@RequestBody PagingVO pVO) {
		pVO.setOnePageRecord(10);
		pVO.setNowPage(pVO.getNowPage());
		pVO.setTotalRecord(service.reviewTotalRecord(pVO));
		List<ReviewVO> list = service.renderReviewList(pVO);
		ReviewPagingVO rpv = new ReviewPagingVO();
		rpv.setPvo(pVO);
		rpv.setRv(list);
		return rpv;
	}
	
	@PostMapping("/delete/user")
	@ResponseBody
	public String deleteUser(@RequestBody String userid) {
		user_service.userDelete(userid);
		return "deleteOk";
	}
	
	@PostMapping("/delete/reserv")
	@ResponseBody
	public String deleteReserv(@RequestBody String reservno) {
		reserv_service.deleteReservation(Integer.parseInt(reservno));
		return "deleteOk";
	}
	
	@PostMapping("/delete/review")
	@ResponseBody
	public String deleteReview(@RequestBody String reviewno) {
		review_service.reviewDelete(Integer.parseInt(reviewno));
		return "deleteOk";
	}
}


