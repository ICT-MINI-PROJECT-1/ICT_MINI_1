package com.sc.main.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sc.main.dao.AdminDAO;
import com.sc.main.vo.PagingVO;
import com.sc.main.vo.ReservationVO;
import com.sc.main.vo.ReviewVO;
import com.sc.main.vo.UserVO;

@Service
public class AdminServiceImpl implements AdminService{
	@Inject
	AdminDAO dao;

	@Override
	public List<UserVO> renderUserList(PagingVO pVO) {
		return dao.renderUserList(pVO);
	}

	@Override
	public int userTotalRecord(PagingVO pVO) {
		return dao.userTotalRecord(pVO);
	}

	@Override
	public List<ReservationVO> renderReservList(PagingVO pVO) {
		return dao.renderReservList(pVO);
	}

	@Override
	public int reservTotalRecord(PagingVO pVO) {
		return dao.reservTotalRecord(pVO);
	}

	@Override
	public List<ReviewVO> renderReviewList(PagingVO pVO) {
		return dao.renderReviewList(pVO);
	}
}
