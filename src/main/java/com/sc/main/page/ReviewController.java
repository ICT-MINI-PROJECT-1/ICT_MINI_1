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

import com.sc.main.service.ReservService;
import com.sc.main.service.ReviewService;
import com.sc.main.service.RoomService;
import com.sc.main.vo.ModalReviewVO;
import com.sc.main.vo.PagingVO;
import com.sc.main.vo.ReviewImgVO;
import com.sc.main.vo.ReviewVO;

@Controller
@RequestMapping("/page/review")
public class ReviewController {
	ModelAndView mav;
	
	@Inject
	ReviewService service;
	
	@Inject
	ReservService reserv_service;
	
	//모달팝업(비동기)
	@PostMapping("/modalReview")
	@ResponseBody
	//public ReviewVO modalReview(@RequestBody String reviewno, String roomno) {
	public ModalReviewVO modalReview(@RequestBody Map<String, Object> requestData) {
		//System.out.println("reviewno->"+requestData.get("reviewno"));
		//System.out.println("roomno->"+requestData.get("roomno"));
		
		int reviewno = Integer.parseInt(requestData.get("reviewno").toString());
		int roomno = Integer.parseInt(requestData.get("roomno").toString());
		
		//조회수 증가
		service.reviewHitCount(reviewno);
		ModalReviewVO mrvo= new ModalReviewVO();
		mrvo.setVo(service.reviewDetail(reviewno));
		mrvo.setRivo(service.reviewImageSelect(reviewno));
		return mrvo;
	}
	
	//리뷰 작성폼
	@GetMapping("/write")
	public ModelAndView reviewWrite(HttpServletRequest request, HttpSession session) {
		String userid=(String) session.getAttribute("loginId");
		mav=new ModelAndView();
		mav.setViewName("page/review/review_write");
		System.out.println(service.reviewHistory(userid));
		mav.addObject("rVO", service.reviewHistory(userid));
		return mav;
	}

