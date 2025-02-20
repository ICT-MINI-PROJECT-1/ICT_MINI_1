package com.sc.main.dao;

import com.sc.main.vo.UserVO;

public interface UserDAO {
	public int userInsert(UserVO vo);
	
	public int loginIdChk(UserVO vo);
	
	public int loginPwChk(UserVO vo);
	
	public UserVO userSelect(String userid);
	
	public int userUpdate(UserVO vo);
}
