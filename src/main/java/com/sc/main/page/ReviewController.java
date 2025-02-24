package com.sc.main.page;

import java.io.File;
import java.util.ArrayList;
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

		//파일업로드
		//파일 업로드할 폴더의 절대경로
		String path = session.getServletContext().getRealPath("/uploadfile/"+Integer.toString(reviewno));
		//업로드한 실제 파일명 구하기
		String orgFilename = mf.getOriginalFilename();
		
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
			//레코드 추가
			//vo.setUserid(null);	//오류테스트 : 일부러 오류내려고 not null 항목을 null로 셋팅함.
			imgResult = service.imgInsert(imgVO);	
		}catch(Exception e) { //insert하다가 실패하면 파일을 삭제해야함
			e.printStackTrace();
			//레코드가 생성되지 않아 이미 업로드 되어있는 파일을 삭제해야한다.
			File f = new File(path, orgFilename);
			f.delete();
		}
		
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
		mav.addObject("vo", service.reviewDetail(Integer.parseInt(reviewno)));	
		mav.addObject("imgVO", service.reviewImageSelect(Integer.parseInt(reviewno)));
		mav.setViewName("page/review/review_edit");
		
		return mav;
	}
	
	//리뷰 수정(DB)
	@PostMapping("/editOk")
	public ModelAndView reviewEdit(ReviewVO vo, ReviewImgVO imgVO, MultipartFile mf, HttpSession session) {
		mav = new ModelAndView();
		int reviewno = service.reviewImage((String)session.getAttribute("loginId"));
		//업로드한 사진 파일명 불러와야함
		String path = session.getServletContext().getRealPath("/uploadfile/"+Integer.toString(reviewno));

		ArrayList<ReviewImgVO> orgVO = service.reviewImageSelect(vo.getReviewno()); //업데이트전 레코드 - 파일 삭제시 DB에 저장된 파일명이 필요함
		
		//첨부된 파일이 있을 때 - 제목, 글내용, 파일명 수정
		//파일업로드 해야함.
		//기존 파일 삭제 해야함.
		String orgFilename="";
		if(mf!=null) {
			try {
				orgFilename = mf.getOriginalFilename();
			} catch(Exception e) {
				orgFilename="";
			}
			if(orgFilename!="") {
				File file = new File(path, orgFilename);
				orgFilename = fileRename(file, path, orgFilename);
				//업로드
				try {
					file = new File(path, orgFilename);
					mf.transferTo(file);
				}catch(Exception e) {
					System.out.println("파일 업로드시 에러 ->"+e);
				}
				imgVO.setFilename(orgFilename);
			}
		}
		int result = service.reviewUpdate(vo);	//review 글 업데이트

		int imgResult = 0;
	
		try {
			//리뷰이미지 db업데이트
			if(orgFilename!="") {
				imgResult = service.reviewImageUpdate(imgVO);	//review 이미지 업데이트
	
				//기존 업로드한 파일 삭제 - 업데이트 성공시
				for(int i=0;i<orgVO.size();i++) {
					if(orgVO.get(i).getFilename()!=null) {
						File f = new File(path, orgVO.get(i).getFilename());
						f.delete();
					}
				}
			}
			mav.setViewName("redirect:/page/review");	//db업데이트 성공했을 때 review_main.jsp로 이동
		}catch(Exception e) {
			//새로 업로드한 파일 삭제 - 업데이트 실패시
			System.out.println("새로 업로드한 파일 삭제 실패->"+e);
			if(imgVO.getFilename()!=null) {
				File f = new File(path, imgVO.getFilename());
				f.delete();
			}
			mav.setViewName("page/review/review_result");
		}
		return mav;
	}

	//리뷰 삭제
	@PostMapping("/delete")
	public ModelAndView reviewDelete(String reviewno, HttpServletRequest request) {
		
		
		mav = new ModelAndView();
		
		
		/////////////////////////////////////////////////////
		
		//해당레코드 먼저 선택
		ArrayList<ReviewImgVO> imgVO = service.reviewImageSelect(Integer.parseInt(reviewno));
		System.out.println("reviewno="+reviewno);
		System.out.println(imgVO.toString());
		//해당레코드 지우기
		try {
			service.reviewImageDelete(Integer.parseInt(reviewno));
			//파일삭제
			String path = request.getSession().getServletContext().getRealPath("/uploadfile/"+reviewno);
			System.out.println(imgVO.get(0).getFilename());
			File file = new File(path, imgVO.get(0).getFilename());
			file.delete();
			//글목록
			mav.setViewName("redirect:/page/review");
		}catch(Exception e) {
			System.out.println("리뷰이미지 삭제시 에러->"+e);
			mav.setViewName("page/review/review_result");
		}
		int result = service.reviewDelete(Integer.parseInt(reviewno));
		if(result>0) {
			mav.setViewName("redirect:/page/review");
		}else {
			mav.setViewName("page/review/review_result");
		}
		
		return mav;
		

		
		/////////////////////////////////////////////////////
		
		/*
		if(result>0) {
			mav.setViewName("redirect:/page/review");
		}else {
			mav.setViewName("page/review/review_result");
		}
		
		return mav;
		*/
	}
}