	//리뷰 작성(DB), 파일 업로드
	@PostMapping("/writeOk")
	public ModelAndView reviewWriteOk(ReviewVO vo, HttpServletRequest request, ReviewImgVO imgVO, MultipartFile[] mf) {
		HttpSession session = request.getSession();
		mav = new ModelAndView();
		String userid = (String)session.getAttribute("loginId");
		vo.setUserid(userid);
		vo.setRoomno(reserv_service.selectRoomnoByReservNo(vo.getReservno()));
		
		int result = service.reviewInsert(vo);
		int reviewno = service.reviewImage(userid);
		
		for(MultipartFile f: mf) {
			String path = session.getServletContext().getRealPath("/uploadfile/"+Integer.toString(reviewno));
			String orgFilename = f.getOriginalFilename();
			System.out.println(orgFilename+"!!!");
			File file = new File(path, orgFilename);
			orgFilename = fileRename(file, path, orgFilename);
			System.out.println(orgFilename+"???");
			try {
				file = new File(path, orgFilename);
				f.transferTo(file);
			}catch(Exception e) {e.printStackTrace();}
			
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
				File fi = new File(path, orgFilename);
				fi.delete();
			}
			if(result==1) {
				mav.setViewName("redirect:/page/review");
			}else {
				mav.setViewName("page/review/review_write");
			}
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
	public ModelAndView reviewEdit(ReviewVO vo, ReviewImgVO imgVO, MultipartFile[] mf, HttpSession session) {
		mav = new ModelAndView();
		int reviewno = service.reviewImage((String)session.getAttribute("loginId"));
		//업로드한 사진 파일명 불러와야함
		String path = session.getServletContext().getRealPath("/uploadfile/"+Integer.toString(reviewno));

		ArrayList<ReviewImgVO> orgVO = service.reviewImageSelect(vo.getReviewno()); //업데이트전 레코드 - 파일 삭제시 DB에 저장된 파일명이 필요함
		//첨부된 파일이 있을 때 - 제목, 글내용, 파일명 수정
		//파일업로드 해야함.
		//기존 파일 삭제 해야함.
		String orgFilename="";
		int flag=0;
		int over;
		if(orgVO.size() > mf.length) {
			flag=1;
			over = orgVO.size()-mf.length;
		}
		if(orgVO.size() < mf.length) {
			flag=2;
		}
		String p="";
		boolean isOk=true;
		try {
			p = mf[0].getOriginalFilename();
		} catch(Exception e) {
			isOk=false;
		}
		System.out.println(isOk);
		if(isOk && (p!=null && !p.equals(""))) {
				for(int i=0;i<orgVO.size();i++) {
					try {
						if(orgVO.get(i).getFilename()!=null) {
							File fi = new File(path, orgVO.get(i).getFilename());
							int x = orgVO.get(i).getImgno();
							orgVO.get(i).setImgno(x);
							fi.delete();
							File folder = new File(path,"");
							folder.delete();
						}
					} catch(Exception ee) {
						ee.printStackTrace();
					}
				}
			int idx=-1;
			for(MultipartFile f : mf) {
				if(++idx == orgVO.size()) break;
				orgFilename="";
				if(f!=null) {
					try {
						orgFilename = f.getOriginalFilename();
					} catch(Exception e) {
						orgFilename="";
					}
					if(orgFilename!="") {
						File file = new File(path, orgFilename);
						orgFilename = fileRename(file, path, orgFilename);
						//업로드
						try {
							file = new File(path, orgFilename);
							f.transferTo(file);
						}catch(Exception e) {
							System.out.println("파일 업로드시 에러 ->"+e);
						}
						orgVO.get(idx).setFilename(orgFilename);
					}
					try {
						//리뷰이미지 db업데이트
						System.out.println(orgVO.get(idx).toString());
						service.reviewImageUpdate(orgVO.get(idx));	//review 이미지 업데이트
	
						mav.setViewName("redirect:/page/review");	//db업데이트 성공했을 때 review_main.jsp로 이동
					}catch(Exception e) {
						//새로 업로드한 파일 삭제 - 업데이트 실패시
						System.out.println("새로 업로드한 파일 삭제 실패->"+e);
						if(imgVO.getFilename()!=null) {
							File fi = new File(path, imgVO.getFilename());
							fi.delete();
						}
						mav.setViewName("page/review/review_result");
					}
				}
			}
			if(flag == 1) {
				System.out.println("flag"+flag);
				for(int i=mf.length;i<orgVO.size();i++) {
					service.reviewImageDelete(orgVO.get(i).getImgno());
				}
			}
			if(flag == 2) {
				System.out.println("flag"+flag);
				for(int i=idx;i<mf.length;i++) {
					orgFilename = mf[i].getOriginalFilename();
					
					File file = new File(path, orgFilename);
					orgFilename = fileRename(file, path, orgFilename);
					
					try {
						file = new File(path, orgFilename);
						mf[i].transferTo(file);
					}catch(Exception e) {e.printStackTrace();}
					
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
						File fi = new File(path, orgFilename);
						fi.delete();
					}
				}
			}
		} else {
			mav.setViewName("redirect:/page/review");
		}
		int result = service.reviewUpdate(vo);	//review 글 업데이트
	
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
		for(int t=0;t<imgVO.size();t++) {
			try {
				//파일삭제
				String path = request.getSession().getServletContext().getRealPath("/uploadfile/"+reviewno);
				File file = new File(path, imgVO.get(t).getFilename());
				file.delete();
				File folder = new File(path,"");
				folder.delete();
				//글목록
				mav.setViewName("redirect:/page/review");
			}catch(Exception e) {
				System.out.println("리뷰이미지 삭제시 에러->"+e);
				mav.setViewName("page/review/review_result");
			}
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


	//마이페이지 리뷰 목록 조회
	@GetMapping("/mypageReview")
    @ResponseBody
    public List<ReviewVO> mypageReview(HttpSession session) {
        String userid = (String) session.getAttribute("loginId");
        if (userid != null) {
            PagingVO pVO = new PagingVO();
            pVO.setUserid(userid); // 사용자 ID 설정
            return service.reviewSelectByUserid(pVO);
        }
        return null;
    }
}
