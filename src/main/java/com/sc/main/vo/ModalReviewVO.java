package com.sc.main.vo;

import java.util.List;

public class ModalReviewVO {
	private List<ReviewImgVO> rivo;
	private ReviewVO vo;
	public List<ReviewImgVO> getRivo() {
		return rivo;
	}
	public void setRivo(List<ReviewImgVO> rivo) {
		this.rivo = rivo;
	}
	public ReviewVO getVo() {
		return vo;
	}
	public void setVo(ReviewVO vo) {
		this.vo = vo;
	}
	@Override
	public String toString() {
		return "ModalReviewVO [rivo=" + rivo + ", vo=" + vo + "]";
	}
}
