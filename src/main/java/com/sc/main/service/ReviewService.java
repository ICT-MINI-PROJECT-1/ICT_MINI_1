package com.sc.main.service;

import java.util.List;

import com.sc.main.vo.ReviewVO;

public interface ReviewService {
	public List<ReviewVO> reviewSelect();
	public ReviewVO reviewDetail(int reviewno);
	public int reviewInsert(ReviewVO vo);
}
