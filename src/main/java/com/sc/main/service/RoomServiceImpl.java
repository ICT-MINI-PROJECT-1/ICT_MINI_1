package com.sc.main.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sc.main.dao.RoomDAO;
import com.sc.main.vo.RoomVO;
import com.sc.main.vo.WishlistVO;

@Service
public class RoomServiceImpl implements RoomService{
	@Inject
	RoomDAO dao;

	@Override
	public List<RoomVO> roomSelect(String loc) {
		return dao.roomSelect(loc);
	}

	@Override
	public RoomVO roomInfo(int roomno) {
		return dao.roomInfo(roomno);
	}

	@Override
	public List<WishlistVO> wishSelect(String userid) {
		return dao.wishSelect(userid);
	}
}
