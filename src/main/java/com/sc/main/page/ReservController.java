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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sc.main.service.ReservService;
import com.sc.main.service.RoomService;
import com.sc.main.vo.ReservationVO;
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
	public ModelAndView formHome(HttpSession session) {
		mav = new ModelAndView();
		String user_id = (String)session.getAttribute("loginId");
		ReservationVO rVO = service.selectReservation(user_id);
		if(rVO==null) {
			mav.setViewName("page/reservation/reserv_form");
		}
		else {
			mav.addObject("reservVO",rVO);
			mav.addObject("roomVO",room_service.roomInfo(rVO.getRoomno()));
			mav.setViewName("page/reservation/reserv_edit");
		}	
		return mav;
	}
	
	@PostMapping("/form")
	public ModelAndView formRoom(HttpSession session, String roomno) {
		mav = new ModelAndView();
		String user_id = (String)session.getAttribute("loginId");
		ReservationVO rVO = service.selectReservation(user_id);
		if(rVO==null) {
			RoomVO vo = room_service.roomInfo(Integer.parseInt(roomno));
			mav.addObject("vo",vo);
			mav.setViewName("page/reservation/reserv_form");
		} else {
			mav.addObject("reservVO",rVO);
			mav.addObject("roomVO",room_service.roomInfo(rVO.getRoomno()));
			mav.setViewName("page/reservation/reserv_edit");
		}
		return mav;
	}
	@PostMapping("/selectRoom")
	@ResponseBody
	public RoomVO selectRoom(@RequestBody String roomno) {
		return room_service.roomInfo(Integer.parseInt(roomno));
	}
	@PostMapping("/setCalendar")
	@ResponseBody
	public List<ReservationVO> setCalendar(@RequestBody String roomno) {
		return service.selectReservationByRoom(Integer.parseInt(roomno));
	}
	@PostMapping("/doReservation")
	public String doReservation(HttpSession session, ReservationVO vo, RedirectAttributes redirect) {
		String user_id = (String)session.getAttribute("loginId");
		if(user_id != null) {
			ReservationVO rVO = service.selectReservation(user_id);
			if(rVO == null) {	// 예약 없을때
				vo.setUserid(user_id);
				service.insertReservation(vo);
				redirect.addAttribute("msg","rio");
				return "redirect:/notice";
			} else {	//이미 한 예약이 있을때
				return "page/reservation/reserv_form";
			}
		}
		return "redirect:/";
	}
	@PostMapping("/doReservationEdit")
	public String doReservationEdit(HttpSession session, ReservationVO vo, RedirectAttributes redirect) {
		String user_id = (String)session.getAttribute("loginId");
		if(user_id != null) {
			service.deleteReservation(vo.getReservno());
			
			redirect.addAttribute("msg","rdo");
		}
		return "redirect:/notice";
	}
}



