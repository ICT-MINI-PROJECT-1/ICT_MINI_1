package com.sc.main.service;

import java.util.List;

import com.sc.main.vo.ReservationVO;

public interface ReservService {
	public int insertReservation(ReservationVO vo);
	public ReservationVO selectReservation(String userid);
	public List<ReservationVO> selectReservationByRoom(int roomno);
}
