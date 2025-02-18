package com.sc.main.page;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sc.main.service.ReservService;
import com.sc.main.service.RoomService;
import com.sc.main.vo.RoomVO;

@Controller
@RequestMapping("/page/reservation")
public class ReservController {
	
	ModelAndView mav;
	
	@Inject
	ReservService service;
	
	@Inject
	RoomService room_service;
	
	@GetMapping("/form")
	public String formHome() {
		return "page/reservation/reserv_form";
	}
	
	@PostMapping("/form")
	public ModelAndView formRoom(String roomno) {
		mav = new ModelAndView();
		mav.setViewName("page/reservation/reserv_form");
		RoomVO vo = room_service.roomInfo(Integer.parseInt(roomno));
		mav.addObject("vo",vo);
		return mav;
	}
}



