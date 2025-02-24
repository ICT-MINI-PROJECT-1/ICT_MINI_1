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
	
	//����˾�(�񵿱�)
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
	
	//���� �ۼ���
	@GetMapping("/write")
	public String reviewWrite(HttpServletRequest request) {
		return "page/review/review_write";
	}

	//���� �ۼ�(DB), ���� ���ε�
	@PostMapping("/writeOk")
	public ModelAndView reviewWriteOk(ReviewVO vo, HttpServletRequest request, ReviewImgVO imgVO, MultipartFile mf) {
		HttpSession session = request.getSession();
		mav = new ModelAndView();
		String userid = (String)session.getAttribute("loginId");
		vo.setUserid(userid);

		int result = service.reviewInsert(vo);
		int reviewno = service.reviewImage(userid);

		//���Ͼ��ε�
		//���� ���ε��� ������ ������
		String path = session.getServletContext().getRealPath("/uploadfile/"+Integer.toString(reviewno));
		//���ε��� ���� ���ϸ� ���ϱ�
		String orgFilename = mf.getOriginalFilename();
		
		//���� ���ε� �� ������ ������ �ִ��� Ȯ�� �� 
		File file = new File(path, orgFilename);
		
		orgFilename = fileRename(file, path, orgFilename);
		
		//���ε����	//������ ���ε� ����
		try {
			file = new File(path, orgFilename);
			mf.transferTo(file);
		}catch(Exception e) {e.printStackTrace();}							
		
		//orgFilename : ���ε��� ���� ���ϸ� -> vo��ü�� ����
		imgVO.setFilename(orgFilename); //����, �۳���, �۾���, ���ϸ�
		
		int imgResult = 0;
		
		try {
			imgVO.setReviewno(reviewno);
			//���ڵ� �߰�
			//vo.setUserid(null);	//�����׽�Ʈ : �Ϻη� ���������� not null �׸��� null�� ������.
			imgResult = service.imgInsert(imgVO);	
		}catch(Exception e) { //insert�ϴٰ� �����ϸ� ������ �����ؾ���
			e.printStackTrace();
			//���ڵ尡 �������� �ʾ� �̹� ���ε� �Ǿ��ִ� ������ �����ؾ��Ѵ�.
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
	
	//���ϸ� ����
	public String fileRename(File file, String path, String orgFilename) {
		//file.exists() : ������ �����ϸ� true, �������� ������ false
		if(file.exists()) {//������ ���ο� ���ϸ��� �����
			for(int i=1; ;i++) {
				//���ϸ�� Ȯ���� ����
				int point = orgFilename.lastIndexOf(".");
				String f = orgFilename.substring(0, point);	//����Ʈ �ձ��� ������
				String ext = orgFilename.substring(point+1);	//����Ʈ �ں��� ������ ������
				
				//���ο� ���ϸ�
				String newFilename = f + " ("+i+")."+ext;//01(1).jpeg
				file = new File(path, newFilename);
				if(!file.exists()) {//�������� �ʴ� �����̸�
					orgFilename = newFilename;
					break;
				}
			}
		}
		return orgFilename;
	}

	//���� ������
	@PostMapping("/edit")
	public ModelAndView reviewEdit(String reviewno) {
		mav = new ModelAndView();
		mav.addObject("vo", service.reviewDetail(Integer.parseInt(reviewno)));	
		mav.addObject("imgVO", service.reviewImageSelect(Integer.parseInt(reviewno)));
		mav.setViewName("page/review/review_edit");
		
		return mav;
	}
	
	//���� ����(DB)
	@PostMapping("/editOk")
	public ModelAndView reviewEdit(ReviewVO vo, ReviewImgVO imgVO, MultipartFile mf, HttpSession session) {
		mav = new ModelAndView();
		int reviewno = service.reviewImage((String)session.getAttribute("loginId"));
		//���ε��� ���� ���ϸ� �ҷ��;���
		String path = session.getServletContext().getRealPath("/uploadfile/"+Integer.toString(reviewno));

		ArrayList<ReviewImgVO> orgVO = service.reviewImageSelect(vo.getReviewno()); //������Ʈ�� ���ڵ� - ���� ������ DB�� ����� ���ϸ��� �ʿ���
		
		//÷�ε� ������ ���� �� - ����, �۳���, ���ϸ� ����
		//���Ͼ��ε� �ؾ���.
		//���� ���� ���� �ؾ���.
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
				//���ε�
				try {
					file = new File(path, orgFilename);
					mf.transferTo(file);
				}catch(Exception e) {
					System.out.println("���� ���ε�� ���� ->"+e);
				}
				imgVO.setFilename(orgFilename);
			}
		}
		int result = service.reviewUpdate(vo);	//review �� ������Ʈ

		int imgResult = 0;
	
		try {
			//�����̹��� db������Ʈ
			if(orgFilename!="") {
				imgResult = service.reviewImageUpdate(imgVO);	//review �̹��� ������Ʈ
	
				//���� ���ε��� ���� ���� - ������Ʈ ������
				for(int i=0;i<orgVO.size();i++) {
					if(orgVO.get(i).getFilename()!=null) {
						File f = new File(path, orgVO.get(i).getFilename());
						f.delete();
					}
				}
			}
			mav.setViewName("redirect:/page/review");	//db������Ʈ �������� �� review_main.jsp�� �̵�
		}catch(Exception e) {
			//���� ���ε��� ���� ���� - ������Ʈ ���н�
			System.out.println("���� ���ε��� ���� ���� ����->"+e);
			if(imgVO.getFilename()!=null) {
				File f = new File(path, imgVO.getFilename());
				f.delete();
			}
			mav.setViewName("page/review/review_result");
		}
		return mav;
	}

	//���� ����
	@PostMapping("/delete")
	public ModelAndView reviewDelete(String reviewno, HttpServletRequest request) {
		
		
		mav = new ModelAndView();
		
		
		/////////////////////////////////////////////////////
		
		//�ش緹�ڵ� ���� ����
		ArrayList<ReviewImgVO> imgVO = service.reviewImageSelect(Integer.parseInt(reviewno));
		System.out.println("reviewno="+reviewno);
		System.out.println(imgVO.toString());
		//�ش緹�ڵ� �����
		try {
			service.reviewImageDelete(Integer.parseInt(reviewno));
			//���ϻ���
			String path = request.getSession().getServletContext().getRealPath("/uploadfile/"+reviewno);
			System.out.println(imgVO.get(0).getFilename());
			File file = new File(path, imgVO.get(0).getFilename());
			file.delete();
			//�۸��
			mav.setViewName("redirect:/page/review");
		}catch(Exception e) {
			System.out.println("�����̹��� ������ ����->"+e);
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
