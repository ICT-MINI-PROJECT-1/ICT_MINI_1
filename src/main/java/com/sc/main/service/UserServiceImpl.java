package com.sc.main.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sc.main.dao.UserDAO;
import com.sc.main.vo.RoomVO;
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

	@Override
	public UserVO userSelect(String userid) {
		return dao.userSelect(userid);
	}

	@Override
	public int userUpdate(UserVO vo) {
		return dao.userUpdate(vo);
	}

	@Override
	public List<RoomVO> selectWishList(String userid) {
		return dao.selectWishList(userid);
	}

	@Override
	public int userDelete(String userid) {
		return dao.userDelete(userid);
	}
}
