package com.sc.main.service;

import java.util.List;

import com.sc.main.vo.RoomVO;
import com.sc.main.vo.UserVO;

public interface UserService {
	public int userInsert(UserVO vo);
	
	public int loginIdChk(UserVO vo);
	
	public int loginPwChk(UserVO vo);
	
	public UserVO userSelect(String userid);
	
	public int userUpdate(UserVO vo);
	
	public List<RoomVO> selectWishList(String userid);
}
