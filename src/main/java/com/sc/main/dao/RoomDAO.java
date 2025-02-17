package com.sc.main.dao;

import java.util.List;

import com.sc.main.vo.RoomVO;
import com.sc.main.vo.WishlistVO;

public interface RoomDAO {
	public List<RoomVO> roomSelect(String loc);
	public RoomVO roomInfo(int roomno);
	public List<WishlistVO> wishSelect(String userid);
}
