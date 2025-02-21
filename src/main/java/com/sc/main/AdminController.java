package com.sc.main;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.main.service.AdminService;
import com.sc.main.vo.PagingVO;
import com.sc.main.vo.ReservPagingVO;
import com.sc.main.vo.ReservationVO;
import com.sc.main.vo.UserPagingVO;
import com.sc.main.vo.UserVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Inject
	AdminService service;

	@PostMapping("/user")
	@ResponseBody
	public UserPagingVO user(@RequestBody PagingVO pVO) {
		pVO.setOnePageRecord(10);
		pVO.setTotalRecord(service.userTotalRecord());
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
		pVO.setTotalRecord(service.reservTotalRecord());
		List<ReservationVO> list = service.renderReservList(pVO);
		ReservPagingVO rpv = new ReservPagingVO();
		rpv.setPvo(pVO);
		rpv.setRv(list);
		return rpv;
	}
}
