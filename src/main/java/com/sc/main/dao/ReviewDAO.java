package com.sc.main.dao;

import java.util.List;

import com.sc.main.vo.PagingVO;
import com.sc.main.vo.ReviewVO;

public interface ReviewDAO {
	public List<ReviewVO> reviewSelect(PagingVO pVO);
	public ReviewVO reviewDetail(int reviewno);
	public int reviewInsert(ReviewVO vo);
	public int reviewUpdate(ReviewVO vo);
	public int reviewDelete(int reviewno);
	
	public int reviewTotalRecord(PagingVO pVO);
}
