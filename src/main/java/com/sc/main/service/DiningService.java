package com.sc.main.service;

import java.util.List;

import com.sc.main.vo.DiningVO;

public interface DiningService {
	
	public List<DiningVO> selectDiningContent(String content);
	
}


