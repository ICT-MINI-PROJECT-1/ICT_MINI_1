package com.sc.main.dao;

import java.util.List;

import com.sc.main.vo.ReservationVO;

public interface ReservationDAO {
	public int insertReservation(ReservationVO vo);
	public ReservationVO selectReservation(String userid);
	public List<ReservationVO> selectReservationByRoom(int roomno);
	public int deleteReservation(int reservno);
	public List<ReservationVO> selectLastReservation(String userid);
}
