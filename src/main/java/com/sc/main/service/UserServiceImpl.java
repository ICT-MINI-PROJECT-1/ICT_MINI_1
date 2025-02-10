package com.sc.main.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sc.main.dao.UserDAO;
import com.sc.main.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	@Inject
	UserDAO dao;

	@Override
	public int userInsert(UserVO vo) {
		return dao.userInsert(vo);
	}

	@Override
	public int loginIdChk(UserVO vo) {
		return dao.loginIdChk(vo);
	}

	@Override
	public int loginPwChk(UserVO vo) {
		return dao.loginPwChk(vo);
	}
}
