package com.sc.main.page;

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

import com.sc.main.service.RoomService;
import com.sc.main.vo.RoomVO;
import com.sc.main.vo.UserVO;
import com.sc.main.vo.WishlistVO;

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
	
	@PostMapping("/modalinfo")
	@ResponseBody
	public RoomVO modalInfo(@RequestBody String data) {
		return service.roomInfo(Integer.parseInt(data));
	}
	@GetMapping("/renderWish")
	@ResponseBody
	public List<WishlistVO> renderWish(HttpSession session) {
		return service.wishSelect((String)session.getAttribute("loginId"));
	}
	@PostMapping("/doWish")
	@ResponseBody
	public void doWish(HttpSession session, @RequestBody String data) {
		String user_id = (String)session.getAttribute("loginId");
		int roomno = Integer.parseInt(data);
		List<WishlistVO> wVO = service.wishSelect(user_id);
		int res=0;
		for(int i=0;i<wVO.size();i++) {
			if(wVO.get(i).getRoomno()==roomno) {
				res++;
				break;
			}
		}
		WishlistVO input = new WishlistVO();
		input.setUserid(user_id);
		input.setRoomno(roomno);
		if(res==1) service.deleteWish(input);
		else service.insertWish(input);
	}
}
