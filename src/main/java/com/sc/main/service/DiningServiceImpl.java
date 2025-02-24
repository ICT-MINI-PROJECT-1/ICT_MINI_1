package com.sc.main.service;

import java.util.List;

import javax.inject.Inject;

import com.sc.main.dao.DiningDAO;
import com.sc.main.vo.DiningVO;

public class DiningServiceImpl implements DiningService {

	@Inject
	DiningDAO dao;
	
	@Override
	public List<DiningVO> selectDiningContent(String content) {
		return dao.selectDiningContent(content);
	}	
}



