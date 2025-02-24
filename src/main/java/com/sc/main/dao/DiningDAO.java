package com.sc.main.dao;

import java.util.List;

import com.sc.main.vo.DiningVO;

public interface DiningDAO {

	public List<DiningVO> selectDiningContent(String content);
	
}



