package com.sc.main.service;

import java.util.List;

import com.sc.main.vo.PagingVO;
import com.sc.main.vo.ReservationVO;
import com.sc.main.vo.UserVO;

public interface AdminService {
	public List<UserVO> renderUserList(PagingVO pVO);
	public int userTotalRecord();
	public List<ReservationVO> renderReservList(PagingVO pVO);
	public int reservTotalRecord();
}
