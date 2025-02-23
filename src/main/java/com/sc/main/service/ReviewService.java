package com.sc.main.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.sc.main.vo.PagingVO;
import com.sc.main.vo.ReviewImgVO;
import com.sc.main.vo.ReviewVO;

public interface ReviewService {
	public List<ReviewVO> reviewSelect(PagingVO pVO);
	public ReviewVO reviewDetail(int reviewno);
	public int reviewInsert(ReviewVO vo);
	public int reviewUpdate(ReviewVO vo);
	public int reviewDelete(int reviewno);
	public int reviewTotalRecord(PagingVO pVO);
	public int imgInsert(ReviewImgVO imgVO);
	public int reviewImage(String userid);
	public ArrayList<ReviewImgVO> reviewImageSelect(int reviewno);
}
