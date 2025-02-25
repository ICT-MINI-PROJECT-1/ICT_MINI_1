package com.sc.main.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sc.main.dao.ReservationDAO;
import com.sc.main.vo.ReservationVO;

@Service
public class ReservServiceImpl implements ReservService {

	@Inject
	ReservationDAO dao;
	
	@Override
	public int insertReservation(ReservationVO vo) {
		return dao.insertReservation(vo);
	}

	@Override
	public ReservationVO selectReservation(String userid) {
		return dao.selectReservation(userid);
	}

	@Override
	public List<ReservationVO> selectReservationByRoom(int roomno) {
		return dao.selectReservationByRoom(roomno);
	}

	@Override
	public int deleteReservation(int reservno) {
		return dao.deleteReservation(reservno);
	}

	@Override
	public List<ReservationVO> selectLastReservation(String userid) {
		return dao.selectLastReservation(userid);
	}

	@Override
	public int selectRoomnoByReservNo(int reservno) {
		return dao.selectRoomnoByReservNo(reservno);
	}

}
