package com.sc.main.page;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sc.main.service.ReviewService;
import com.sc.main.service.RoomService;
import com.sc.main.vo.ReviewImgVO;
import com.sc.main.vo.ReviewVO;

@Controller
@RequestMapping("/page/review")
public class ReviewController {
	ModelAndView mav;
	
	@Inject
	ReviewService service;
	
	//모달팝업(비동기)
	@PostMapping("/modalReview")
	@ResponseBody
	//public ReviewVO modalReview(@RequestBody String reviewno, String roomno) {
	public ReviewVO modalReview(@RequestBody Map<String, Object> requestData) {
		//System.out.println("reviewno->"+requestData.get("reviewno"));
		//System.out.println("roomno->"+requestData.get("roomno"));
		
		int reviewno = Integer.parseInt(requestData.get("reviewno").toString());
		int roomno = Integer.parseInt(requestData.get("roomno").toString());
		
		return service.reviewDetail(reviewno);
	}
	
	//리뷰 작성폼
	@GetMapping("/write")
	public String reviewWrite(HttpServletRequest request) {
		return "page/review/review_write";
	}

	//리뷰 작성(DB), 파일 업로드
	@PostMapping("/writeOk")
	public ModelAndView reviewWriteOk(ReviewVO vo, HttpServletRequest request, ReviewImgVO imgVO, MultipartFile mf) {
		HttpSession session = request.getSession();
		mav = new ModelAndView();
		String userid = (String)session.getAttribute("loginId");
		vo.setUserid(userid);

		int result = service.reviewInsert(vo);
		int reviewno = service.reviewImage(userid);
		
		System.out.println(reviewno+"!");
		/////////////////////////////////////////////////////////
		//파일업로드
		//파일 업로드할 폴더의 절대경로
		String path = session.getServletContext().getRealPath("/uploadfile/"+Integer.toString(reviewno));
		System.out.println("path: "+path);
		//업로드한 실제 파일명 구하기
		String orgFilename = mf.getOriginalFilename();
		System.out.println("원래파일명 : "+orgFilename);
		
		//새로 업로드 할 파일이 서버에 있는지 확인 후 
		File file = new File(path, orgFilename);
		
		orgFilename = fileRename(file, path, orgFilename);
		
		//업로드시작	//없으면 업로드 수행
		try {
			file = new File(path, orgFilename);
			mf.transferTo(file);
		}catch(Exception e) {e.printStackTrace();}							
		
		//orgFilename : 업로드한 실제 파일명 -> vo객체에 셋팅
		imgVO.setFilename(orgFilename); //제목, 글내용, 글쓴이, 파일명
		
		int imgResult = 0;
		
		try {
			imgVO.setReviewno(reviewno);
			System.out.println(imgVO.toString());
			//레코드 추가
			//vo.setUserid(null);	//오류테스트 : 일부러 오류내려고 not null 항목을 null로 셋팅함.
			imgResult = service.imgInsert(imgVO);	
		}catch(Exception e) { //insert하다가 실패하면 파일을 삭제해야함
			e.printStackTrace();
			//레코드가 생성되지 않아 이미 업로드 되어있는 파일을 삭제해야한다.
			File f = new File(path, orgFilename);
			f.delete();
		}
		
		////////////////////////////////////////////////////////////////////////
		
		
		if(result==1) {
			mav.setViewName("redirect:/page/review");
		}else {
			mav.setViewName("page/review/review_write");
		}
		
		return mav;
	}
	
	//파일명 변경
	public String fileRename(File file, String path, String orgFilename) {
		//file.exists() : 파일이 존재하면 true, 존재하지 않으면 false
		if(file.exists()) {//있으면 새로운 파일명을 만들고
			for(int i=1; ;i++) {
				//파일명과 확장자 구분
				int point = orgFilename.lastIndexOf(".");
				String f = orgFilename.substring(0, point);	//포인트 앞까지 구해짐
				String ext = orgFilename.substring(point+1);	//포인트 뒤부터 끝까지 구해짐
				
				//새로운 파일명
				String newFilename = f + " ("+i+")."+ext;//01(1).jpeg
				file = new File(path, newFilename);
				if(!file.exists()) {//존재하지 않는 파일이면
					orgFilename = newFilename;
					break;
				}
			}
		}
		return orgFilename;
	}
	
	
	
	
	

	//리뷰 수정폼
	@PostMapping("/edit")
	public ModelAndView reviewEdit(String reviewno) {
		mav = new ModelAndView();
		System.out.println(reviewno);
		mav.addObject("vo", service.reviewDetail(Integer.parseInt(reviewno)));	
		mav.setViewName("page/review/review_edit");
		
		return mav;
	}
	
	//리뷰 수정(DB)
	@PostMapping("/editOk")
	public ModelAndView reviewEdit(ReviewVO vo, ReviewImgVO imgVO, MultipartFile mf, HttpSession session) {
		//업로드한 사진 파일명 불러와야함
		String path = session.getServletContext().getRealPath("/uploadfile");
		
		//ReviewImgVO orgVO = service.reviewImageSelect(imgVO.getImgno()); //업데이트전 레코드 - 파일 삭제시 DB에 저장된 파일명이 필요함
		
		
		
		
		
		
		
		
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

	//리뷰 삭제
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

	//리뷰 검색
	
}
