package com.sc.main.vo;

import java.util.List;

public class ReviewImgListVO {
	public ReviewVO rVO;
	public List<ReviewImgVO> lriVO;
	
	@Override
	public String toString() {
		return "ReviewImgListVO [rVO=" + rVO + ", lriVO=" + lriVO + "]";
	}
	public ReviewVO getrVO() {
		return rVO;
	}
	public void setrVO(ReviewVO rVO) {
		this.rVO = rVO;
	}
	public List<ReviewImgVO> getLriVO() {
		return lriVO;
	}
	public void setLriVO(List<ReviewImgVO> lriVO) {
		this.lriVO = lriVO;
	} 
}
