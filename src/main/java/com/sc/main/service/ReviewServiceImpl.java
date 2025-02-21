package com.sc.main.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sc.main.dao.ReviewDAO;
import com.sc.main.vo.PagingVO;
import com.sc.main.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Inject
	ReviewDAO dao;

	@Override
	public List<ReviewVO> reviewSelect(PagingVO pVO) {
		return dao.reviewSelect(pVO);
	}

	@Override
	public ReviewVO reviewDetail(int reviewno) {
		return dao.reviewDetail(reviewno);
	}

	@Override
	public int reviewInsert(ReviewVO vo) {
		return dao.reviewInsert(vo);
	}

	@Override
	public int reviewUpdate(ReviewVO vo) {
		return dao.reviewUpdate(vo);
	}

	@Override
	public int reviewDelete(int reviewno) {
		return dao.reviewDelete(reviewno);
	}

	@Override
	public int reviewTotalRecord(PagingVO pVO) {
		return dao.reviewTotalRecord(pVO);
	}
}
