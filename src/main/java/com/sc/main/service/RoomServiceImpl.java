package com.sc.main.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sc.main.dao.RoomDAO;
import com.sc.main.vo.RoomVO;

@Service
public class RoomServiceImpl implements RoomService{
	@Inject
	RoomDAO dao;

	@Override
	public List<RoomVO> roomSelect(String loc) {
		return dao.roomSelect(loc);
	}
}
