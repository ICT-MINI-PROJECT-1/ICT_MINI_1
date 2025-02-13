package com.sc.main.service;

import com.sc.main.vo.UserVO;

public interface UserService {
	public int userInsert(UserVO vo);
	
	public int loginIdChk(UserVO vo);
	
	public int loginPwChk(UserVO vo);
	
	public UserVO userSelect(String userid);
}
