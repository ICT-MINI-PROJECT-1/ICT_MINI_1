package com.sc.main.service;

import java.util.List;

import com.sc.main.vo.RoomVO;

public interface RoomService {
	public List<RoomVO> roomSelect(String loc);
}
