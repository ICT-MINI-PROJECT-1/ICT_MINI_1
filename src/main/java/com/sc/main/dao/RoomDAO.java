package com.sc.main.dao;

import java.util.List;

import com.sc.main.vo.RoomVO;

public interface RoomDAO {
	public List<RoomVO> roomSelect(String loc);
}
