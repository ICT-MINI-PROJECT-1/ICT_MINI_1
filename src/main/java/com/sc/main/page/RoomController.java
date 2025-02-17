package com.sc.main.page;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sc.main.service.RoomService;
import com.sc.main.vo.RoomVO;

@Controller
@RequestMapping("/page/room")
public class RoomController {
	
	ModelAndView mav;
	
	@Inject
	RoomService service;
	
	@PostMapping("/list")
	public ModelAndView roomList(String loc) {
		List<RoomVO> list = service.roomSelect(loc);
		mav=new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("loc",loc);
		mav.setViewName("page/room/room_list");
		return mav;
	}
}



