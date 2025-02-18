package com.sc.main.service;

import java.util.List;

import com.sc.main.vo.RoomVO;
import com.sc.main.vo.WishlistVO;

public interface RoomService {
	public List<RoomVO> roomSelect(String loc);
	public RoomVO roomInfo(int roomno);
	public List<WishlistVO> wishSelect(String userid);
	public int insertWish(WishlistVO wVO);
	public int deleteWish(WishlistVO wVO);
}
