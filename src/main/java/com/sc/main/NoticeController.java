package com.sc.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
	
	@RequestMapping(value="/notice")
	public ModelAndView doNotice(String msg){
		ModelAndView mav = new ModelAndView();
		if(msg.equals("rir")) mav.addObject("msg","글을 작성하기 위한 예약 내역이 없습니다.");
		if(msg.equals("rdo")) mav.addObject("msg","예약이 성공적으로 취소 되었습니다.");
		if(msg.equals("rio")) mav.addObject("msg","예약이 성공적으로 처리 되었습니다.");
		if(msg.equals("se")) mav.addObject("msg","정보가 정상적으로 수정되었습니다.");
		mav.setViewName("notice/notice");
		return mav;
	}
}
