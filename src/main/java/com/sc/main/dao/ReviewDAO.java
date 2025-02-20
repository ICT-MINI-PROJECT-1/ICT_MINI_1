package com.sc.main.dao;

import java.util.List;

import com.sc.main.vo.ReviewVO;

public interface ReviewDAO {
	public List<ReviewVO> reviewSelect();
	public ReviewVO reviewDetail(int reviewno);
	public int reviewInsert(ReviewVO vo);
}
