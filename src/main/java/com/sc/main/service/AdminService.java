package com.sc.main.service;

import java.util.List;

import com.sc.main.vo.PagingVO;
import com.sc.main.vo.ReservationVO;
import com.sc.main.vo.ReviewVO;
import com.sc.main.vo.UserVO;

public interface AdminService {
	public List<UserVO> renderUserList(PagingVO pVO);
	public int userTotalRecord(PagingVO pVO);
	public List<ReservationVO> renderReservList(PagingVO pVO);
	public int reservTotalRecord(PagingVO pVO);
	public List<ReviewVO> renderReviewList(PagingVO pVO);
	public int reviewTotalRecord(PagingVO pVO);
}
