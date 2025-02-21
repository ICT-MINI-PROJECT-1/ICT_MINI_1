package com.sc.main.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sc.main.dao.ReviewDAO;
import com.sc.main.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Inject
	ReviewDAO dao;

	@Override
	public List<ReviewVO> reviewSelect() {
		return dao.reviewSelect();
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
}
